#! /usr/bin/env sh
set -e

# sh sign-in.sh

ENV_FILE_PATH='./simple_fastAPI/app/.env.local'
# Load the .env file
if [ -f $ENV_FILE_PATH ]; then
    export $(cat $ENV_FILE_PATH | sed 's/#.*//g' | xargs)
fi

 
IMAGE_NAME=$APP_NAME
  
Container_Registry=$digitalocean_registry 
echo "Container_Registry = $Container_Registry" 
echo "APP_NAME = $APP_NAME"  
echo "image_tag = $IMAGE_TAGE" 
echo "PROJECT_FOLDER_NAME = $PROJECT_FOLDER_NAME" 

echo "=========== Start build =============="
echo "" 
echo "docker build  -t $IMAGE_NAME:$IMAGE_TAGE -f ./$PROJECT_FOLDER_NAME/app/Dockerfile ."  
docker build  -t $IMAGE_NAME:$IMAGE_TAGE -f ./$PROJECT_FOLDER_NAME/app/Dockerfile . &&
echo ""
echo ""
echo ""
echo "=========== end build ================"

echo "=========== Start tag ================" 
echo ""
docker tag $IMAGE_NAME:$IMAGE_TAGE $Container_Registry/$IMAGE_NAME:$IMAGE_TAGE 
echo ""
echo ""
echo "" 
echo "=========== end tag ================"


# docker run --name worker2_app -p 8081:8081  --env-file simple_fastAPI/app/.env.local  -it  -t docker.io/library/rag-app:0-0-0-1 

 
echo "=========== Start push ================"
echo "" 
docker push $Container_Registry/$IMAGE_NAME:$IMAGE_TAGE
echo ""
echo ""
echo "" 
echo "=========== end push ================" 
now=$(date +"%d-%m-%Y %T")
echo "Current time : $now"
echo "=========== deploy done .. ========== " 
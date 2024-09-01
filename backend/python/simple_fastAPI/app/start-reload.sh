#! /usr/bin/env sh
set -e
  

# Start Uvicorn    
uvicorn app.main:app --host 0.0.0.0 --port $APP_PORT 

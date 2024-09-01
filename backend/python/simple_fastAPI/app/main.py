
from fastapi import FastAPI  , APIRouter

app = FastAPI( title=f"RAG APP APIs",  )
router_ = APIRouter()

@router_.get("/api1",description="""
THIS IS DESCRIION api1 \n
YOU SHOULD SEND   B C
             """)
def api1(): 
    return {"result": "result api1"}



def Func1():
    return "This is Func1"
  
@router_.get("/api2",description="""
THIS IS DESCRIION api2 \n
YOU SHOULD SEND A  C \n
             """)
def api2(): 
    return Func1()


app.include_router(router_)
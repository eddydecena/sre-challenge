from fastapi import FastAPI
import pickle
import numpy as np

app = FastAPI()

model_file = open('pickle_model.pkl', 'rb') 
model = pickle.load(model_file)


@app.get("/")
async def root(x: str = "0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0"):
	inputs = x.split(',')
	inputs = [int(el) for el in inputs]
	inputs = np.array([inputs])
	result = model.predict(inputs)[0]
	return {"prediction": int(result)}
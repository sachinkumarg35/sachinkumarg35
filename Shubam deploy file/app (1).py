import numpy as np
from flask import Flask, request, jsonify, render_template
import pickle

app = Flask(__name__)
model = pickle.load(open('model.pkl', 'rb'))

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/predict',methods=['POST'])
def predict():
    '''
    For rendering results on HTML GUI
    '''
    int_features = (int(x) for x in request.form.values())
    final_features = int_features
    prediction = model.forecast(final_features)

    output = round(prediction)
    output = int(output)
    return render_template('index.html', prediction_text='The Availability of the Beds for the upcoming days will be $ {}'.format(output))


if __name__ == "__main__":
    app.run(debug=True)
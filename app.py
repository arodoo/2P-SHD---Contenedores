from flask import Flask, jsonify, request

app = Flask(__name__)

@app.route('/')
def welcome():
    return "Bienvenido a mi API de predicción!\Soy Arodi desde la UTCV"

@app.route('/predict', methods=['POST'])
def predict():
    data = request.get_json()
    result = {"prediction": True}
    return jsonify(result)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')

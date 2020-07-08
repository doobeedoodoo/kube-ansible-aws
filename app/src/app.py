from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/greet', methods=['GET', 'POST'])
def login():
    data = []
    if request.method == 'GET':
        data = [dict(id='1', greet='hello')]        
        response = jsonify(data)
        response.status_code = 200
    elif request.method == 'POST':
        data = [dict(id='1', greet='hi')]
        response = jsonify(data)
        response.status_code = 200
    return response

if __name__ == '__main__':
    app.run(debug=True, host='127.0.0.1')
from flask import Flask, jsonify

app = Flask(__name__)

# Simple counter
counter = 0

@app.route('/')
def home():
    return "Hello from DevOps CI/CD Pipeline!"

@app.route('/counter')
def count():
    global counter
    counter += 1
    return jsonify({"counter": counter})

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)

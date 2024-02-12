# hello.py
# import librabries - flask
from flask import Flask

# instantialting app
app = Flask(__name__)

# defining a route
@app.route('/')
def hello():
    return 'Hello, World!'

if __name__ == '__main__':
    app.run(port=3000,debug=True)
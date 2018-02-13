from flask import Flask
app = Flask(__name__)


@app.route('/')
def hello_world():
    return 'Hello, World!'


# This is because I hate seeing errors for no reason.
@app.route('/favicon.ico')
def favicon():
    return ''

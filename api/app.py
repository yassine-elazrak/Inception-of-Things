from flask import Flask
app = Flask(__name__)
@app.route('/')
def ping():
    return 'hello api', 200


if __name__ == '__main__':
    app.run('0.0.0.0', debug=True)

from flask import Flask, jsonify, current_app, request

app = Flask(__name__)


@app.route('/')
def version():
    return jsonify(data='cool bro v0.{}'.format(1))

@app.route('/reload', methods=['POST'])
def reload():
    current_app.logger.warning('Restarting')
    shutdown_server()
    return jsonify(data='echo off')

def shutdown_server():
    func = request.environ.get('werkzeug.server.shutdown')
    if func is None:
        raise RuntimeError('Not running with the Werkzeug Server')
    func()

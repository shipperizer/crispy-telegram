import os

from flask import Flask, jsonify, current_app, request

app = Flask(__name__)


@app.route('/')
def version():
    return jsonify(data='cool bro v0.{}'.format(1))


@app.route('/reload', methods=['POST'])
def reload():
    current_app.logger.warning('Restarting')
    os.system('pkill gunicorn')
    return jsonify(data='echo off')

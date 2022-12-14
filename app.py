from datetime import datetime
from flask import Flask, render_template, request, redirect, url_for, send_from_directory
from prometheus_flask_exporter import PrometheusMetrics
import os

app = Flask(__name__)
PrometheusMetrics(app)

@app.route('/')
def index():
   print('Request for index page received')
   return render_template('index.html')

@app.route('/favicon.ico')
def favicon():
    return send_from_directory(os.path.join(app.root_path, 'static'),
                               'favicon.ico', mimetype='image/vnd.microsoft.icon')

@app.route('/hello', methods=['POST'])
def hello():
   name = request.form.get('name')

   if name:
       print('Request for hello page received with name=%s' % name)
       return render_template('hello.html', name = name, message = get_message())
   else:
       print('Request for hello page received with no name or blank name -- redirecting')
       return redirect(url_for('index'))

def add(a, b):
    return a + b

def get_message():
    return "It's a beautiful day. I'm glad you're here."

if __name__ == '__main__':
   app.run()
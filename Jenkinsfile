pipeline {
    agent { docker { image 'python:3.6-stretch' } }
    stages {
        stage('build') {
            steps {
                sh 'COPY . /tmp/app'
                sh 'RUN pip install --upgrade pip'
                sh 'RUN cd /tmp/app'
                sh 'RUN pip install -r requirements.txt'
            }
        }
    }

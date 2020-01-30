pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                sh 'echo $GIT_COMMIT'
                sh 'docker build -t jenkins_check .'
            }
        }
    }
}

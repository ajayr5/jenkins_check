def REPOSITORY_URI
def COMMIT_HASH
def IMAGE_TAG
pipeline {
    agent any
    stages {
        stage ('pre_build') {
            steps {
                script {
                    REPOSITORY_URI='426132155336.dkr.ecr.us-east-2.amazonaws.com/jenkinsautopush'
                    IMAGE_TAG=GIT_COMMIT
                }
            }          
        }
        stage('build') {
            steps {
                echo "Build started on ${java.time.LocalDateTime.now()}"
                echo 'Building the Docker image...'
                sh "docker build -t ${REPOSITORY_URI}:latest ."
                sh "docker tag ${REPOSITORY_URI}:latest ${REPOSITORY_URI}:${IMAGE_TAG}"
            }
        }
        stage('post-build') {
            steps {
                echo "Build completed on ${java.time.LocalDateTime.now()}"
                echo 'Pushing the Docker images...'
                sh '$(aws ecr get-login --region us-east-2 --no-include-email)'
                sh "docker push ${REPOSITORY_URI}:latest"
                sh "docker push ${REPOSITORY_URI}:${IMAGE_TAG}"
                echo 'Writing image definitions file...'
                sh label: '', script: 'echo "[{"name":"${JOB_NAME}","imageUri":"$REPOSITORY_URI:$IMAGE_TAG"}]" > imagedefinitions.json'
            }
        }
    }
}

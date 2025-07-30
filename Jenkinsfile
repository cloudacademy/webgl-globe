pipeline {
    agent {
        node {
            label 'docker'
        }
    }

    environment {
        REPO_URL = 'https://github.com/cloudacademy/webgl-globe'
        CONTAINER_NAME = 'globe2025'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: "${REPO_URL}"
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    def TAG = sh(script: "echo ${env.GIT_COMMIT} | cut -c1-6", returnStdout: true).trim()
                    sh "docker build -t cloudacademydevops/globe2025:${TAG} ."
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    def TAG = sh(script: "echo ${env.GIT_COMMIT} | cut -c1-6", returnStdout: true).trim()
                    sh """
                        docker stop ${CONTAINER_NAME} || true
                        docker rm ${CONTAINER_NAME} || true
                        docker run -d --name ${CONTAINER_NAME} -p 8888:80 cloudacademydevops/globe2025:${TAG}
                    """
                }
            }
        }
    }
}

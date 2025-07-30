@Library('docker-pipeline@main') _

pipeline {
    agent {
        node {
            label 'docker'
        }
    }

    environment {
        REPO_URL = 'https://github.com/cloudacademy/webgl-globe'
        CONTAINER_NAME = 'globe2025'
        IMAGE_NAME = 'cloudacademydevops/globe2025'
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
                    def tag = sh(script: "echo ${env.GIT_COMMIT} | cut -c1-6", returnStdout: true).trim()
                    dockerPipeline.buildImage(env.IMAGE_NAME, tag)
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    def tag = sh(script: "echo ${env.GIT_COMMIT} | cut -c1-6", returnStdout: true).trim()
                    dockerPipeline.runContainer(env.CONTAINER_NAME, env.IMAGE_NAME, tag)
                }
            }
        }
    }
}
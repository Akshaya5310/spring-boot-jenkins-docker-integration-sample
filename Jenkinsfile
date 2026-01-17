pipeline {
    agent any

    tools {
        maven 'Maven-3'
    }

    environment {
        PATH = "/bin:/usr/bin:/opt/homebrew/bin:/usr/local/bin"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scmGit(
                    branches: [[name: '*/main']],
                    userRemoteConfigs: [[
                        url: 'https://github.com/Akshaya5310/spring-boot-jenkins-docker-integration-sample'
                    ]]
                )
            }
        }

        stage('Build Maven') {
            steps {
                sh 'mvn clean install'
            }
        }

        stage('Verify Docker') {
            steps {
                sh '''
                  which sh
                  which docker
                  docker --version
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t springbootjenkinsdocker/spring-boot-jenkins-docker-integration-sample .'
            }
        }

        stage('Push image to Hub') {
            steps {
                script {
                    // Login to DockerHub using credentials
                    withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
                        sh "docker login -u akshay5544 -p ${dockerhubpwd}"
                    }

                    // Tag image with your DockerHub username
                    sh 'docker tag springbootjenkinsdocker/spring-boot-jenkins-docker-integration-sample akshay5544/spring-boot-jenkins-docker-integration-sample:latest'

                    // Push image
                    sh 'docker push akshay5544/spring-boot-jenkins-docker-integration-sample:latest'
                }
            }
        }

    }
}

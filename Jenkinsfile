pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
        RepositoryDockerHub = 'fcongedo'
        NameContainer = "portfolio-website"
    }
    stages {
        stage('Build') {
            steps {
                script {
                    dir('portfolio') {
                        sh "docker build -t ${env.RepositoryDockerHub}/${env.NameContainer}:${env.BUILD_NUMBER} ."
                    }
                }
            }
        }
    }
}

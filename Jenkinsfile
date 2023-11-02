pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
        RepositoryDockerHub = 'fcongedo'
        NameContainer = "portfolio-website"
    }
    stages {
        stage('Install Hadolint') {
            steps {
                // Crea un directorio ~/bin si no existe
                sh 'mkdir -p ~/bin'
                // Descarga e instala Hadolint en ~/bin
                sh 'wget https://github.com/hadolint/hadolint/releases/download/v2.7.0/hadolint-Linux-x86_64 -O ~/bin/hadolint'
                sh 'chmod +x ~/bin/hadolint'
            }
        }
        stage('Lint Dockerfile') {
            steps {
                // Analizar el Dockerfile con Hadolint desde el directorio ~/bin
                script {
                    def hadolintExitCode = sh(script: "~/bin/hadolint portfolio/Dockerfile", returnStatus: true)
                    if (hadolintExitCode != 0) {
                        currentBuild.result = 'FAILURE'
                    }
                }
            }
        }
    }
}

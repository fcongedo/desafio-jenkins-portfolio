pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
        RepositoryDockerHub = 'fcongedo'
        NameContainer = "portfolio-website"
    }
    stages {
        stage('Install Tools') {
            steps {
                // Instala Hadolint en el agente
                sh 'wget https://github.com/hadolint/hadolint/releases/download/v2.7.0/hadolint-Linux-x86_64 -O hadolint'
                sh 'chmod +x hadolint'
                sh 'mv hadolint /usr/local/bin'
            }
        }
        stage('Lint Dockerfile') {
            steps {
                // Analizar el Dockerfile con Hadolint
                script {
                    def hadolintExitCode = sh(script: "hadolint portfolio/Dockerfile", returnStatus: true)
                    if (hadolintExitCode != 0) {
                        currentBuild.result = 'FAILURE'
                    }
                }
            }
        }
    }
}
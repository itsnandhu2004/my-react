pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/itsnandhu2004/my-react.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t html-project .'
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    sh 'docker push html-project'
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    sh '''
                    kubectl apply -f kubernetes/deployment.yaml
                    kubectl apply -f kubernetes/service.yaml
                    '''
                }
            }
        }
    }
}

pipeline {
    agent any

    environment {
        DOCKER_HUB_REPO = 'itsnandhu2004/portfolio'  // Docker Hub repository name
        DOCKER_IMAGE = 'my-react-app'    // Docker image name
        DOCKER_CREDENTIALS_ID = 'docker-hub-cred'  // Jenkins credentials ID for Docker Hub
        K8S_CONFIG = '/home/nandhini/.kube/config' // Path to your Kubernetes kubeconfig (if necessary)
    }

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/itsnandhu2004/my-react.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Building the Docker image
                    sh 'docker build -t $DOCKER_HUB_REPO/$DOCKER_IMAGE:latest .'
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                script {
                    // Log in to Docker Hub using Jenkins credentials
                    withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS_ID, usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
                    }
                }
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    // Push the Docker image to Docker Hub
                    sh 'docker push $DOCKER_HUB_REPO/$DOCKER_IMAGE:latest'
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    // Set the Kubeconfig environment variable if necessary
                    withEnv(["KUBECONFIG=$K8S_CONFIG"]) {
                        // Deploy the image to Kubernetes
                        sh 'kubectl set image deployment/my-react-app my-react-app=$DOCKER_HUB_REPO/$DOCKER_IMAGE:latest --record'
                    }
                }
            }
        }
    }

    post {
        success {
            echo "Docker image successfully pushed and Kubernetes deployment updated!"
        }

        failure {
            echo "The pipeline failed. Please check the logs."
        }
    }
}

pipeline {
    agent any 
    tools {
        terraform 'terraform'
    }
    stages{
        stage ('Github Checkout') {
            steps {
                git credentialsId: 'leosvarghese', url: 'https://github.com/leosvarghese/project'
            }
        }
        stage ('Terraform init') {
            steps {
                sh 'terraform init'
            }
        }
        stage ('Terraform apply') {
            steps {
                script{
                    withCredentials([azureServicePrincipal('15b2b567-05be-40a5-b4e7-0dd236cffbf8')]) 
                        sh 'terraform apply -auto-approve'
                }
            }
        }
    }
} 

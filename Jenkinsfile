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
                sh 'terraform apply --auto-approve'
            }
        }
    }
} 

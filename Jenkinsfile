pipeline {
    agent any 
    tools {
        terraform 'terraform'
    }
    environment {
        MY_CRED = credentials('test')
    }
    stages{
        stage ('Github Checkout') {
            steps {
                git credentialsId: 'leosvarghese', url: 'https://github.com/leosvarghese/project'
            }
        }
        stage('azlogin') {
            steps {
                    sh 'az login --service-principal -u $MY_CRED_CLIENT_ID -p $MY_CRED_CLIENT_SECRET -t $MY_CRED_TENANT_ID'
                }
            }
        stage ('Terraform init') {
            steps {
                sh 'terraform init'
            }
        }
        stage ('Terraform apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
} 

pipeline {
    agent any 
    tools {
        terraform 'terraform'
    }
    environment {
        MY_CRED = credentials('15b2b567-05be-40a5-b4e7-0dd236cffbf8')
    }
    stages{
        stage ('Github Checkout') {
            steps {
                git credentialsId: 'leosvarghese', url: 'https://github.com/leosvarghese/project'
            }
        }
        stage('build') {
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

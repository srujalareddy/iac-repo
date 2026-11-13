
pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/srujalareddy/iac-repo.git'
            }
        }

        stage('Check GCP Authentication') {
            steps {
                sh '''
                    echo "Checking GCP VM Service Account..."
                    gcloud auth list
                    gcloud config get-value project

                    echo "Checking ADC access..."
                    gcloud auth application-default print-access-token
                '''
            }
        }

        stage('Terraform Init') {
            steps {
                sh '''
                    terraform init -input=false -reconfigure
                '''
            }
        }

        stage('Terraform Validate') {
            steps {
                sh '''
                    terraform validate
                '''
            }
        }

        stage('Terraform Plan') {
            steps {
                sh '''
                    terraform plan -input=false -out=tfplan
                '''
            }
        }

        stage('Terraform Apply') {
            steps {
                sh '''
                    terraform apply -input=false -auto-approve tfplan
                '''
            }
        }
    }
}

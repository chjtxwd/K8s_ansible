pipeline {
  agent any
  stages {
    stage('terraform init and apply') {
      steps {
        sh '''terraform init 
terraform apply'''
      }
    }

    stage('triger ansible') {
      steps {
        sh 'ansible-playbook'
      }
    }

  }
}
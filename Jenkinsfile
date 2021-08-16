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
      parallel {
        stage('triger ansible') {
          steps {
            sh 'ansible-playbook'
          }
        }

        stage('show error') {
          steps {
            error 'error'
          }
        }

        stage('finish') {
          steps {
            sh 'ls'
          }
        }

      }
    }

  }
}
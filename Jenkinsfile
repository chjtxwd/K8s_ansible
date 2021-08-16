pipeline {
  agent none
  stages {
    stage('step 1') {
      steps {
        echo 'test'
      }
    }

    stage('step 2') {
      steps {
        sleep 5
      }
    }

    stage('step3') {
      steps {
        error 'warning'
      }
    }

  }
}
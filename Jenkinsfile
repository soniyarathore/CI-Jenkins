pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  stages {
    stage('Build') {
      steps {
        sh './jenkins/myscript.sh 3 testfile.txt'
      }
    }
    stage('Test') {
      steps {
        sh 'bats myscript.bats'
      }
    }
  }
}

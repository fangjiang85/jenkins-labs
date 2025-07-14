pipeline {
  agent {
    kubernetes {
      label 'k8s-agent'
      defaultContainer 'jnlp'
    }
  }
  stages {
    stage('Clone Repo') {
      steps {
        echo "Repo cloned automatically by Jenkins."
        sh 'ls -la'
      }
    }
    stage('Build or Test') {
      steps {
        echo "Run your build/test here"
        sh 'echo Hello from Jenkinsfile in Git!'
      }
    }
  }
}

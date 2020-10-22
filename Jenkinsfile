pipeline {
  agent any 
  stages {
    stage('Build the website') {
      steps{
        sh "scripts/build.sh"
      }
    }

    stage('Run Unit Tests'){
      steps{
        sh "scripts/unit_tests.sh"
      } 
    }

    stage('Deploy the website'){
      steps{
        sh "scripts/deploy_website.sh"
      }
    }
  }
}

pipeline {
  agent any 
  stages {
    stage('Build the website') {
      steps{
        sh "$PWD/scripts/build.sh"
      }
    }

    stage('Run Unit Tests'){
      steps{
        sh "$PWD/scripts/unit_tests.sh"
      } 
    }

    stage('Deploy the website'){
      steps{
        sh "$PWD/scripts/deploy_website.sh"
      }
    }
  }
}

pipeline {
  # Any agent on any slave to build this job
  agent any 
  # Stages that need to run
  stages {
    stage('Build the website') {
      steps{
	# When a Jenkins slave runs this, it's going to open up a shell and run the script
        sh "$PWD/scripts/build.sh"
      }
    }

    stage('Run Unit Tests'){
      steps{
        # When a Jenkins slave runs this, it's going to open up a shell and run the script
        sh "$PWD/scripts/unit_tests.sh"
      } 
    }

    # Don't run Integration Tests for now
    # stage('Run Integration Tests'){
    #  
    # }

    stage('Deploy the website'){
      steps{
        sh "$PWD/scripts/deploy_website.sh"
      }
    }
  }
}

pipeline {
 
  agent {
    label 'master'
  }
      
  environment {

    SONAR = sh(script: "if [ -f sonar-project.properties ]; then  echo true; fi", returnStdout: true).trim() 
    RELEASE_CODE =  sh(script: "if [ -f RELEASE ]; then  echo true; else echo false; fi", returnStdout: true).trim() 

  }
 
  options {
        buildDiscarder(logRotator(numToKeepStr:'5'))
  }
  
  stages {

    stage ('Checkout code') {
      steps {
        checkout scm
	sh 'printenv'
     }
    }

    stage ('Analyse code') {
      //when { anyOf { branch 'develop'; branch 'feature/*'  } } 
      when { anyOf { branch 'PR-*'  } }
      failFast true
      parallel {
       stage('YAML-Ansible Lint') {
         steps {
          sh '''
	   yamllint . && ansible-lint .
          '''
         }
       }
       stage('Sonarqube') {
         when  { environment name: 'SONAR', value: 'true'}
         environment {
           scannerHome = tool 'SonarQubeScanner'
         }
         steps {
           withSonarQubeEnv('sonarqube') {
             sh "${scannerHome}/bin/sonar-scanner"
           }
           timeout(time: 10, unit: 'MINUTES') {
            waitForQualityGate abortPipeline: true
           }
         }
        } 
      }
     }
 
    stage ('Unit tests') {
      when { anyOf { branch 'feature/*' ; branch 'PR-*' } }
      steps {
        sh '''
	  /usr/local/bin/ansible-unit-test-role
        '''
      }
      post {
        always {
            junit 'reports/*.xml'
        }
      }
    }
   stage('Integration Tests') {
    //when { branch 'develop' }
    when { branch 'PR-*' }
    steps {
	sh '''
	echo tests integration a definir
	'''
    } 
  }

    stage('Release code') {
      when {
        branch 'develop'
        allOf {
          environment name: 'RELEASE_CODE', value: 'true'
        }
     }
      steps {
	sh '''
	 /usr/local/bin/release-code
	'''
	//mail to: 'team@home.local',
        //   subject: "Pipeline: ${currentBuild.fullDisplayName}",
        // body: "Release done : ${env.BUILD_URL}"
      }
      post {
        always {
	    archiveArtifacts artifacts: 'build/*', fingerprint: true
        }
        success {
          slackSend color: 'good',
             channel: '#version',
             message: "Nouvelle version du role : ${GIT_URL}"
        }
      }
    }
   }
   post {
        success {
            echo 'archive si release'
	    //deleteDir()
        }
        failure {
	  slackSend color: 'danger',
               message: "Pipeline Statut=${currentBuild.currentResult} - Erreur=${env.RUN_DISPLAY_URL} - JOB=${JOB_URL}"
        }
	unstable {
          slackSend color: 'danger',
               message: "Pipeline Statut=${currentBuild.currentResult} - Erreur=${env.RUN_DISPLAY_URL} - JOB=${JOB_URL}"
        }
    }
}

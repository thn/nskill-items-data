pipeline {
    agent {
        label 'linux'
    }
	options {
		buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '', numToKeepStr: '5'))
	}
	stages {
		stage ('Build NSkill Zip File') {
			steps {
                sh '''
                make build
                '''
			}
		}
		stage ('Upload to THN Server') {
			steps {
                sh '''
                # Upload step (Test 3)
                '''
			}
		}
	}
}
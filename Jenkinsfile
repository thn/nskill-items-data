pipeline {
    agent {
        label 'linux'
    }
	options {
		buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '', numToKeepStr: '5'))
	}
    environment {
        DEPLOY_LOCATION = credentials('nskill-deploy-path')
    }
	stages {
		stage ('Build NSkill Zip File') {
			steps {
                sh '''
                make build
                '''
			}
		}
		stage ('Publish to THN server') {
			steps {
                sshPublisher(publishers: [sshPublisherDesc(configName: 'THN Server',
                    transfers: [sshTransfer(cleanRemote: false,
                        excludes: '',
                        execCommand: '',
                        execTimeout: 120000,
                        flatten: false,
                        makeEmptyDirs: false,
                        noDefaultExcludes: false,
                        patternSeparator: '[, ]+',
                        remoteDirectory: env.DEPLOY_LOCATION,
                        remoteDirectorySDF: false,
                        removePrefix: '',
                        sourceFiles: 'NSkillV2.zip')],
                     usePromotionTimestamp: false,
                     useWorkspaceInPromotion: false,
                     verbose: false)])
			}
		}
	}
}
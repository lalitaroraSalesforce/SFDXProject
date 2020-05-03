pipeline {
    agent any
    environment {
        ADX_IMAGE = 'appirio/dx:latest'
        SF_DEPLOY__ENABLED = true

    }


    stages {

        stage('Start Scripts') {
            agent {
                docker {
                    image '$ADX_IMAGE'
                    alwaysPull true
                }
            }
            steps {
                checkout scm
                //sh "adx metadata:unique --sourcepath force-org/default/metadata,force-org/sample/metadata"
                sh "sfdx --version"
                
            }
        }
    }
}

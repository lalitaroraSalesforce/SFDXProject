
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
               
                script {

                    stage('Establish JWT SFDX Connect') {

                        
                    }

                    stage('Convert Salesforce DX and Store in SRC Folder') {

                        

                    }

                    stage('Push To Target Org') {

                         

                    }
                }
            }
        }
    }
}

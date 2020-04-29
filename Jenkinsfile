pipeline {
  agent any
  environment {
      ADX_IMAGE = 'appirio/dx:latest'
      SF_DEPLOY__ENABLED = true 
  }
  stages {
 
      stage('master') {
          
          stages{
               
              stage('deploy_to_devOrg'){
                  agent {
                      docker {
                          image '$ADX_IMAGE'
                          alwaysPull true
                      }
                  }
                  steps {
                     // sh "adx metadata:unique --sourcepath force-org/default/metadata,force-org/sample/metadata"
                     // sh "adx deploy:source --sourcepath force-org/default/metadata,force-org/sample/metadata --testlevel RunLocalTests --targetalias UAT"
                        sh "adx --help"
                  }
               } 
            }
        } 
    }
}

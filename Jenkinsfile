pipeline {
  agent any
  environment {
      ADX_IMAGE = 'appirio/dx:latest'
      SF_DEPLOY__ENABLED = true
      GIT_USERNAME = credentials('git-username')
      GIT_TOKEN = credentials('git-token')
      SF_ORG__SIT__AUTH_URL = credentials('sit-auth-url')
      SF_ORG__UAT__AUTH_URL = credentials('uat-auth-url')
      SF_ORG__PROD__AUTH_URL = credentials('prod-auth-url')
      ADX_REFRESH_TOKEN = credentials('adx-refresh-token')
  }
  stages {
 
      stage('master') {
          when { branch 'master' }
          stages{
               
              stage('deploy_to_devOrg'){
                  agent {
                      docker {
                          image '$ADX_IMAGE'
                          alwaysPull true
                      }
                  }
                  steps {
                      sh "adx metadata:unique --sourcepath force-org/default/metadata,force-org/sample/metadata"
                      sh "adx deploy:source --sourcepath force-org/default/metadata,force-org/sample/metadata --testlevel RunLocalTests --targetalias UAT"
                  }
              } 
          }
      } 
    }
}

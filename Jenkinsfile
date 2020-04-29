#!groovy

import groovy.json.JsonSlurperClassic
node {

    def BUILD_NUMBER = env.BUILD_NUMBER
    def RUN_ARTIFACT_DIR = "tests/${BUILD_NUMBER}"
    def SFDC_USERNAME
/*
    def HUB_ORG = env.HUB_ORG_DH
    def SFDC_HOST = env.SFDC_HOST_DH
    def JWT_KEY_CRED_ID = env.JWT_CRED_ID_DH
    def CONNECTED_APP_CONSUMER_KEY = env.CONNECTED_APP_CONSUMER_KEY_DH
*/
    
    def HUB_ORG = 'lalitarora.sf@gmail.com'
    def SFDC_HOST = 'https://login.salesforce.com'
    def JWT_KEY_CRED_ID = 'e291bce3-a69b-4b39-ada4-aabf007549d9'
    def CONNECTED_APP_CONSUMER_KEY = '3MVG9ZL0ppGP5UrDARg58VXx7n5Z8skJa5gBQSgIPWSXgP9m9WAuFSHVEKvVyAhcDgdfP5e8ojkVuJqQe25Ww'
    
    println 'KEY IS'
    println JWT_KEY_CRED_ID
    println HUB_ORG
    println SFDC_HOST
    println CONNECTED_APP_CONSUMER_KEY

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
                        sh "sfdx --version"
                  }
               } 
            }
        } 
    }
}

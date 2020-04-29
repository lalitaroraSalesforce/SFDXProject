#!groovy

import groovy.json.JsonSlurperClassic

def BUILD_NUMBER = env.BUILD_NUMBER
def SFDC_HOST = 'https://login.salesforce.com'
def SFDC_ORG_ALIAS = 'DemoSandbox'
def SFDC_HUB_USERNAME = 'SFDC_HUB_USERNAME'
def JWT_KEY = 'JWT_KEY'
def CONSUMER_KEY = 'CON_KEY'
def RUN_ARTIFACT_DIR = "tests/${BUILD_NUMBER}"
def SFDC_USERNAME




println JWT_KEY
println SFDC_HUB_USERNAME
println SFDC_HOST
println CONSUMER_KEY

pipeline {
    agent any
    environment {
        ADX_IMAGE = 'appirio/dx:latest'
        SF_DEPLOY__ENABLED = true

    }
	 
    stages {

        stage('master') {

            stages {

                stage('deploy_to_devOrg') {
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
						script {
							withCredentials([
								file(credentialsId: JWT_KEY, variable: 'jwt_key_file'), 
								string(credentialsId: SFDC_HUB_USERNAME, variable: 'username'),
								string(credentialsId: CONSUMER_KEY, variable: 'consumer_key')
							]) {
								rc = sh returnStatus: true, script: "sfdx force:auth:jwt:grant --clientid ${consumer_key} --username ${username} --jwtkeyfile ${jwt_key_file} --setdefaultdevhubusername --instanceurl ${SFDC_HOST}  --setalias ${SFDC_ORG_ALIAS}"
								if (rc != 0){
									error 'ORG authorization failed'
								}
								dmsg = sh returnStdout: true, script: "sfdx force:config:set defaultusername=${SFDC_ORG_ALIAS} --global"
								print dmsg
								lmsg = sh returnStdout: true, script: "sfdx force:org:list --all"
								print lmsg
							}
						}
                    }
                }
            }
        }
    }
}

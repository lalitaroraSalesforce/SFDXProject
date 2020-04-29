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
    def JWT_KEY_CRED_ID = '409a6643-2205-4031-a09f-1f9478fd7503'
    def CONNECTED_APP_CONSUMER_KEY = '3MVG9ZL0ppGP5UrDARg58VXx7n5Z8skJa5gBQSgIPWSXgP9m9WAuFSHVEKvVyAhcDgdfP5e8ojkVuJqQe25Ww'

    println 'KEY IS'
    println JWT_KEY_CRED_ID
    println HUB_ORG
    println SFDC_HOST
    println CONNECTED_APP_CONSUMER_KEY
}

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
                        // sh "adx metadata:unique --sourcepath force-org/default/metadata,force-org/sample/metadata"
                        // sh "adx deploy:source --sourcepath force-org/default/metadata,force-org/sample/metadata --testlevel RunLocalTests --targetalias UAT"
                        sh "sfdx --version"
                        stage('checkout source code ') {
                            checkout scm
                        }

                        withCredentials([file(credentialsId: JWT_KEY_CRED_ID, variable: 'jwt_key_file')]) {
                            stage('Create Scratch Org') {

                                sh "sfdx force:auth:jwt:grant --clientid ${CONNECTED_APP_CONSUMER_KEY} --username ${HUB_ORG} --jwtkeyfile ${jwt_key_file} -d --instanceurl ${SFDC_HOST}"
                            } 
                        }
                        stage('Convert Salesforce DX and Store in SRC Folder') {
                            println(' Convert SFDC Project to normal project')
                            srccode = sh returnStdout: true, script: "sfdx force:source:convert -r force-app -d ./src"
                            println(srccode)
                        }
                        stage('Push To Target Org') {
                            println(' Deploy the code into Scratch ORG.')
                            sourcepush = sh returnStdout: true, script: "sfdx force:mdapi:deploy -d ./src -u ${HUB_ORG}"

                            println(sourcepush)
                            statusDep = sh returnStdout: true, script: "sfdx force:mdapi:deploy:report -u ${HUB_ORG} --json"
                        }
                        println(' Deployment Status ')
                        println(statusDep)

                        println('Waiting For 60 Seconds')

                        println('Checking Deployment Status Again ');
                        statusDep1 = sh returnStdout: true, script: "sfdx force:mdapi:deploy:report -u ${HUB_ORG} --json"
                        println('Updated Deployment Status')
                        println(statusDep1)
                        if (sourcepush != 0) {
                            //error 'push failed'
                        }

                        println(' Assign the Permission Set to the New user ')
                        permset = sh returnStdout: true, script: "sfdx force:user:permset:assign -n yeurdreamin -u ${HUB_ORG} --json"

                        println(permset)
                        if (permset != 0) {
                            //error 'permission set assignment failed'
                        }
                    }
                }
            }
        }
    }
}

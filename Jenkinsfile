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
                       stage('checkout source code ') {
        checkout scm
    }

    withCredentials([file(credentialsId: JWT_KEY_CRED_ID, variable: 'jwt_key_file')]) {
        stage('Create Scratch Org') {
            if (isUnix()) {
                rc = sh returnStatus: true, script: "sfdx force:auth:jwt:grant --clientid ${CONNECTED_APP_CONSUMER_KEY} --username ${HUB_ORG} --jwtkeyfile ${jwt_key_file} -d --instanceurl ${SFDC_HOST}"
            } else {
                rc1 = bat returnStatus: true, script: "sfdx -v"
                rc = bat returnStatus: true, script: "sfdx force:auth:logout --targetusername ${HUB_ORG} -p & sfdx force:auth:jwt:grant --clientid ${CONNECTED_APP_CONSUMER_KEY} --username ${HUB_ORG} --jwtkeyfile \"${jwt_key_file}\" -d --instanceurl ${SFDC_HOST}"
            }
            
            if (rc != 0) {
                error 'hub org authorization failed'
            }
   println(rc1)
            println(rc)
         
            /*if (isUnix()) {
                scratchorg = sh returnStdout: true, script: "sfdx force:org:create -f ./config/project-scratch-def.json --json -a ci-cd-org -s -w 10 -d 30"
            } else {
                scratchorg = bat returnStdout: true, script: "sfdx force:org:create -f ./config/project-scratch-def.json --json -a ci-cd-org -s -w 10 -d 30"
            }
            println('scratchorg')
            println(scratchorg)*/
            /*def jsonSlurper = new JsonSlurperClassic()
            def robj = jsonSlurper.parseText(scratchorg)
            println('rObj');
            println(robj);
            if (robj.status != 0) {
                error 'org creation failed: ' + robj.message
            }
            SFDC_USERNAME = robj.result.username
            println(SFDC_USERNAME)
            robj = null*/
        }
        stage('Convert Salesforce DX and Store in SRC Folder') {
            if (isUnix()) {
                println(' Convert SFDC Project to normal project')
                srccode = sh returnStdout: true, script : "sfdx force:source:convert -r force-app -d ./src"
            } else {
                println(' Convert SFDC Project to normal project')
                srccode = bat returnStdout: true, script : "sfdx force:source:convert -r force-app -d ./src"
            }
            println(srccode)
        }
        stage('Push To Target Org') {
            if(isUnix()){
                println(' Deploy the code into Scratch ORG.')
                sourcepush = sh returnStdout: true, script : "sfdx force:mdapi:deploy -d ./src -u ${HUB_ORG}"
            }else{
                println(' Deploy the code into Scratch ORG.')
                sourcepush = bat returnStdout: true, script : "sfdx force:mdapi:deploy -d ./src -u ${HUB_ORG}"
            } 
            println(sourcepush)
            if(isUnix()){
                println('Checking Deployment Status');
                statusDep = sh returnStdout: true, script: "sfdx force:mdapi:deploy:report -u ${HUB_ORG} --json"
            }else{
                println('Checking Deployment Status');
                statusDep = bat returnStdout: true, script: "sfdx force:mdapi:deploy:report -u ${HUB_ORG} --json"
            }
            println(' Deployment Status ')
            println(statusDep)
            
            if(isUnix()){
                println('Waiting For 60 Seconds')
                sleep 30
            }else{
                println('Waiting For 60 Seconds')
                sleep 30
            }
            
            if(isUnix()){
                println('Checking Deployment Status Again ');
                statusDep1 = sh returnStdout: true, script: "sfdx force:mdapi:deploy:report -u ${HUB_ORG} --json"
            }else{
                println('Checking Deployment Status Again');
                statusDep1 = bat returnStdout: true, script: "sfdx force:mdapi:deploy:report -u ${HUB_ORG} --json"
            }
            println('Updated Deployment Status')
            println(statusDep1)
            
            /*def jsonSlurper = new JsonSlurperClassic()
            def robj = jsonSlurper.parseText(statusDep.toString())
            println('rObj');
            println(robj);
            if (robj.status != 0) {
                println(robj.message)
            }
            SFDC_USERNAME = robj.status
            println(SFDC_USERNAME)
            robj = null*/
            
            if (sourcepush != 0) {
                //error 'push failed'
            }
            
            if(isUnix()){
                println(' Assign the Permission Set to the New user ')
                permset = sh returnStdout: true, script: "sfdx force:user:permset:assign -n yeurdreamin -u ${HUB_ORG} --json"
            }else{
                println(' Assign the Permission Set to the New user ')
                permset = bat returnStdout: true, script: "sfdx force:user:permset:assign -n yeurdreamin -u ${HUB_ORG} --json"
            }
            
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
    }
}


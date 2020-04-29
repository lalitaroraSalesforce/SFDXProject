pipeline {

   agent {
        dockerfile {
            dir '.'
            filename 'Dockerfile'
            additionalBuildArgs '--build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g)'
            label 'jenkins-slave'
        }
    }

stages {

    stage("build") {

        steps {

            echo 'build'

        }
    } 

    stage("deploy") {

        steps {
             echo 'deploy'
        }
    }
}
}

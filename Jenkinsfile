pipeline {
    
  agent {
        docker { image 'node:7-alpine' }
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

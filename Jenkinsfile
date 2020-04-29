pipeline {
    
   agent {
    docker { image 'appirio/dx' } 
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

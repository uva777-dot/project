pipeline {
    agent {
        label 'jenkins-slave' 
    }
    stages {
        stage ("Installing Git and Docker") {
            steps {
                // Ensure Docker and Git are present
                sh "sudo yum install docker git -y"
                sh "sudo systemctl start docker"
            }
        }
        stage("Checkout and Build") {
            steps {
                // Jenkins handles the git clone automatically if you configured the job 
                // but if you want to do it manually, we need to go INTO the folder:
                sh 'echo "Building Docker image..." '
                
                /* Note: Jenkins usually clones your repo into the workspace automatically.
                   If you manual clone, you must 'cd' into the directory to find the Dockerfile.
                */
                sh "sudo docker build -t mynewimage:v${BUILD_NUMBER} ."
                sh "sudo docker images | grep mynewimage"
            }
        }
        
        stage("Approval Required") {
            steps {
                script {
                    input message: 'Do you want to proceed to the next stage?', ok: 'Yes'
                }
            }
        }

        stage("Build Container") {
            steps {
                sh 'echo "Building Docker container"'
                // Use double quotes "" so Groovy can read the ${BUILD_NUMBER} variable
                sh "sudo docker run -d --name container_${BUILD_NUMBER} -p 3000:3000 mynewimage:v${BUILD_NUMBER}"
                sh "sudo docker ps -a | grep mynewimage"
            }
        }
        
        stage("Clean Workspace") {
            steps {
                cleanWs()
            }
        }
    }
}

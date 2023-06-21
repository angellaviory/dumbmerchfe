def branch = "main"
def repo = "https://github.com/angellaviory/dumbmerchfe"
def cred = "ubuntu"
def dir = "~/dumbmerchfe"
def server = "192.168.64.49"
def imagename = "dumbmerchfe"

pipeline {
	agent any
	stages {
		stage ('Pull From Git'){
			steps{
				sshagent ([credi]) {
					sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
					cd ${dir}
					git pull ${branch}
					exit
					EOF"""
				}
			}
		}
	
    
        stage('Image Build') {
            steps {
                sshagent([cred]) {
                    sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                    mkdir ${dir}
                    cd ${dir}
                    docker build -t ${imagename}:latest .
                    exit
                    EOF
                    """
                    }
               }
         }

         stage('Image Push') {
            steps {
                sshagent([cred]) {
                    sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                    mkdir ${dir}
                    cd ${dir}
                    docker tag ${imagename}:latest angellaviory/dumbmerchfee:latest
                    docker push angellaviory/dumbmerchfee:latest
                    exit
                    EOF
                    """
                    }
               }
         }

         stage('Docker Run') {
            steps {
                sshagent([cred]) {
                    sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                    mkdir ${dir}
                    cd ${dir}
                    docker run -d -p 3300:3000 ${imagename}:latest
                    exit
                    EOF
                    """
                    }
               }
         }

    }
}

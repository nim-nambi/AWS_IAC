pipeline{
    agent any
    tools {
      terraform 'terraform'
    }
    
    stage{
        stage('Git checkout'){
            steps{
                git changelog: false, poll: false, url: 'https://github.com/nim-nambi/AWS_IAC.git'
            }
        }
    }
    
    stage{
        stage('Terraform init'){
            steps{
                dir('Terraform_scripts') {
                    sh 'terraform apply init'
                }
            }
        }
    }
    
    stage{
        stage('Terraform validate'){
            steps{
                dir('Terraform_scripts') {
                    sh 'terraform validate'
                }
            }
        }
    }
    
    stage{
        stage('Terraform plan'){
            steps{
                dir('Terraform_scripts') {
                    sh 'terraform plan'
                }
            }
        }
    }
    
}
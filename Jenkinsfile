pipeline {
    agent any

    environment {
        function_name="test-java-app"
    }

    stages {
        stage('Build') {
            steps {
                echo 'Build'
                sh 'mvn package'
            }
        }

        stage('Push') {
            steps {
                echo 'Push'

                sh "aws s3 cp target/sample-1.0.3.jar s3://java-app-deploy-bucket-jenkins"
            }
        }

        stage('Deploy') {
            steps {
                echo 'Build'

                sh "aws lambda update-function-code --function-name $function_name --region us-east-1 --s3-bucket java-app-deploy-bucket-jenkins --s3-key sample-1.0.3.jar"
            }
        }
    }
}

pipeline {
    agent any

    environment {
        function_name="deploylambda18"
    }

    stages {
        stage('Build') {
            steps {
                echo 'Build'
                sh 'mvn package'
            }
        }
         stage("SonarQube analysis") {
            agent any

            when {
                anyOf {
                    branch 'feature/*'
                    branch 'main'
                }
            }
            steps {
                withSonarQubeEnv('sonar') {
                    sh 'mvn sonar:sonar'
                }
            }
        }
        stage("Quality Gate") {
    steps {
        script {
            try {
                
                    waitForQualityGate abortPipeline: true
                }
             catch (Exception ex) {
                
            }
        }
    }
}


        stage('Push') {
            steps {
                echo 'Push'

                sh "aws s3 cp target/sample-1.0.3.jar s3://deploybucket18"
            }
        }

        stage('Deploy') {
            steps {
                echo 'Build'

                sh "aws lambda update-function-code --function-name $function_name --region us-east-2 --s3-bucket deploybucket18 --s3-key sample-1.0.3.jar"
            }
        }
    }
}

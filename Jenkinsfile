pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Pulling code from GitHub...'
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo 'Building the application...'
                sh 'echo Build Success!'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                sh 'echo All tests passed!'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying to staging...'
                sh 'echo Deployed Successfully!'
            }
        }
    }
}

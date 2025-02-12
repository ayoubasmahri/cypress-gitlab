pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/ayoubasmahri/cypress-gitlab' 
            }
        }

        stage('Build and Test') {
            steps {
                docker.image('your-docker-image-name').inside() {
                   sh 'npm run cypress:run' 
                }
            }
        }

        stage('Generate Allure Report') {
            steps {
                // Copy allure-results from container to Jenkins workspace
                docker.image('cypress').inside() {
                    docker cp $(pwd):/allure-results .
                }

                // Generate Allure report
                sh 'allure generate allure-results -o allure-report'
            }
        }

        stage('Publish Report') {
            steps {
                // Publish Allure report to Jenkins
                allure publish allure-report 
            }
        }
    }
}

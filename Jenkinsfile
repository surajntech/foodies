pipeline {
    agent any
    stages {
        stage ("clean workspace") {
            steps {
                 cleanWs()
            }
        }

        stage ("git checkout") {
            steps {
                 git credentialsId: 'git-creds', url: 'https://github.com/surajntech/foodies.git'
            }
        }
	stage ('mvn build') {
            steps {
                sh 'mvn clean verify'
            }
        }

    }
}

pipeline {

    agent any

    environment {
        APP_DIR = "/var/www/flaskapp"
    }

    stages {

        stage('Clean Workspace') {
            steps {
                cleanWs()
            }
        }

        stage('Clone Code') {
            steps {
                git 'https://github.com/Vishalkaushik8/Portfolio-using-flask.git'
            }
        }

        stage('Prepare Folder') {
            steps {
                sh '''
                sudo mkdir -p $APP_DIR
                sudo rm -rf $APP_DIR/*
                sudo cp -r * $APP_DIR
                '''
            }
        }

        stage('Install Dependencies') {
            steps {
                sh '''
                cd $APP_DIR

                python3 -m venv venv || true
                source venv/bin/activate

                pip install --upgrade pip
                pip install -r requirements.txt
                pip install gunicorn
                '''
            }
        }

        stage('Restart Application') {
            steps {
                sh '''
                sudo systemctl restart flaskapp
                '''
            }
        }

    }
}

pipeline {

    agent any

    environment {
        APP_DIR = "/var/www/flaskapp"
    }

    stages {

        stage('Clone Code') {
            steps {
                git 'https://github.com/YOUR_USERNAME/YOUR_REPO.git'
            }
        }

        stage('Prepare Folder') {
            steps {
                sh '''
                rm -rf $APP_DIR/*
                cp -r * $APP_DIR
                '''
            }
        }

        stage('Install Dependencies') {
            steps {
                sh '''
                cd $APP_DIR
                python3 -m venv venv
                source venv/bin/activate
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

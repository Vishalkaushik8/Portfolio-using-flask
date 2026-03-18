pipeline {

    agent any

    environment {
        APP_DIR = "/var/www/flaskapp"
    }

    stages {

        stage('Prepare Folder') {
            steps {
                sh '''
                set -e
                echo "Preparing application directory..."

                sudo mkdir -p $APP_DIR
                sudo rm -rf $APP_DIR/*
                sudo cp -r . $APP_DIR
                '''
            }
        }

        stage('Install Dependencies') {
            steps {
                sh '''
                set -e
                echo "Installing dependencies..."

                cd $APP_DIR

                python3 -m venv venv
                source venv/bin/activate

                pip install --upgrade pip
                pip install -r requirements.txt
                pip install gunicorn
                '''
            }
        }

        stage('Install Systemd Service') {
            steps {
                sh '''
                set -e
                echo "Installing systemd service..."

                sudo cp $APP_DIR/flaskapp.service /etc/systemd/system/
                sudo systemctl daemon-reload
                sudo systemctl enable flaskapp
                '''
            }
        }

        stage('Restart Application') {
            steps {
                sh '''
                set -e
                echo "Restarting application..."

                sudo systemctl restart flaskapp
                sudo systemctl status flaskapp
                '''
            }
        }

        // 🔴 TEMPORARY STAGE (FOR TESTING EMAIL)
        stage('Test Fail') {
            steps {
                sh 'exit 1'
            }
        }
    }

    post {

        success {
            emailext (
                to: 'vishalsonipat428@gmail.com',
                subject: "✅ SUCCESS: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                body: """
                Build Successful 🎉

                Job: ${env.JOB_NAME}
                Build Number: ${env.BUILD_NUMBER}
                URL: ${env.BUILD_URL}
                """
            )
        }

        failure {
            emailext (
                to: 'vishalsonipat428@gmail.com',
                subject: "❌ FAILED: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                body: """
                Build Failed ❌

                Job: ${env.JOB_NAME}
                Build Number: ${env.BUILD_NUMBER}
                URL: ${env.BUILD_URL}

                Please check console output for details.
                """
            )
        }
    }
}

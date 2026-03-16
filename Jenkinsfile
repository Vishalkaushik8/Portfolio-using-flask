pipeline {

agent any

environment {
    APP_DIR = "/var/www/flaskapp"
}

stages {

    stage('Prepare Folder') {
        steps {
            sh '''
            sudo mkdir -p $APP_DIR
            sudo rm -rf $APP_DIR/*
            sudo cp -r . $APP_DIR
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

    stage('Install Systemd Service') {
        steps {
            sh '''
            sudo cp $APP_DIR/flaskapp.service /etc/systemd/system/
            sudo systemctl daemon-reload
            sudo systemctl enable flaskapp
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

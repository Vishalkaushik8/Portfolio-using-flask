# 🚀 Production Deployment of Flask Portfolio on AWS

![AWS](https://img.shields.io/badge/AWS-EC2-orange)
![Python](https://img.shields.io/badge/Python-3.x-blue)
![Flask](https://img.shields.io/badge/Flask-Web%20Framework-black)
![NGINX](https://img.shields.io/badge/NGINX-Reverse%20Proxy-green)
![Linux](https://img.shields.io/badge/Linux-Amazon%20Linux-yellow)

------------------------------------------------------------------------

## 🌍 Live Demo

🔗 **https://vedantpro.shop**

------------------------------------------------------------------------

## 📖 Project Description

This project demonstrates **end‑to‑end deployment of a Flask web
application** using a real production architecture on AWS Cloud.

The goal of this project is to showcase **Linux Administration + Cloud +
DevOps skills** by deploying a portfolio website publicly with HTTPS
security.

------------------------------------------------------------------------

## 🧠 What Problem This Project Solves

Instead of running a Flask app locally using:

    python main.py

this project shows how to run applications the **industry way**:

-   Always running
-   Secure (HTTPS)
-   Publicly accessible
-   Automatically restarting after reboot
-   Production‑ready architecture

------------------------------------------------------------------------

## 🏗️ Architecture Diagram

    User Browser
          │
          ▼
    Route53 (DNS)
          │
          ▼
    NGINX (Reverse Proxy)
          │
          ▼
    Gunicorn (WSGI Server)
          │
          ▼
    Flask Application
          │
          ▼
    HTML / CSS / Static Files

------------------------------------------------------------------------

## ⚙️ Technologies Used

  Category          Tools
  ----------------- -------------------------
  Programming       Python
  Framework         Flask
  Web Server        NGINX
  App Server        Gunicorn
  Cloud             AWS EC2
  DNS               Route53
  SSL               Let's Encrypt (Certbot)
  OS                Amazon Linux
  Service Manager   systemd
  Version Control   Git & GitHub

------------------------------------------------------------------------

## 🔥 Key Features

✅ Flask Web Application\
✅ Production Deployment on AWS EC2\
✅ Reverse Proxy using NGINX\
✅ Gunicorn WSGI Server\
✅ Custom Domain Mapping\
✅ HTTPS Enabled (SSL Certificate)\
✅ Auto Start After Reboot (systemd)\
✅ Public Internet Access

------------------------------------------------------------------------

## 🖥️ Local Development Setup

### Clone Repository

``` bash
git clone https://github.com/YOUR_USERNAME/portfolio-flask.git
cd portfolio-flask
```

### Create Virtual Environment

``` bash
python3 -m venv venv
source venv/bin/activate
```

### Install Dependencies

``` bash
pip install -r requirements.txt
```

### Run Application

``` bash
python3 main.py
```

Open:

    http://127.0.0.1:5000

------------------------------------------------------------------------

## ☁️ AWS Deployment Steps (High Level)

1.  Launch EC2 Instance (Amazon Linux)
2.  Install Python, Git & NGINX
3.  Clone Project Repository
4.  Setup Virtual Environment
5.  Install Requirements
6.  Run using Gunicorn
7.  Create systemd Service
8.  Configure NGINX Reverse Proxy
9.  Configure Route53 DNS
10. Enable HTTPS using Certbot

------------------------------------------------------------------------

## 🔧 systemd Service Configuration

``` ini
[Unit]
Description=Flask Portfolio Service
After=network.target

[Service]
User=ec2-user
WorkingDirectory=/opt/flaskapp/portfolio-flask
ExecStart=/opt/flaskapp/portfolio-flask/venv/bin/gunicorn --bind 127.0.0.1:8000 main:app
Restart=always

[Install]
WantedBy=multi-user.target
```

------------------------------------------------------------------------

## 🌐 NGINX Reverse Proxy Configuration

``` nginx
server {
    listen 80;
    server_name vedantpro.shop www.vedantpro.shop;

    location / {
        proxy_pass http://127.0.0.1:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```

------------------------------------------------------------------------

## 🔒 HTTPS Setup

SSL certificates generated using:

``` bash
sudo certbot --nginx
```

Certificates auto‑renew every 90 days.

------------------------------------------------------------------------

## 📊 Skills Demonstrated

-   Linux Server Administration
-   AWS EC2 Management
-   DNS Configuration (Route53)
-   Reverse Proxy Setup
-   Web Application Deployment
-   HTTPS & SSL Implementation
-   systemd Service Management
-   Cloud Networking Concepts

------------------------------------------------------------------------

## 👨‍💻 Author

**Vishal Kaushik**

-   RHCSA Certified
-   AWS Solutions Architect -- Associate
-   Linux & Cloud Engineer (Aspiring)

------------------------------------------------------------------------

## 📄 License

This project is created for learning and portfolio demonstration
purposes.

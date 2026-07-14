# AWS Company Website

## Option 1: Build and run locally
docker build -t aws-company-website .
docker run -d -p 1435:1435 aws-company-website

## Option 2: Run the image built/pushed by Jenkins
docker run -d -p 1435:1435 yourdockerhubusername/aws-company-website:latest

Open http://localhost:1435

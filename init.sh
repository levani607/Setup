#!/bin/bash

echo "Starting cloning Order service"
git clone https://github.com/levani607/Order.git
echo "Finished cloning Order Service"
echo "Starting building Order service application"
cd ./Order
sudo chmod +x ./gradlew
sudo ./gradlew build
echo "Build success"
cd ..

echo "Starting cloning User service"
git clone https://github.com/levani607/User.git
echo "Finished cloning User Service"
echo "Starting building User service application"
cd ./User
sudo chmod +x ./gradlew
sudo ./gradlew build
echo "Build finished"
cd ..

echo "Starting cloning Eureka service"
git clone https://github.com/levani607/Eureka.git
echo "Finished cloning Eureka Service"
echo "Starting building Eureka service application"
cd ./Eureka
sudo chmod +x ./gradlew
sudo ./gradlew build
echo "Build finished"
cd ..

sudo docker compose up --build -d
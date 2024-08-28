
echo Starting cloning Order service
git clone https://github.com/levani607/Order.git
echo Finished cloning Order Service
echo Starting building Order service application
cd ./Order
call gradlew build
echo build success
cd ..

echo Starting cloning User service
git clone https://github.com/levani607/User.git
echo Finished cloning User Service
echo Starting building User service application
cd ./User
call gradlew build
echo build finished
cd ..

echo Starting cloning Eureka service
git clone https://github.com/levani607/Eureka.git
echo Finished cloning Eureka Service
echo Starting building Eureka service application
cd ./Eureka
call gradlew build
echo build finished
cd ..
call docker compose up --build -d

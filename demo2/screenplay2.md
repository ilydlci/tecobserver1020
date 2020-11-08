# Screenplay for Demo 2

* Build app in [Spring Initializr](https://start.spring.io/)
  * Gradle Project
  * Java 8
  * Spring Boot 2.3.3
  * JAR packaging
  * Add dependencies
    * Spring web
    * Spring Boot Actuator
* Download zip file, move to EC2: `.\pscp.exe -v -P 22 -i tecobserver_key2.ppk demo.zip ubuntu@ec2-18-196-101-68.eu-central-1.compute.amazonaws.com:/home/ubuntu/`
* Unzip: `unzip demo.zip`
* Build JAR: `./gradlew clean build`
* Run & ping: `curl localhost:8080/actuator/health; echo`
* Create application
  * Upload JAR in Elastic Beanstalk
    * `$ cp ~/tecobserver1020/demo2/demo/build/libs/demo-0.0.1-SNAPSHOT.jar /mnt/c/Users/cito luca/Desktop/`
  * Change configuration of load balancing: default port 8080
  * Change configuration of load balancing: health check `/actuator/health`
* Query via curl
* Add database configuration from `db_config` folder
```
~/TecObserver/tecobserver1020/demo2$ mkdir demo_with_db
~/TecObserver/tecobserver1020/demo2$ cp -r demo demo_with_db
~/TecObserver/tecobserver1020/demo2$ cp -ri db_config/* demo_with_db
~/TecObserver/tecobserver1020/demo2$ cd demo_with_db/
~/TecObserver/tecobserver1020/demo2$ ./gradlew clean build
~/TecObserver/tecobserver1020/demo2$ ./gradlew clean build -x test
```
* Upload new version to Beanstalk, watch health deteriorate
* Add database via configuration, watch health get back to ok
* In the meanwhile, introduce AWS Copilot
* Copy files (no `mkdir` necessary!)
```
~/TecObserver/tecobserver1020/demo2$ cp -r demo_with_db demo_with_copilot
~/TecObserver/tecobserver1020/demo2$ cp -ri copilot_step1/* demo_with_copilot
~/TecObserver/tecobserver1020/demo2$ rm src/main/resources/application.properties
~/TecObserver/tecobserver1020/demo2$ cd demo_with_copilot
~/TecObserver/tecobserver1020/demo2/demo_with_copilot$ ./gradlew clean build -x test
```
* Init copilot: `copilot init`, follow the instructions & do not use LB
* Allow port 8080 in security group
* Ping public IP (visible under cluster > service > task > network)

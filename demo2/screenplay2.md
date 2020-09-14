# Screenplay for Demo 1

* Build app in [Spring Initializr](https://start.spring.io/)
  * Gradle Project
  * Java 8
  * Spring Boot 2.3.3
  * JAR packaging
  * Add dependencies
    * Spring web
    * Spring Boot Actuator
* Download zip file, move to Ubuntu drive
* Unzip: `unzip demo.zip`
* Build JAR: `./gradlew clean build`
* Run & ping: `curl localhost:8080/actuator/health; echo`
* Create application
  * Upload JAR in Elastic Beanstalk
  * Set up load balancing: default port 8080
  * Set up load balancing: health check `/actuator/health`
* Allow port 8080 in security group
* Query via curl
* Add database configuration from `db_config` folder
```
~/TecObserver/tecobserver1020/demo2$ cp -r demo demo_with_db
~/TecObserver/tecobserver1020/demo2$ cp -ri db_config/* demo_with_db
~/TecObserver/tecobserver1020/demo2$ cd demo_with_db/
~/TecObserver/tecobserver1020/demo2$ ./gradlew clean build
~/TecObserver/tecobserver1020/demo2$ ./gradlew clean build -x test
```
* Upload new version to Beanstalk, watch health deteriorate
* Add database via configuration, watch health get back to ok

# TODO
* Figure out what to show at line 30
* Additional step: introduce AWS copilot -> add Dockerfile, `copilot init` -> Add manifest.yml,  `copilot env init` -> `copilot svc deploy --env production

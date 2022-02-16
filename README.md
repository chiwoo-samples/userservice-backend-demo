# user-crud-demo-backend
 Backend combines components such as kotlin, spring-boot, jpa, webmvc, junit, mockk


## Build
```
mvn package -DskipTests=true
```

## Run
```
mvn spring-boot:run -DskipTests=true
```

## Build Image
```
docker build -t "userservice-demo:1.0" -f ./cicd/docker/Dockerfile .
```

### Docker Service UP
```
docker-compose -f ./cicd/docker/docker-compose-user.yaml up -d
```

### Docker Mysql UP
```
docker-compose -f ./cicd/docker/docker-compose-mysql.yaml up -d

# Listen port 확인 (MacOS)
# nc -vc localhost 53306
```


## Check APIs

### query
```
curl -v -L -X GET http://localhost:8080/api/users/query
```

### users-add
```
curl -v -L  -X POST 'http://localhost:8080/api/users' \
-H 'Content-Type: application/json' -H 'Authorization: Bearer {token}' \
--data-raw '{
    "firstName": "scott2",
    "lastName": "pines",
    "email": "scott2@pines.io",
    "role": "Manager",
    "title": "MR",
    "usercode": "scott21234"
}' 
```

### users-find-all
```
curl -v -L -X GET 'http://localhost:8080/api/users' \
 -H 'Content-Type: application/json' -H 'Authorization: Bearer {token}' 
```

### users-find-by-id
```
curl -v -L -X GET 'http://localhost:8080/api/users/1' \
 -H 'Content-Type: application/json' -H 'Authorization: Bearer {token}' 
```

### users-modify
```
curl -v -L -X PUT 'http://localhost:8080/api/users/3' \
 -H 'Content-Type: application/json' -H 'Authorization: Bearer {token}' \
 --data-raw '{
    "id": 3,
    "firstName": "Banana",
    "lastName": "Fruit",
    "email": "banana.fruit@farm.io",
    "role": "Admin",
    "title": "Mr",
    "usercode": "banana1234"
}' 
```

### users-find-by-query
```
curl -v -L -X GET 'http://localhost:8080/api/users/query?lastName=Fruit&title=mr&email=farm&role=manager' \
-H 'Content-Type: application/json' -H 'Authorization: Bearer {token}'
```


### users-delete
```
curl -v -L -X DELETE 'http://localhost:8080/api/users/4' \
-H 'Content-Type: application/json' -H 'Authorization: Bearer {token}'
```

## Appendix
- [h2-console](http://localhost:8080/h2-console/)
```
http://localhost:8080/h2-console

Driver Class: org.h2.Driver
JDBC URL: jdbc:h2:file:/tmp/data/demo
User Name: sa
``` 


### Reference Documentation
For further reference, please consider the following sections:

* [Official Apache Maven documentation](https://maven.apache.org/guides/index.html)
* [Spring Boot Maven Plugin Reference Guide](https://docs.spring.io/spring-boot/docs/2.5.6/maven-plugin/reference/html/)
* [Create an OCI image](https://docs.spring.io/spring-boot/docs/2.5.6/maven-plugin/reference/html/#build-image)
* [Rest Repositories](https://docs.spring.io/spring-boot/docs/2.5.6/reference/htmlsingle/#howto-use-exposing-spring-data-repositories-rest-endpoint)
* [Spring Web](https://docs.spring.io/spring-boot/docs/2.5.6/reference/htmlsingle/#boot-features-developing-web-applications)
* [Spring Data JPA](https://docs.spring.io/spring-boot/docs/2.5.6/reference/htmlsingle/#boot-features-jpa-and-spring-data)

### Guides
The following guides illustrate how to use some features concretely:

* [Accessing JPA Data with REST](https://spring.io/guides/gs/accessing-data-rest/)
* [Accessing Neo4j Data with REST](https://spring.io/guides/gs/accessing-neo4j-data-rest/)
* [Accessing MongoDB Data with REST](https://spring.io/guides/gs/accessing-mongodb-data-rest/)
* [Building a RESTful Web Service](https://spring.io/guides/gs/rest-service/)
* [Serving Web Content with Spring MVC](https://spring.io/guides/gs/serving-web-content/)
* [Building REST services with Spring](https://spring.io/guides/tutorials/bookmarks/)
* [Accessing Data with JPA](https://spring.io/guides/gs/accessing-data-jpa/)


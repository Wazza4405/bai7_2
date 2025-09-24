# Stage 1: Build WAR bằng Maven
FROM maven:3.9.4-eclipse-temurin-17 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Chạy trên Tomcat
FROM tomcat:9.0-jdk17
COPY --from=builder /app/target/bai7_y2.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]

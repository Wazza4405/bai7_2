# Base image dùng Tomcat
FROM tomcat:9.0-jdk17

# Copy file WAR (nếu dùng Maven build ra target/*.war)
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

# Expose port cho Render
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]

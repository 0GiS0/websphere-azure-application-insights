#Run with traditional websphere (https://hub.docker.com/r/ibmcom/websphere-traditional)
docker run --name websphere-traditional -h websphere-traditional \
  -p 9043:9043 -p 9443:9443 -d ibmcom/websphere-traditional:latest

#Get the password (user wsadmin)
docker exec websphere-traditional cat /tmp/PASSWORD

#Access to the administration portal
https://localhost:9043/ibm/console/login.do?action=secure


#My own image with App Insights in it
docker build -t websphere-traditional-with-app-insights . 

#Run with traditional websphere (https://hub.docker.com/r/ibmcom/websphere-traditional)
docker run --name websphere-traditional -h websphere-traditional \
-p 9043:9043 -p 9443:9443 -d \
-e APPLICATIONINSIGHTS_CONNECTION_STRING="<APP_INSIGHTS_INSTRUMENTATION_KEY>" \
websphere-traditional-with-app-insights


docker logs --tail=all -f $(docker ps -lq)

#Get the password (user wsadmin)
docker exec websphere-traditional cat /tmp/PASSWORD

#Access to the administration portal
https://localhost:9043/ibm/console/login.do?action=secure

#Java and Process Management > Process definition >  Java Virtual Machine
#In "Generic JVM arguments" add the following:
#-javaagent:/app/applicationinsights-agent-3.2.0.jar

#Restart the server
docker restart websphere-traditional


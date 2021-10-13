FROM ibmcom/websphere-traditional:latest

ENV APPLICATIONINSIGHTS_CONNECTION_STRING="<APP_INSIGHTS_INSTRUMENTATION_KEY>"

COPY applicationinsights-agent-3.2.0.jar /app/applicationinsights-agent-3.2.0.jar
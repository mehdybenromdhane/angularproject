# Use an official Node.js runtime as the base image
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Install wget utility (if not already available in the base image)
RUN apt-get update && apt-get install -y wget

# Download the npm artifact from Nexus
ARG NPM_ARTIFACT_URL="http://192.168.33.10:8081/repository/angular/firstapp/-/firstapp-0.0.0.tgz"
RUN wget --no-check-certificate $NPM_ARTIFACT_URL -O npm-artifact.tgz

# Install dependencies from the npm artifact
RUN npm install ./npm-artifact.tgz


EXPOSE 8089
# Specify a command to run on container startup (e.g., start your application)
CMD ["npm", "start"]

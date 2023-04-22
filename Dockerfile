# Official Node.js v14 image from Docker Hub
FROM node:14-alpine

WORKDIR /app

# Copy the package.json and package-lock.json files to the container's /app directory
COPY package*.json ./

# Install the application's dependencies
RUN npm install

# Copy the contents of the current directory (i.e., the entire nodejs-docs-hello-world application) to the container's /app directory
COPY . .

# Expose port 3000 for the application
EXPOSE 3000

# Start the application
CMD [ "node", "index.js" ]
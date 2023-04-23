# Build stage
FROM node:14-alpine as build

# Set the working directory to /app
WORKDIR /app

# Copy the package.json and package-lock.json files to the container's /app directory
COPY package*.json ./

# Install the application's dependencies
RUN npm ci --production

# Copy the application code to the container's /app directory
COPY . .

# Run stage
FROM node:14-alpine

# Set the working directory to /app
WORKDIR /app

# Copy the application code from the build stage to the container's /app directory
COPY --from=build /app .

# Create a new user called "node" with a home directory of /home/node
RUN addgroup -S nodejs && adduser -S nodejs -G nodejs
USER nodejs
ENV HOME=/home/nodejs

# Expose port 3000 for the application
EXPOSE 3000

# Start the application
CMD [ "npm", "start" ]
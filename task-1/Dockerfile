# I am using an official Node.js runtime as the base image
FROM node:alpine

# specifying the path where the code will be stored in container
WORKDIR /app

# Copy the application code into the container
COPY . .

# Install application dependencies/node modules.
RUN npm install

# My app is running on port 5000 so expose that port
EXPOSE 5000

# Command to start  Node.js app
CMD node index.js




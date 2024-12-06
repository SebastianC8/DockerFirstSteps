# /app /usr /lib
#FROM --platform=linux/amd64 node:19.2-alpine
#FROM --platform=$BUILDPLATFORM 
FROM node:19.2-alpine

# cd app
WORKDIR /app

# Destino / app
COPY package.json ./

# build node_modules
RUN npm install

# Destino / app
COPY . .

# Testing
RUN npm run test

# Delete unnecessary directories and files
RUN rm -rf tests && rm -rf node_modules

# Only prod dependencies
RUN npm install --prod

# run app
CMD ["node", "app.js"]
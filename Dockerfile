# Use a lighter version of Node as a parent image
FROM node:14-alpine

# Set the working directory to /client
WORKDIR /client

# Copy the current directory contents into the container at /client
COPY ./client /client
#COPY ./client/package.json /client/app/
# copy package.json into the container at /client
#COPY package*.json /client/
EXPOSE 3000
# install dependencies
RUN apk update
RUN apk add --no-cache g++ gcc libgcc libstdc++ linux-headers make python libtool automake autoconf nasm wkhtmltopdf vips vips-dev libjpeg-turbo libjpeg-turbo-dev
RUN apk add --no-cache ttf-dejavu ttf-droid ttf-freefont ttf-liberation ttf-ubuntu-font-family
RUN yarn install

# Run the app when the container launches
CMD ["yarn", "start"]
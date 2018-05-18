FROM node:6
ADD . /broker
WORKDIR /broker
RUN npm install
EXPOSE 8080
CMD [ "npm", "start" ]
FROM node:alpine

WORKDIR /app

EXPOSE 3000

COPY package*.json ./
RUN npm install

COPY ./public ./public
COPY ./src ./src
ENTRYPOINT ["npm", "start"]
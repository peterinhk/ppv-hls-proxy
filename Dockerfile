FROM node:alpine AS build

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY ./public ./public
COPY ./src ./src
COPY ./scripts ./scripts

RUN npm run build

FROM node:alpine
WORKDIR /app

COPY --from=build /app/dist/ /app/

EXPOSE 3000

ENTRYPOINT ["npm", "start"]
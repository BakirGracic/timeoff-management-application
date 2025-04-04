FROM node:13-alpine

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .

RUN mkdir -p /app/db

EXPOSE 3000

CMD ["npm", "start"]

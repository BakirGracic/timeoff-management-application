FROM node:13-alpine

COPY package.json .
RUN npm i

RUN adduser --system app --home /app
USER app

WORKDIR /app

COPY . /app

EXPOSE 3000

CMD ["npm", "start"]

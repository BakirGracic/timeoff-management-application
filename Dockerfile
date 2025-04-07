# staging
FROM node:13-alpine AS stage

WORKDIR /stage

RUN apk add --no-cache python python2 python3

COPY package*.json ./
RUN npm ci

# final
FROM node:13-alpine AS final

WORKDIR /app

COPY --from=stage /stage/node_modules ./node_modules
COPY . .

RUN mkdir -p /app/db

CMD ["npm", "start"]

# staging
FROM node:13-alpine AS stage

WORKDIR /stage

COPY package*.json ./
RUN npm ci

RUN apk add --no-cache python3

# final
FROM node:13-alpine AS final

WORKDIR /app

COPY --from=stage /stage/node_modules ./node_modules
COPY . .

RUN mkdir -p /app/db

CMD ["npm", "start"]

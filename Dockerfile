FROM node:14.21-alpine as builder
WORKDIR /app
COPY package* ./
RUN npm ci
 
FROM alpine:3.19.0
RUN apk --no-cache add nodejs~=14.21
WORKDIR /app
COPY ./ ./
COPY --from=builder /app ./
CMD [ "node", "index.js" ]

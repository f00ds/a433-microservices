FROM node:14.21-alpine as builder
WORKDIR /app
COPY package* ./
RUN npm ci
 
FROM alpine:latest
RUN apk --no-cache add nodejs ca-certificates
WORKDIR /app
COPY ./ ./
COPY --from=builder /app ./
CMD [ "node", "index.js" ]

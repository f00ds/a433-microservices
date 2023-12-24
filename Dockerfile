FROM node:14.21-alpine as builder
WORKDIR /app
COPY package* ./
RUN npm ci
 
FROM alpine:3.14
RUN apk --no-cache add nodejs=14.21.3-r0 bash=5.1.16-r0 && \
    wget -nv -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh && \
    chmod +x /bin/wait-for-it.sh
WORKDIR /app
COPY ./ ./
COPY --from=builder /app ./
CMD [ "node", "index.js" ]

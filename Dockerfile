FROM node:16-alpine
WORKDIR /app
COPY . .
RUN mkdir -p /root/.npm/_cacache/tmp
RUN chown -R 1000:1000 /root/.npm
RUN npm install
EXPOSE 3000
CMD ["npm","start"]


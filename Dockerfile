FROM node:latest
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --dev
RUN npm i -g http-server
WORKDIR /build
EXPOSE 5001
CMD ["http-server", "start"]

FROM node:latest
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --dev
RUN npm i -g http-server
WORKDIR /build
EXPOSE 5001
CMD ["http-server", "start"]






# FROM node:lts as build
# RUN apt-get update \
# && apt-get install -y build-essential
# WORKDIR /data
# COPY ./package.json /data/
# RUN npm install
# RUN npm run build
# COPY ./settings.js /data/
# COPY ./flows.json /data/
# ## Release image
# FROM node:lts-slim
# RUN apt-get update
# RUN mkdir -p /data
# COPY --from=build /data /data
# WORKDIR /data
# ENV PORT 3000
# ENV NODE_ENV=production
# ENV NODE_PATH=/data/node_modules
# EXPOSE 1880
# RUN npm i -g http-server
# CMD ["http-server", "start"]
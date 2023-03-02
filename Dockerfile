# build environment
# test change

FROM node:16.15.0 as build

ENV EXPO_TOKEN 5D_Nvc9Uck7g1Gpzl4DiRaygUMXiny5yrZe85N9g
RUN echo "Expo Token: " $EXPO_TOEKN

WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH
COPY package.json ./
#COPY package-lock.json ./
RUN npm install
COPY . ./
RUN npm run test
#RUN rm ./package-lock.json
RUN npm install eas-cli --global
RUN npx eas-cli build --profile preview --platform android --non-interactive

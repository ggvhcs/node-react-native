FROM node:18.16.0-buster

RUN npm i -g react@latest
RUN npm i -g react-native@latest

RUN npm i -g expo
RUN npm i -g expo-cli
RUN npm i -g create-expo-app
RUN npm i -g create-react-native-app
RUN npm i -g react-native-cli

WORKDIR /app

CMD ["/bin/bash"]

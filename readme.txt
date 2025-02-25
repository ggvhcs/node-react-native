# --- *** React Native Develop Environment with Docker in Linux Mint 21. *** --- #

https://github.com/1xrohit/Setup-ReactNative-development-environment-on-Ubuntu-without-Android-Studio
https://reactnative.dev/docs/set-up-your-environment
https://docs.expo.dev/get-started/introduction/

https://github.com/ggvhcs/node-react-native

Develop Enviroment:
---
Linux Mint 21.2 Mate x64.
Docker version 24.0.7, build 24.0.7-0ubuntu2~22.04.1
git version 2.34.1
Github Desktop version 3.2.0-linux1 (x64)
Visual Studio Code version 1.96.4
---

1 --- download image node:18.16.0-buster from hub docker ---
$ sudo docker pull node:18.16.0-buster
$ sudo docker images |grep node

$ cd ~/Documents/GitHub/docker/node/node-react-native
$ ls -l
---
 255 Feb 25 16:48 Dockerfile
5477 Feb 25 17:09 readme.txt
---

$ chmod 777 -Rvf ../node-react-native
$ chown nobody:nogroup -Rvf ../node-react-native

2 --- Create the Dockerfile file --- #
$ touch Dockerfile
$ nano Dockerfile
$ cat Dockerfile
---
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
---

--- create image from debian latest ---
$ sudo docker build -t node-reactn .
$ sudo docker images |grep node-reactn
---
sudo docker images |grep node-reactn
node-reactn        latest           72d67fdde387   About an hour ago   1.59GB
---

--- create an network bridge ---
$ sudo docker network create --subnet=172.15.0.0/16 homenet
$ sudo docker network ls
NETWORK ID     NAME      DRIVER    SCOPE
5d945100191c   homenet   bridge    local

--- create an container for test ---
$ cd ~/Documents/GitHub/docker/node/node-react-native
$ sudo docker run --name node-rnd-genymotion \
-v ~/Documents/GitHub/docker/node/node-react-native:/app --interactive --tty --entrypoint /bin/bash node-reactn

--- create an container for connect from expo go phones via hostpot---
# sudo docker run -ti --name node-rnd-phones \
--net homenet --ip 172.15.0.10 -dp 8082:8081 \
-d \
-v $(pwd):/app \
--interactive --tty --entrypoint /bin/bash node-reactn

# .
$ node --version
---
v18.16.0
---
$ npm --version
---
9.5.1
---
$ yarn --version
---
1.22.19
---
$ npx --version
---
9.5.1
---
expo --version
---
0.22.18
---

$ ls -l /app
$ npx create-expo-app
$ cd nodernd
$ yarn start
$ rm package-lock.json

#       ** IMPORTANT **      #

$ npx expo-doctor
$ npx expo install --check
$ npx expo install --fix
$ npx expo instal

$ yarn start

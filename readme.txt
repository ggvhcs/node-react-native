# --- *** Expo React Native Develop Environment with Docker in Linux Mint 21. *** --- #

https://reactnative.dev/docs/set-up-your-environment
https://docs.expo.dev/get-started/introduction/

--- youtube ---
https://youtu.be/TMk8Pf1-1n0

--- github repository ---
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

3 --- create image from node ---
$ sudo docker build -t node-reactn .
$ sudo docker images |grep node-reactn
---
sudo docker images |grep node-reactn
node-reactn        latest           72d67fdde387   About an hour ago   1.59GB
---

4 --- create an network bridge ---
$ sudo docker network create --subnet=172.15.0.0/16 homenet
$ sudo docker network ls
NETWORK ID     NAME      DRIVER    SCOPE
5d945100191c   homenet   bridge    local

5 --- create an container for test ---
$ cd ~/Documents/GitHub/docker/node/node-react-native
$ sudo docker run --name nodernd-genymotion \
-v ~/Documents/GitHub/docker/node/node-react-native:/app \
--interactive --tty --entrypoint /bin/bash node-reactn

--- create an container for connect from expo go phones via hostpot ---
# sudo docker run -ti --name node-rnd-phones \
--net homenet --ip 172.15.0.10 -dp 8081:8081 \
-d \
-v $(pwd):/app \
--interactive --tty --entrypoint /bin/bash node-reactn

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
$ expo --version
---
0.22.18
---

6 ---  ---
$ ls -l /app
$ npx create-expo-app
$ cd nodernd
$ ls -l
---
-rw-r--r--   1 root root   1742 Oct 26  1985 README.md
drwxr-xr-x   3 root root   4096 Feb 25 22:39 app
-rw-r--r--   1 root root    897 Feb 25 22:39 app.json
drwxr-xr-x   4 root root   4096 Feb 25 22:39 assets
drwxr-xr-x   4 root root   4096 Feb 25 22:39 components
drwxr-xr-x   2 root root   4096 Feb 25 22:39 constants
-rw-r--r--   1 root root    110 Feb 25 22:48 expo-env.d.ts
drwxr-xr-x   2 root root   4096 Feb 25 22:39 hooks
drwxr-xr-x 679 root root  20480 Feb 25 22:47 node_modules
-rw-r--r--   1 root root 532986 Feb 25 22:47 package-lock.json
-rw-r--r--   1 root root   1532 Feb 25 22:39 package.json
drwxr-xr-x   2 root root   4096 Feb 25 22:39 scripts
-rw-r--r--   1 root root    242 Oct 26  1985 tsconfig.json
---

$ yarn start
$ rm package-lock.json

7 --- ** IMPORTANT ** ---

$ npx expo-doctor
$ npx expo install --check
$ npx expo install --fix
$ npx expo instal

$ yarn start

8 --- open the app with genymotion ---

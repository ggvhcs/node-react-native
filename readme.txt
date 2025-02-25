# --- *** React Native Develop Environment with Docker in Linux Mint 21. *** --- #
https://dev.to/ghost/react-nativeexpo-with-virtualbox-and-genymotion-5g75
https://github.com/1xrohit/Setup-ReactNative-development-environment-on-Ubuntu-without-Android-Studio
https://reactnative.dev/docs/set-up-your-environment
https://docs.expo.dev/get-started/introduction/

Develop Enviroment:
---
Linux Mint 21.2 Mate x64.
Docker version 24.0.7, build 24.0.7-0ubuntu2~22.04.1
git version 2.34.1
Github Desktop version 3.2.0-linux1 (x64)
Visual Studio Code version 1.96.4
---

$ cd ~/Documents/GitHub/docker/node/reactn
    --- if the container react native develop is not created ---
# sudo docker run -ti --name rnd \
-d \
-v $(pwd):/app \
--interactive --tty --entrypoint /bin/bash ubuntu22-react-n

1    --- if the container jolo! is not created ---
cd ~/Documents/GitHub/docker/node/jolooo/jadmin
# sudo docker run -ti --name jadmin \
-d \
-v $(pwd):/app \
--interactive --tty --entrypoint /bin/bash ubuntu22-react-n

2    --- if the container jolo! is not created ---
cd ~/Documents/GitHub/docker/node/jolooo/jclient
# sudo docker run -ti --name jclient \
-d \
-v $(pwd):/app \
--interactive --tty --entrypoint /bin/bash ubuntu22-react-n

3    --- if the container jolo! is not created ---
cd ~/Documents/GitHub/docker/node/jolooo/jdriver
# sudo docker run -ti --name jdriver \
-d \
-v $(pwd):/app \
--interactive --tty --entrypoint /bin/bash ubuntu22-react-n

# --- create an container from ubuntu image.
$ cd ~/Documents/GitHub/docker/node/reactn
$ sudo docker build -t ubuntu22-react-n .  --> OK

$ sudo docker run --interactive --tty --entrypoint /bin/bash ubuntu22-react-n  --> OK

$ sudo docker run -v ~/Documents/GitHub/docker/node/reactn:/app --interactive --tty --entrypoint /bin/bash ubuntu22-react-n -- OK

### --- *** --- ###

--- 4 --- if the container jolo! driver is not created ---

--- host-port:contaimmer-port ---

1- cd ~/Documents/GitHub/docker/node/jolooo/jdriver
# sudo docker run -ti --name jolo-driver \
--net homenet --ip 172.15.0.12 -dp 8082:8081 \
-d \
-v $(pwd):/app \
--interactive --tty --entrypoint /bin/bash ubuntu22-react-n

2- sudo docker exec -it 32ffa4727263 bas
3- cd /app
4- yarn start

--- 5 --- if the container jolo! admin is not created ---

--- host-port:contaimmer-port ---

1- cd ~/Documents/GitHub/docker/node/jolooo/jadmin
# sudo docker run -ti --name jolo-admin \
--net homenet --ip 172.15.0.14 -dp 8084:8081 \
-d \
-v $(pwd):/app \
--interactive --tty --entrypoint /bin/bash ubuntu22-react-n

2- sudo docker exec -it 32ffa4727263 bash
3- cd /app
4- yarn start

--- 6 --- if the container jolo! client is not created ---

--- host-port:contaimmer-port ---

1- cd ~/Documents/GitHub/docker/node/jolooo/jclient
# sudo docker run -ti --name jolo-client \
--net homenet --ip 172.15.0.16 -dp 8086:8081 \
-d \
-v $(pwd):/app \
--interactive --tty --entrypoint /bin/bash ubuntu22-react-n

2- sudo docker exec -it 67094d9cdfba bash
3- cd /app
4- yarn start

### --- *** --- ###

#container ip address/
docker network ls

docker inspect -f \
'{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' \
54613d171292

$ sudo docker run --name reactjsdevelop \
--net homenet --ip 172.15.0.18 -dp 3000:3000 \
-v reactjs-app:/app \
-v reactjs-ssh:/etc/ssh \
-v reactjs-root:/root \
ggvhcs-react-js-develop

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

$ cd /app
$ npx create-expo --template --> ok
$ cd rnd
$ yarn start
$ rm package-lock.json

# onboarding swiper component.
https://www.npmjs.com/package/react-native-onboarding-swiper
https://github.com/jfilter/react-native-onboarding-swiper

$ yarn add react-native-onboarding-swiper -- install

# React Native Navigation.
https://reactnavigation.org/docs/hello-react-navigation
https://medium.com/walmartglobaltech/introduction-to-react-native-navigation-83ac8903ddad

$ yarn add react-native-screens react-native-safe-area-context --install
$ yarn add @react-navigation/native-stack -- install
$ yarn add react-native-gesture-handler react-native-reanimated react-native-screens react-native-safe-area-context @react-native-community/masked-view --install

# React Native Router.
https://v5.reactrouter.com/native/guides/quick-start
$ yarn add react-router-native --install

# image component.
yarn add react-native-image-picker --install

# sharing component.
expo install expo-sharing
yarn add react-native-share
yarn add anonymous-files

# .
yarn add react-navigation

# Layout.
https://www.npmjs.com/package/@react-native-community/hooks/v/2.8.0
https://github.com/react-native-community/hooks

$yarn add react-native-community/hooks --install

https://docs.expo.dev/router/installation/
expo-router

https://docs.expo.dev/versions/latest/sdk/splash-screen/
$ expo-splash-screen

##############################
#       ** IMPORTANT **      #
##############################

https://medium.com/@tondawalkar.omkar/remove-unused-node-packages-from-your-project-883d825ca63b
https://www.warp.dev/terminus/npm-remove-package

$ npx expo-doctor
$ npx expo install --check
$ npx expo install --fix
$ npx expo instal

$ yarn start

$ npm prune
$ npm dedupe
$ npm ddp

#
$ yarn add formik yup --install
$ yarn add uuid
$ yarn add expo-sqlite

$ yarn add expo-location --install
$ yarn add react-native-maps --install
$ yarn start
$ yarn add react-native-device-info --install

   20  yarn add react-native-onboarding-swiper -- install
   21  yarn add @react-navigation/native -- install
   22  yarn add react-native-screen -- install
   42  yarn add react-native-swiper --install

    7  yarn add @maplibre/maplibre-react-native --install
    8  yarn add @vgatica9/react-native-leaflet-maps --install

###hub.docker.com
$ sudo docker commit 7cb009e21e53 ggvhcs/react-n:latest
$ sudo docker login
$ sudo docker push ggvhcs/react-n:latest

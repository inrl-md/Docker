FROM node:latest
WORKDIR /root/bot/
COPY package*.json ./
RUN npm install
ADD https://github.com/inrl-md/dockerfile /root/bot/lib
ENV TZ=Asia/Kolkata
RUN apt -y update && apt -y upgrade && apt -y install ffmpeg neofetch git imagemagick python graphicsmagick tesseract-ocr-all sudo npm libreoffice yarn curl && curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - && apt -y install nodejs && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && apt -y update && apt -y install yarn && apt autoremove -y
ENV DEBIAN_FRONTEND=noninteractive
CMD ["bash"]

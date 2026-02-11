FROM node:16-alpine
WORKDIR /usr/src/app
COPY src/package*.json ./
# On met un dummy package.json si absent pour éviter l'erreur de build initiale
RUN if [ ! -f package.json ]; then echo '{}' > package.json; fi
RUN npm install --silent || true
COPY src/ .
EXPOSE 4000
CMD ["npm", "start"]

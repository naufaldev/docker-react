FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm i
COPY . .
RUN npm run build

#/app/build <==prouction code
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html/ 
FROM node:alpine as builder 
WORKDIR '/app'
COPY package.json .
RUN npm i
COPY . .
RUN npm run build
#RUN ["chmod", "+x", "/docker-entrypoint.sh"]

#/app/build <==prouction code
FROM nginx
EXPOSE 80
COPY --from=0 builder /app/build /usr/share/nginx/html/
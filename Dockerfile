FROM nginx:alpine

COPY ./conf.d/site.template /etc/nginx/conf.d/site.template
COPY ./html /html

WORKDIR /html

ENV NODE_CONFIG "{}"

CMD envsubst '"$NODE_CONFIG"' < /etc/nginx/conf.d/site.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'
FROM node:10-alpine

#RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
# Ensure the node user exists and has the correct permissions
RUN mkdir -p /home/node/app/node_modules && \
    chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package*.json ./

USER node

RUN npm install

COPY --chown=node:node . .

# Ensure wait-for.sh has execution permissions
USER root
RUN chmod +x /home/node/app/wait-for.sh

USER node  # Switch back to non-root user for security

EXPOSE 8080

ENTRYPOINT ["/home/node/app/wait-for.sh", "db:27017", "--"]  
CMD ["node", "app.js"]

# FROM node:10-alpine

# # Create the app directory and ensure the 'node' user has access to it
# RUN mkdir -p /home/node/app/node_modules && \
#     chown -R node:node /home/node/app

# WORKDIR /home/node/app

# # Copy package.json files and install dependencies
# COPY package*.json ./

# # No need to create or switch users explicitly, the base image already provides 'node' user
# USER node
# RUN npm install

# # Copy the rest of the application
# COPY --chown=node:node . .

# # Ensure wait-for.sh has execution permissions
# USER root
# RUN chmod +x /home/node/app/wait-for.sh

# USER node  # Switch back to non-root user for security

# EXPOSE 8080

# # Use the wait-for.sh script as the entrypoint
# ENTRYPOINT ["/home/node/app/wait-for.sh", "db:27017", "--"]
# CMD ["node", "app.js"]


# FROM node:10-alpine

# RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

# WORKDIR /home/node/app

# COPY package*.json ./

# USER node

# RUN npm install

# COPY --chown=node:node . .

# EXPOSE 8080

# # Ensure wait-for.sh has execution permissions
# USER root
# RUN chmod +x /home/node/app/wait-for.sh

# USER node

# ENTRYPOINT ["/home/node/app/wait-for.sh", "db:27017", "--"]
# CMD [ "node", "app.js" ]

FROM node:10-alpine

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package*.json ./

USER node

RUN npm install

COPY --chown=node:node . .

EXPOSE 8080

CMD [ "node", "app.js" ]FROM node:10-alpine

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package*.json ./

USER node

RUN npm install

COPY --chown=node:node . .

EXPOSE 8080

CMD [ "node", "app.js" ]
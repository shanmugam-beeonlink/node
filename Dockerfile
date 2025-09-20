FROM node:20-bullseye

# Set working directory
WORKDIR /app

#ENV NODE_ENV=production

# Install OpenSSL
RUN apt-get update -y && apt-get install -y openssl

RUN rm -rf node_modules

# Copy package files and install dependencies with pnpm
COPY package*.json ./

RUN npm install --frozen-lockfile

# Install Prisma CLI globally (optional, if needed)
RUN npm install -g prisma

# Copy the rest of the application files and environment variables from the parent directory
#COPY --chown=node:node . .
COPY . .


# Build the application
RUN npm run build

# Stage 2: Production Stage
# FROM node:23-alpine

# Install pnpm and PM2 globally
# RUN npm install -g  pm2

# Set working directory
# WORKDIR /app

# Copy only necessary files from the build stage
 #COPY --from=build /app .

# Ensure correct permissions for the 'node' user
 RUN chown -R node:node /app

# Switch to the 'node' user
USER node

# Generate Prisma Client
RUN npx prisma generate

# Expose the port the app runs on
EXPOSE 8080

# Start the app with PM2
CMD ["node", "dist/src/index.js"]
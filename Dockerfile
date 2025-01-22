# Use Node.js LTS version as the base image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Set environment variables
ENV NODE_ENV=production
ENV DOCUSAURUS_SSR_CONCURRENCY=5

# Copy package files
COPY package*.json ./
COPY yarn.lock ./

# Install dependencies
RUN yarn install --frozen-lockfile

# Copy project files
COPY . .

# Build the documentation
RUN yarn build

# Expose port 3000
EXPOSE 3000

# Start the server
CMD ["yarn", "serve", "--port", "3000", "--host", "0.0.0.0"]

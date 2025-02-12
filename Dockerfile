FROM cypress/included:latest

WORKDIR /e2e-tests

COPY package*.json ./

RUN npm install

COPY . .

# Install Allure CLI
RUN npm install -g allure-commandline

# Install Cypress plugins
RUN npm install --save-dev @cypress/allure-plugin

# Configure Cypress to use Allure reporter
RUN npx cypress install @cypress/allure-plugin

# Add a script to generate Allure reports
RUN echo "npx cypress run --record --reporter allure" >> package.json

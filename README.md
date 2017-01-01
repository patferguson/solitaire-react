# solitaire-react

[![Travis CI Build Status: Master](https://travis-ci.org/patferguson/solitaire-react.svg?branch=master "Build status: master")](https://travis-ci.org/patferguson/solitaire-react)
[![Coveralls Coverage Status: Master](https://coveralls.io/repos/github/patferguson/solitaire-react/badge.svg?branch=master "Coverage status: master")](https://coveralls.io/github/patferguson/solitaire-react/)
[![Code Climate Status: Master](https://codeclimate.com/github/patferguson/solitaire-react/badges/gpa.svg)](https://codeclimate.com/github/patferguson/solitaire-react)
[![Inch Inline Docs Status: Master](https://inch-ci.org/github/patferguson/solitaire-react.svg?branch=master)](http://inch-ci.org/github/patferguson/solitaire-react)

Learning React + Rails development through creating a simple Solitaire browser game.

## Setting up the project
First, install [Ruby Version Manager - RVM](https://rvm.io/) and [Node Version Manager - NVM](https://github.com/creationix/nvm) to allow for Ruby and Node to be installed.

From the base project directory, run `rvm use $(< .ruby-version) --install && nvm install && nvm use` to install the versions of specified in *.ruby-version* and *.nvmrc* respectively.

For managing Node packages, install [Yarn](https://yarnpkg.com/).

To install dependencies, run `cd server/ && bundle install && cd ../client && yarn install && cd ../`

## Running the project
Foreman is used to synchronise the execution of the Rails and React Webpack servers.

Execute this command from the base project directory to start the React Webpack server on port 3000 and the Rails server on port 3001:

`foreman start -f Procfile.dev -p 3000`

## Deployment
### Building the project for deployment

**This section is WIP**

Run `yarn run build` from the **client/** directory to generate a **build/** folder containing the compiled project assets, these static files may then be served via a HTTP server for access by end users on the web.

The environment serving both the built React content and the Rails API **must** support HTTPS to ensure security for end users. HTTPS is forced for the Production Rails API configuration.

### Environment variables
See Production.rb, these environment values must be set on both the machine running the server and any workers processing jobs:

* `URL_HOST` - E.g. 'example.com', used for link generation in the app and mailers.
* `PORT` - E.g. '3000', used for link generation and for configuring the application server.
* `NODE_ENV` - E.g. 'production', used to configure React and Webpack generation.

## References & Acknowledgements
The React component of this project was created using a base of Facebook's [create-react-app](https://github.com/facebookincubator/create-react-app).

The Rails <=> React interop was build with reference to the [fullstackreact.com](https://www.fullstackreact.com) article titled [How to get "create-react-app" to work with your Rails API](https://www.fullstackreact.com/articles/how-to-get-create-react-app-to-work-with-your-rails-api/).

## Test updates to see why Github is having commit issues

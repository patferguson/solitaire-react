# solitaire-react

[![Travis CI Build Status: Master](https://travis-ci.org/patferguson/solitaire-react.svg?branch=master "Build status: master")](https://travis-ci.org/patferguson/solitaire-react.svg?branch=master)
[![Coveralls Coverage Status: Master](https://coveralls.io/repos/github/patferguson/solitaire-react/badge.svg?branch=master "Coverage status: master")](https://coveralls.io/repos/github/patferguson/solitaire-react/badge.svg?branch=master)

Learning React + Rails development through creating a simple Solitaire browser game.

## Running the project
Foreman is used to synchronise the execution of the Rails and React Webpack servers.

Execute this command from the base project directory to start the React Webpack server on port 3000 and the Rails server on port 3001:

`foreman start -f Procfile.dev -p 3000`

## Building the project for deployment

*This section is WIP*

Run `yarn run build` from the *client/* directory to generate a *build/* folder containing the compiled project assets, these static files may then be served via a HTTP server for access by end users on the web.

## References & Acknowledgements
The React component of this project was created using a base of Facebook's [create-react-app](https://github.com/facebookincubator/create-react-app).

The Rails <=> React interop was build with reference to the [fullstackreact.com](https://www.fullstackreact.com) article titled [How to get "create-react-app" to work with your Rails API](https://www.fullstackreact.com/articles/how-to-get-create-react-app-to-work-with-your-rails-api/).

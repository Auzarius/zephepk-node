# Zepheniah EPK
`This is a conversion of the project written by Ian Bender.  The original project is written using PHP and JQuery.  The goal of this project is to achieve a similar effect using primarily Node and Angular.`

To-do:

- [X] Set up the alternate project
- [ ] Convert the current project that is in PHP / JQuery
- [ ] Continue development on the other project and track the changes here

## Working with this project
"Note: This project is a work in progress so it could be unstable at times."

1. Rename the `config_default.js` file to `config.js` and enter your database information.
2. Import the `zeph.sql` file into your database for the defaults.
3. Install Node / NPM if you have not already done so.
4. Run `npm i` at the root of the project folder to install the node dependencies from NPM.  For now I have decided to use bcrypt since it has been extensively tested and has decent speed.  If you run into any issues with that module going into error after running `npm i` please try following [this guide I put together](https://gist.github.com/Auzarius/b73dabe8f6a6d553775e451923469da4).  If you find something not listed in that guide helped you, please feel free to leave a comment on it so i can update it accordingly.
5. Run `node server.js` to start the server.  This should display 'The Zeph EPK server is listening on port: <port>!'

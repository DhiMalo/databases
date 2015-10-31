/* You'll need to have MySQL running and your Node server running
 * for these tests to pass. */

var mysql = require('mysql');
var request = require("request"); // You might need to npm install the request module!
var expect = require('../../node_modules/chai/chai').expect;

describe("Persistent Node Chat Server", function() {
  var dbConnection;

  beforeEach(function(done) {
    dbConnection = mysql.createConnection({
      user: "root",
      password: "",
      database: "chat"
    });
    dbConnection.connect();

       var tablename = "messages"; // DONE 

    dbConnection.query("truncate " + tablename, done); //Empties the db table before each test 
    //so that multiple tests (or repeated runs of the tests) won't screw each other up: */

  });

  afterEach(function() {
    dbConnection.end();
  });

  it("Should insert posted messages to the DB", function(done) {
    request({ method: "POST", // Post the user to the chat server.
              uri: "http://127.0.0.1:3000/classes/users",
              json: { username: "Valjean" }
    }, function () {
      request({ method: "POST", // Posts a message to the node chat server:
              uri: "http://127.0.0.1:3000/classes/messages",
              json: {
                username: "Valjean",
                text: "In mercy's name, three days is all I need.", // NOTE: Changed from 'messages' to 'text' -DhiMalo
                roomname: "Hello"
              }
      }, function () {
        // Should find the posted message in the database now.

        //NOTE: changed this test to get all the data from the message table. May need to revisit if it does not take. -DhiMalo
        var queryString = "SELECT * FROM messages";
        var queryArgs = [];

        dbConnection.query(queryString, queryArgs, function(err, results) {
          expect(results.length).to.equal(1);  // Should have one result
          expect(results[0].text).to.equal("In mercy's name, three days is all I need.");

          done();
        });
      });
    });
  });

  it("Should output all messages from the DB", function(done) {
    // Let's insert a message into the db
       var tablename = "message"; // NOTE: This was customized to the designed schema -DhiMalo

    dbConnection.query(queryString, queryArgs, function(err) {
      if (err) { throw err; }

      // Now query the Node chat server and see if it returns
      // the message we just inserted:
      request("http://127.0.0.1:3000/classes/messages", function(error, response, body) {
        var messageLog = JSON.parse(body);
        expect(messageLog[0].text).to.equal("Men like you can never change!");
        expect(messageLog[0].roomname).to.equal("main");
        done();
      });
    });
  });
});

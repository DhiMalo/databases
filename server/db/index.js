var mysql = require('mysql');

var connection = mysql.connectToDatabase({
  host      : '', // Fill the rest in.
  port      : '3000',
  user      : 'root',
  password  : '',
  database  : 'chat'
});

connection.end (function (err)) { //Terminate the connection gracefully.
  err === undefined ? console.log("The connection has been terminated.") : 
  console.log("Error"+err+"was detected prior to current connection termination.");
};


// Create a database connection and export it from this file.
// You will need to connect with the user "root", no password,
// and to the database "chat".

// TO DO : Look up the docs on mysqul node package and add a function to do: mysql -u root

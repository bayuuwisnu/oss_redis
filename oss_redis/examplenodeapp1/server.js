var express = require('express');
var redis = require('redis');
var app = express();
var redisClient = redis.createClient({
  host: 'redis',
  port: 6379
});

// Respond to requests for / with 'Hello World'
app.get('/', function(req, res){
    res.send('Hello world!');
   });
// Listen on port 5000
app.listen(5000, function() {
    console.log('Express server started successfully.');
});
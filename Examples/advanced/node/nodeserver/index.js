const { SEND_NODE_WP, RECEIVE_NODE_WP, TOWARDS_PROLOG_SOCKET, AGENT_SOCKET,HTTP_SOCKET } = require('./consts/consts.js');
const WebSocketServer = require("websocket").server;
const http = require('http');
const net = require('net');
const connect = require('connect');
const serveStatic = require('serve-static');

function blockReq(request,response){
   console.log((new Date()) + ' Received request for ' + request.url);
   response.writeHead(404);
   response.end();
}
/*<Socket Agenti>*/
var agentSocket = net.createServer(function (connection) {
   connection.on('end', function () {console.log('client disconnected');});
   connection.on('data', function (data) {if (webs.connections.length != 0) webs.connections[0].sendUTF(data);})
   connection.on('error', (err) => {
      if (err.code === 'EPIPE') console.error('Pipe error: ', err);
      elseconsole.error('Unexpected error: ', err);
   });
   connection.pipe(connection);
});
agentSocket.listen(AGENT_SOCKET, function () {});
/*</Socket Agenti>*/


/*<Websocket webpage>*/
var serverWsWebPage = http.createServer((request, response)=>blockReq(request, response));
serverWsWebPage.listen(SEND_NODE_WP, function () {});
const webs = new WebSocketServer({httpServer: serverWsWebPage});
webs.on('request', function (request) {   
   var connection = request.accept(null, request.origin);
   connection.on('message', function (message) {
      if (message.type === 'utf8') connection.sendUTF(message.utf8Data);
      else if (message.type === 'binary') connection.sendBytes(message.binaryData);
   });
   connection.on('close', function (reasonCode, description) {});
});
/*</Websocket webpage>*/



/*<socket ricevente prolog>*/
var servertoprolog = http.createServer((request, response)=>blockReq(request, response));
servertoprolog.listen(RECEIVE_NODE_WP, function () {});
const webstoprolog = new WebSocketServer({httpServer: servertoprolog});
webstoprolog.on('request', function (request) {
   var connection = request.accept(null, request.origin);
   connection.on('message', function (message) {
      const client = new net.Socket();
      client.connect(TOWARDS_PROLOG_SOCKET, '127.0.0.1', () => {
         client.write(message.utf8Data+'.')
         client.end();
      });
      if (message.type === 'utf8') {
         connection.sendUTF(message.utf8Data);
      }
      else if (message.type === 'binary') {
         connection.sendBytes(message.binaryData);
      }
   });
   connection.on('close', function (reasonCode, description) {});
});
/*</socket ricevente prolog>*/
console.log(__dirname+"/html");
 connect()
     .use(serveStatic(__dirname+"/html"))
     .listen(HTTP_SOCKET, () => console.log('Server running on 8080...'));

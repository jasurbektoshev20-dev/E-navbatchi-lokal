const socket = io('http://10.100.9.145:3000');

// Event handler for incoming messages from the server
socket.on('message', (message) => {
  console.log("Alert message from this object: ", message);
});
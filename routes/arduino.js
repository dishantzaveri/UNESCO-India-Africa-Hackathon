import { WebSocketServer } from "ws";

const server = new WebSocketServer({ port: 3000 });

// receive a message from the client
socket.on("message", (data) => {
    const packet = JSON.parse(data);

    switch (packet.type) {
        case "0":
            console.log("Bp: test ok")
            break;
    }
});



socket.addEventListener("message", ({ data }) => {
    const packet = JSON.parse(data);

    switch (packet.type) {
        case "0":
            console.log("Bp: test ok")
            break;
    }
});
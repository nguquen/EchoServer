import Socket
import Dispatch

class EchoServer {
    let port: Int
    let socket: Socket

    init(port: Int) throws {
        self.port = port
        self.socket = try Socket.create()
    }

    func listen(handler: (socket: Socket) -> Void) throws {
        try socket.listen(on: port)
        print("Listen on port: \(port)")
        while true {
            let clientSocket = try socket.acceptClientConnection()
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)) {
                handler(socket: clientSocket)
            }
        }
    }

}

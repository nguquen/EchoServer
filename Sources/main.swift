//
// Created by nguquen on 15/07/2016.
//

import Foundation
import Socket

let server = try EchoServer(port: 1337)
try server.listen() {(socket:Socket) in
    do {
        print("handler run at \(NSDate())")
        while true {
            let readData = NSMutableData()
            let bytesRead = try socket.read(into: readData)
            if bytesRead == 0 {break}
            guard let str = NSString(data: readData, encoding: NSUTF8StringEncoding) else {
                print("Error decoding response...")
                readData.length = 0
                break
            }
            print("received from \(socket.remoteHostname):\(socket.remotePort): \(str)", terminator: "")
            try socket.write(from: "\(str)")
        }
    } catch {
        print("socket handler error: \(error)")
    }
    socket.close()
}

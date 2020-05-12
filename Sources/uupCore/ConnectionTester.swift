import Foundation
import Rainbow
import Socket

@available(OSX 10.14, *)
class ConnectionTester {

    var addr: String
    var port: Int
    var count: Int
    var delay: Int
    var rep: Bool
    var timeout: Int
    var timeoutms: Int

    init(addr: String, port: Int, count: Int, delay: Int, rep: Bool, timeout: Int) {
        self.addr = addr
        self.port = port
        self.count = count
        self.delay = delay
        self.rep = rep
        self.timeout = timeout
        self.timeoutms = timeout * 1000
    }

    func testConnection() -> ConnectionTesterResult {

        let result = ConnectionTesterResult()

        do {
            try openConnection()
            result.Success = true
            result.Message = "Success"
        } catch {
            result.Success = false
            result.Message = "Failed"
        }

        return result
    }

    func openConnection() throws -> Void {

        let socket = try Socket.create()

        do {
            try socket.connect(to: self.addr, port: Int32(self.port), timeout: UInt(self.timeoutms))
        }
        catch let error {
            socket.close()
            throw error
        }
    }

    func start() -> Void {

        var loops: Int

        if rep {
            loops = Int.max
        }
        else {
            loops = count
        }

        for i in 1...loops {

            print("\(getTime())".lightBlack, terminator: " ")
            print("\(addr):\(port) ->", terminator: " ")

            let result = testConnection()

            if result.Success {
                print("\(result.Message)".green)
            }
            else {
                print("\(result.Message)".red)
            }


            if i == loops {
                return
            }
            else {
                sleep(UInt32(delay))
            }
        }
    }
}


class ConnectionTesterResult {

    var Success: Bool = false
    var Message: String = ""

}

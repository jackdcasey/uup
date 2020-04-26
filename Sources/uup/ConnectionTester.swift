import Foundation
import Socket

class ConnectionTester {
    
    var addr: String;
    var port: Int;
    var timeout: Int;
    var timeoutms: Int;
    
    init(addr: String, port: Int, timeout: Int) {
        self.addr = addr
        self.port = port
        self.timeout = timeout
        self.timeoutms = timeout * 1000
    }
    
    @available(OSX 10.14, *)
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
    
    @available(OSX 10.14, *)
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
}


class ConnectionTesterResult {
    
    var Success: Bool = false
    var Message: String = ""
    
}

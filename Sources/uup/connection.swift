import Foundation
import SwiftSocket

func testConnection(addr: String, port: Int, timeout: Int) -> ConnectionTestResult {
    
    let result = ConnectionTestResult()
    
    let client = TCPClient(address: addr, port: Int32(port))
    
    switch client.connect(timeout: timeout) {
        
        case .success:
            result.Success = true
            result.Message = "Success"
        case .failure(let error):
            result.Success = false
            result.Message = String(describing: error)
        }
    
    return result
}


class ConnectionTestResult {
    
    var Success: Bool = false
    var Message: String = ""
    
}


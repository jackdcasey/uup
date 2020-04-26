import Foundation
import Rainbow

@available(OSX 10.14, *)
func runTest(addr: String, port: Int, count: Int, delay: Int, rep: Bool) -> Void {
    
    var loops: Int
    
    if rep {
        loops = Int.max
    }
    else {
        loops = count
    }
    
    for _ in 1...loops {
        
        print("\(addr):\(port) -> ", terminator: "")
        
        let tester = ConnectionTester(addr: addr, port: port, timeout: delay)
        
        let result = tester.testConnection()
        
        if result.Success {
            print("\(result.Message)".green)
        }
        else {
            print("\(result.Message)".red)
        }
        
        
        if 1 == loops {
            return
        }
        else {
            sleep(UInt32(delay))
        }
    }
}


if #available(OSX 10.14, *) {
    let options = TestOptions.parseOrExit()
    runTest(addr: options.address, port: options.port, count: options.count, delay: options.delay, rep: options.recurrent)
} else {
    print("macOS < 10.14 not supported")
}





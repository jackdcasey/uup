import Foundation
import Rainbow

func runTest(addr: String, port: Int, count: Int, delay: Int, rep: Bool) -> Void {
    
    var loops: Int
    
    if rep {
        loops = Int.max
    }
    else {
        loops = count
    }
    
    for i in 1...loops {
        
        print("\(i): \(addr):\(port)", terminator: "-> ")
        
        let result = testConnection(addr: addr, port: port, timeout: delay)
        
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


let options = TestOptions.parseOrExit()
runTest(addr: options.address, port: options.port, count: options.count, delay: options.delay, rep: options.recurrent)





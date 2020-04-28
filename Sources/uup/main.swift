import Foundation

if #available(OSX 10.14, *) {
    let options = TestOptions.parseOrExit()
    
    let tester = ConnectionTester.init(
        addr: options.address,
        port: options.port,
        count: options.count,
        delay: options.delay,
        rep: options.recurrent,
        timeout: 2)
    
    tester.start()

} else {
    print("macOS < 10.14 not supported")
}





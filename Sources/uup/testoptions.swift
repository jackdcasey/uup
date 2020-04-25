import ArgumentParser

struct TestOptions: ParsableCommand {

    @Argument(help: "The address you are testing connections to")
    var address: String
    
    @Option(name: .shortAndLong, default: -1, help: "The port we are attempting to connect to")
    var port: Int
    
    @Option(name: .shortAndLong, default: 3, help: "How may times will we run the test")
    var count: Int
    
    @Option(name: .shortAndLong, default: 2, help: "How many seconds to wait betwen tests")
    var delay: Int
    
    @Flag(name: .shortAndLong, help: "If we want to run test indefinitely")
    var recurrent: Bool
    
    mutating func validate() throws {
        
        let (caddr, cport) = getAddressAndPort(input: address)
        
        if let caddr = caddr {
            address = caddr
        }
        
        if let cport = cport {
            port = cport
        }
        
        guard port != -1 else {
            throw ValidationError("Port must be specified with -Port argument, or in address:port format")
        }
        
        guard (1..<65535).contains(port) else {
            throw ValidationError("Port must be between 1 - 65535. Port was: \(port)")
        }
    }
}

import ArgumentParser

@available(OSX 10.13, *)
struct TestOptions: ParsableCommand {

    static var configuration = CommandConfiguration(
        abstract: "A fast and lightweight ping alternative",
        version: "1.4"
    )

    @Argument(help: "The address used to connect to")
    var address: String

    @Option(name: .shortAndLong, default: -1, help: "The TCP port used to connect with")
    var port: Int

    @Option(name: .shortAndLong, default: 1, help: "How may times to run the test")
    var count: Int

    @Option(name: .shortAndLong, default: 2, help: "How many seconds to wait betwen tests")
    var delay: Int

    @Flag(name: .shortAndLong, help: "Run test indefinitely")
    var recurrent: Bool

    @Flag(name: .shortAndLong, help: "Display the time when testing")
    var time: Bool

    mutating func validate() throws {

        let (caddr, cport) = getAddressAndPort(input: address)

        if let caddr = caddr {
            address = caddr
        }

        if let cport = cport {
            port = cport
        }

        if port == -1 {
            port = 443
        }

        // Validation

        guard (1..<65535).contains(port) else {
            throw ValidationError("Port must be between 1 - 65535. Port was: \(port)")
        }

        guard count > 0 else {
            throw ValidationError("Count must be greater than 0. Count was: \(count)")
        }
    }
}

import Foundation

public final class Starter {

    public static func Run() throws -> Void {

        let options = TestOptions.parseOrExit()

        let tester = ConnectionTester.init(
            addr: options.address,
            port: options.port,
            count: options.count,
            delay: options.delay,
            rep: options.recurrent,
            timeout: 2)

        tester.start()
    }
}






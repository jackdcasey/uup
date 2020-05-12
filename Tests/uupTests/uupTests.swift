import Foundation
import uupCore
import XCTest

final class uupTests: XCTestCase {

    func testUtilityGetAddressAndPortTest() throws {

        let (addr1, port1) = getAddressAndPort(input: "apple.com:443")
        XCTAssertEqual(addr1, "apple.com")
        XCTAssertEqual(port1, 443)
        
        let (addr2, port2) = getAddressAndPort(input: "192.168.10.1:22")
        XCTAssertEqual(addr2, "192.168.10.1")
        XCTAssertEqual(port2, 22)
        
        let (addr3, port3) = getAddressAndPort(input: "ec2-52-204-122-132.compute-1.amazonaws.com:22")
        XCTAssertEqual(addr3, "ec2-52-204-122-132.compute-1.amazonaws.com")
        XCTAssertEqual(port3, 22)
    }
}

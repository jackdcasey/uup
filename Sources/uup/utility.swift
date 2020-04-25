import Foundation

func getAddressAndPort(input: String) -> (String?, Int?) {
    var addr: String?;
    var port: Int?;
    
    let pattern = "^(?<address>[a-z0-9.]+):?(?<port>\\d+)?$"
    let regex = try! NSRegularExpression(pattern: pattern, options: .caseInsensitive)
    
    if let match = regex.firstMatch(in: input, options: [], range: NSRange(location: 0, length: input.utf16.count)) {
      if let addrRange = Range(match.range(withName: "address"), in: input) {
        addr = String(input[addrRange])
      }

      if let portRange = Range(match.range(withName: "port"), in: input) {
        port = Int(input[portRange])
      }
    }
    
    return (addr, port)
}

import uupCore

if #available(OSX 10.14, *) {

    do {
        try Starter.Run()
    } catch {
        print("An error occurred: \(error)")
    }
} else {
    print("macOS < 10.14 not supported")
}

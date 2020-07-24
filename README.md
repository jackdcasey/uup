# uup (You Up?)

A fast and lightweight ping alternative for macOS

![image](./screenshots/commands.png)

uup connects using TCP instead of ICMP, allowing for greater compatibility

### Example:
In this example, we reboot a server while using uup to monitor it coming back online
![image](./screenshots/uup_demo.gif)

### Installation:

#### Homebrew (recommended):
```
brew install jackdcasey/tap/uup
```
#### From source:
```
git clone https://github.com/jackdcasey/uup && cd uup
make install
```

### Usage: 
```
USAGE: test-options <address> [--port <port>] [--count <count>] [--delay <delay>] [--recurrent]

ARGUMENTS:
  <address>               The address you are testing connections to

OPTIONS:
  -p, --port <port>       The port we are attempting to connect to
                          Can also be specified in address:port format
                          
  -c, --count <count>     How may times will we run the test (default: 1)
  -d, --delay <delay>     How many seconds to wait betwen tests (default: 2)
  -r, --recurrent         If we want to run test indefinitely
  -h, --help              Show help information.
  ```
### Uninstallation:

#### Homebrew:
```
brew uninstall uup
```
#### From source:

```
cd <path to uup repo>
make uninstall
```

  

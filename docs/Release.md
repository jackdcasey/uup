# Build & Publish

These steps will first build a binary of uup, publish to Github then publish to homebrew

## Building

1. `swift build -c release --disable-sandbox`

A binary will be built in `.build/release/uup`

## Publishing a Github release

1. `tar -czvf uup-darwin-amd64.tar.gz -C $(pwd)/.build/release ./uup`
1. `export GITHUB_TOKEN="..."`
1. `uup_version=vX.X`
1. `ghr -n "${uup_version}" ${uup_version} ./uup-darwin-amd64.tar.gz`

## Publishing to homebrew

1. `openssl dgst -sha256 ./uup-darwin-amd64.tar.gz | awk '{print $2}'`
1. Update https://github.com/jackdcasey/homebrew-tap/blob/master/Formula/uup.rb with new changes

```
class Uup < Formula
    desc "A fast and lightweight ping alternative for macOS"
    homepage "https://github.com/jackdcasey/uup"
    url "https://github.com/jackdcasey/uup/releases/download/${releaseVersion}/uup-darwin-amd64.tar.gz"
    sha256 "${sha256}"
    version "${releaseVersion}"
    head "https://github.com/jackdcasey/uup.git"

    def install
        bin.install "uup"
    end
end
```

For Example
```
class Uup < Formula
    desc "A fast and lightweight ping alternative for macOS"
    homepage "https://github.com/jackdcasey/uup"
    url "https://github.com/jackdcasey/uup/releases/download/v1.1/uup-darwin-amd64.tar.gz"
    sha256 "d6fe2bd82aeb1bf1351df200d3b62094a3f19e3d0503ee325cccf4e026b6e0bf"
    version "1.1.0"
    head "https://github.com/jackdcasey/uup.git"

    def install
        bin.install "uup"
    end
end
```

# Cleanup

1. `rm ./uup-darwin-amd64.tar.gz`
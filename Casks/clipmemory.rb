cask "clipmemory" do
  version "2.4.0"
  sha256 "5969ec7d0fac5b738ae874f7afdcac4924ed8a175b859dd9ba2b64388c03db3e"

  url "https://github.com/irykelee/clipmemory/releases/download/v\#{version}/ClipMemory.tar.gz"
  name "ClipMemory"
  desc "Clipboard history manager for macOS with encryption and Quick Bar"
  homepage "https://github.com/irykelee/clipmemory"

  depends_on macos: :ventura

  auto_updates true

  app "ClipMemory.app"

  zap trash: [
    "~/Library/Application Support/ClipMemory",
    "~/Library/Preferences/com.clipmemory.app.plist",
  ]
end

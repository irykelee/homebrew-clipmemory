cask "clipmemory" do
  version "2.4.2"
  sha256 "f75ec3304d9681b321febef30a894db98360aef4eab918ecbeaf8730f138ca2f"

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

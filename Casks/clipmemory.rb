cask "clipmemory" do
  version "2.5.0"
  sha256 "b6f03fb8304f46d4aae22b843d24dd911eea06af8f4d74219959664d929a40ad"

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

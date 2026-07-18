cask "clipmemory" do
  version "2.5.5"
  sha256 "2fb141aa13af4d0da98b06d0c17db10566db05012066f78dd60eeb93a02f5f22"

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

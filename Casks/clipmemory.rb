cask "clipmemory" do
  version "2.4.1"
  sha256 "b457d4452e733eb7058c27a6716e9e94da969015036577a39b8c72ad549155e5"

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

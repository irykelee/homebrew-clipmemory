cask "clipmemory" do
  version "2.7.8"
  sha256 "b3c5e334d9d1d45b494588cc5de825e5113c542a5188c9c99173a38a88af5e3e"

  url "https://github.com/irykelee/clipmemory/releases/download/v#{version}/ClipMemory.tar.gz"
  name "ClipMemory"
  desc "Clipboard history manager for macOS with encryption and Quick Bar"
  homepage "https://github.com/irykelee/clipmemory"

  auto_updates true
  depends_on macos: :ventura

  app "ClipMemory.app"

  zap script: {
        executable:   "/usr/bin/security",
        args:         ["delete-generic-password", "-s", "com.clipmemory.app", "-a", "root-encryption-key"],
        must_succeed: false,
      },
      trash: [
        "~/Library/Application Support/ClipMemory",
        "~/Library/Preferences/com.clipmemory.app.plist",
      ]
end

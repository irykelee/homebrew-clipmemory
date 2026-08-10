cask "clipmemory" do
  version "2.8.2"
  sha256 "fb1661538ab82f74c7c9915c70dae33f8ef4384d5a7cffb656fe36ebfa50aa86"

  url "https://github.com/irykelee/clipmemory/releases/download/v#{version}/ClipMemory.tar.gz"
  name "ClipMemory"
  desc "Clipboard history manager with encryption and Quick Bar"
  homepage "https://github.com/irykelee/clipmemory"

  auto_updates true
  depends_on macos: :ventura

  app "ClipMemory.app"

  # C1: the root encryption key lives in the Keychain, not in files —
  # remove it too so zap leaves no key material behind.
  zap script: {
        executable:   "/usr/bin/security",
        args:         ["delete-generic-password", "-s", "com.clipmemory.app", "-a", "root-encryption-key"],
        must_succeed: false,
      },
      trash:  [
        "~/Library/Application Support/ClipMemory",
        "~/Library/Preferences/com.clipmemory.app.plist",
      ]
end

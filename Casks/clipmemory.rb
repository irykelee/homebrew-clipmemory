cask "clipmemory" do
  version "2.9.1"
  sha256 "c5d85bb3ee25c8b693322ebe0608b101e00a4c12ac6a8960a39689dfae172021"

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

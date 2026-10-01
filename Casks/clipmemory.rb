cask "clipmemory" do
  version "2.9.5"
  sha256 "3dd640dbff5cbc14dc180325db56a971778613c6ac7a53a15ea5b80d06d7c185"

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

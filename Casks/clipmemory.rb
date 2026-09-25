cask "clipmemory" do
  version "2.9.2"
  sha256 "dec01f3b04865ca1855bd1a8d83e146ce97a9ad57de4696b3e32f8cb1df25af7"

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

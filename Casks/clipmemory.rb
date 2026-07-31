cask "clipmemory" do
  version "2.7.4"
  sha256 "ce3de4c2e155baba78907182c7946fba3fb5575dd647fecbcfb5698fd741a9f4"

  url "https://github.com/irykelee/clipmemory/releases/download/v#{version}/ClipMemory.tar.gz"
  name "ClipMemory"
  desc "Clipboard history manager for macOS with encryption and Quick Bar"
  homepage "https://github.com/irykelee/clipmemory"

  depends_on macos: :ventura

  auto_updates true

  app "ClipMemory.app"

  zap trash: [
    "~/Library/Application Support/ClipMemory",
    "~/Library/Preferences/com.clipmemory.app.plist",
  ],
  # C1: the root encryption key lives in the Keychain, not in files —
  # remove it too so zap leaves no key material behind.
  script: {
    executable: "/usr/bin/security",
    args: ["delete-generic-password", "-s", "com.clipmemory.app", "-a", "root-encryption-key"],
    must_succeed: false,
  }
end

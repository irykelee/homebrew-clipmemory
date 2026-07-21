cask "clipmemory" do
  version "2.5.9"
  sha256 "9bff7b2d5da2e6a9b796ead9bc1f61ea4f56a5a7faf5cf536b86079206f0bfd4"

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

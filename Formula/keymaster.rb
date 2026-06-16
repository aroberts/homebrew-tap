class Keymaster < Formula
  desc "TouchID-protected keychain access for scripts"
  homepage "https://github.com/aroberts/keymaster"
  url "https://github.com/aroberts/keymaster/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "e004e42839aae4d932f00987a3392f635ff86ba56a6ee3b50e7a8a1fb0b42970"
  license "MIT"
  head "https://github.com/aroberts/keymaster.git", branch: "master"

  depends_on :macos

  def install
    system "swiftc", "keymaster.swift", "-o", "keymaster", "-O"
    bin.install "keymaster"
    bin.install "bin/keymaster-askpass"
    bin.install "bin/keymaster-ssh"
  end

  test do
    assert_match "keymaster", shell_output("#{bin}/keymaster 2>&1", 1)
  end
end

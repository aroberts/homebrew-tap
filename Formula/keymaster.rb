class Keymaster < Formula
  desc "TouchID-protected keychain access for scripts"
  homepage "https://github.com/aroberts/keymaster"
  url "https://github.com/aroberts/keymaster/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "ebe8619e781a5f0a14cdf4ccf233ab3ba1f8f3c3c906f9bd66998b382381f91f"
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

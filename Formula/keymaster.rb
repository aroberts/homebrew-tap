class Keymaster < Formula
  desc "TouchID-protected keychain access for scripts"
  homepage "https://github.com/aroberts/keymaster"
  url "https://github.com/aroberts/keymaster/archive/refs/tags/v0.10.0.tar.gz"
  sha256 "c2b8687130bf54c636fab46caa196822e57d24a1ed060a6b4eee40f9d670029f"
  license "MIT"
  head "https://github.com/aroberts/keymaster.git", branch: "master"

  depends_on :macos

  def install
    # swiftc links the imported frameworks itself, as build.sh relies on.
    system "swiftc", *Dir["Sources/*.swift"], "-o", "keymaster", "-O"
    bin.install "keymaster"
    bin.install "bin/keymaster-askpass"
    bin.install "bin/keymaster-ssh"
    # Off PATH: a one-shot maintenance command, surfaced via caveats below.
    libexec.install "bin/keymaster-resign"
  end

  def caveats
    <<~EOS
      If you sign keymaster with a self-signed identity to keep the Keychain
      "Always Allow" trust across upgrades (see the project README), re-sign
      after each upgrade:
        #{opt_libexec}/keymaster-resign
    EOS
  end

  test do
    assert_match "keymaster", shell_output("#{bin}/keymaster 2>&1", 1)
  end
end

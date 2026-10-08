class Keymaster < Formula
  desc "TouchID-protected keychain access for scripts"
  homepage "https://github.com/aroberts/keymaster"
  url "https://github.com/aroberts/keymaster/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "e004e42839aae4d932f00987a3392f635ff86ba56a6ee3b50e7a8a1fb0b42970"
  license "MIT"
  head "https://github.com/aroberts/keymaster.git", branch: "master"

  depends_on :macos

  def install
    # master splits the source into Sources/; v0.8.0 and earlier ship one
    # keymaster.swift. Drop the fallback once a release with Sources/ is out.
    sources = Dir["Sources/*.swift"]
    sources = ["keymaster.swift"] if sources.empty?
    # swiftc links the imported frameworks itself, as build.sh relies on.
    system "swiftc", *sources, "-o", "keymaster", "-O"
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

class GrafanaCli < Formula
  desc "Agent-first CLI to control Grafana and Grafana Cloud"
  homepage "https://github.com/matiasvillaverde/grafana-cli"
  version "0.13.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matiasvillaverde/grafana-cli/releases/download/v0.13.1/grafana_v0.13.1_darwin_arm64.tar.gz"
      sha256 "2f018d6b4d6658a98bb67767bcc5f65581897333372924abef2779f86c1c6369"
    else
      url "https://github.com/matiasvillaverde/grafana-cli/releases/download/v0.13.1/grafana_v0.13.1_darwin_amd64.tar.gz"
      sha256 "6dcc4799b03ffc1c886046d830c892d9af390b4d1807639bc60055c17e3e833c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/matiasvillaverde/grafana-cli/releases/download/v0.13.1/grafana_v0.13.1_linux_arm64.tar.gz"
      sha256 "972ec584e511529d68b587cd3dbf5c731016fc9f4d5887ddc210098db002a5be"
    else
      url "https://github.com/matiasvillaverde/grafana-cli/releases/download/v0.13.1/grafana_v0.13.1_linux_amd64.tar.gz"
      sha256 "ca41643740ef32331fed6bbd7a37156484093dc57e00d6e0ca1fe34c3875a8c2"
    end
  end

  def install
    binary = Dir["grafana", "grafana_*"].find { |path| File.file?(path) }
    odie "expected grafana binary in release archive" unless binary
    bin.install binary => "grafana"
  end

  test do
    assert_match "auth", shell_output("#{bin}/grafana help")
  end
end

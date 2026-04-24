class GrafanaCli < Formula
  desc "Agent-first CLI to control Grafana and Grafana Cloud"
  homepage "https://github.com/matiasvillaverde/grafana-cli"
  version "0.13.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matiasvillaverde/grafana-cli/releases/download/v0.13.0/grafana_v0.13.0_darwin_arm64.tar.gz"
      sha256 "050d756933f843d02a0dd96ca0fb359c0c1b03ac3149571613dc933bbd811677"
    else
      url "https://github.com/matiasvillaverde/grafana-cli/releases/download/v0.13.0/grafana_v0.13.0_darwin_amd64.tar.gz"
      sha256 "56329f5ad4ead493622ac460074d3b416ae0de99d9d88e4317c1b6d43f2b87b3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/matiasvillaverde/grafana-cli/releases/download/v0.13.0/grafana_v0.13.0_linux_arm64.tar.gz"
      sha256 "b0d2eab3b96d517d68ecd310cfb8110b36604cb71977428661770b92ef59c84e"
    else
      url "https://github.com/matiasvillaverde/grafana-cli/releases/download/v0.13.0/grafana_v0.13.0_linux_amd64.tar.gz"
      sha256 "406838760bde73fcc4f36f4b896658f30fb599d5f32b4adbee2482616a8b2320"
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

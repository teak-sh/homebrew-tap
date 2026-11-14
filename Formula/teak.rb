# teak v0.6.0, built from commit f0b8523f9e391f8117290e9be2f9cc398319671b.
# mise run release:stage made this file (scripts/release/pack in teak's
# repository); each release replaces it with its own.
class Teak < Formula
  desc "Linux dev environments for you and the coding agents you run"
  homepage "https://teak.sh"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/teak-sh/homebrew-tap/releases/download/v0.6.0/teak-v0.6.0-darwin-arm64.tar.gz"
      sha256 "ef2469311f9ca100dde58d854bffda215b8f4e6dd4cc8d715cb72b8a8a44efc2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/teak-sh/homebrew-tap/releases/download/v0.6.0/teak-v0.6.0-linux-amd64.tar.gz"
      sha256 "9085a7f91133d77525973c43c881d3bfcb7dac379cc9bd854b96d0982347925f"
    end

    on_arm do
      url "https://github.com/teak-sh/homebrew-tap/releases/download/v0.6.0/teak-v0.6.0-linux-arm64.tar.gz"
      sha256 "e6fa9e67cd6343bc311452af0541825cb233968fb2d6859053a31f70ccd98107"
    end
  end

  def install
    bin.install "teak"
    generate_completions_from_executable(bin/"teak", "completion")
  end

  test do
    assert_match "teak v#{version} ", shell_output("#{bin}/teak --version")
  end
end

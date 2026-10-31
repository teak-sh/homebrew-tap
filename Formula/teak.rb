# teak v0.3.0, built from commit e8761b27863e3ac5f7def7b3609d72f54829fd4c.
# mise run release:stage made this file (scripts/release/pack in teak's
# repository); each release replaces it with its own.
class Teak < Formula
  desc "Linux dev environments for you and the coding agents you run"
  homepage "https://teak.sh"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/teak-sh/homebrew-tap/releases/download/v0.3.0/teak-v0.3.0-darwin-arm64.tar.gz"
      sha256 "93a10e454606300d5f1d93f8bca10405f19783cb9f22aa6195823ff49b5ccec4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/teak-sh/homebrew-tap/releases/download/v0.3.0/teak-v0.3.0-linux-amd64.tar.gz"
      sha256 "d5294e3b4e35ca97a8c7b791beaf0ac91d605db05ef4af7692ee7610baf6272f"
    end

    on_arm do
      url "https://github.com/teak-sh/homebrew-tap/releases/download/v0.3.0/teak-v0.3.0-linux-arm64.tar.gz"
      sha256 "2e1a23041d59a69cc094e4aacab3d86352a6c69687cb872d680bf25635f143bc"
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

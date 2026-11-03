# teak v0.4.0, built from commit b882ef699e2ad8da2dde97d10aac99602ba66b09.
# mise run release:stage made this file (scripts/release/pack in teak's
# repository); each release replaces it with its own.
class Teak < Formula
  desc "Linux dev environments for you and the coding agents you run"
  homepage "https://teak.sh"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/teak-sh/homebrew-tap/releases/download/v0.4.0/teak-v0.4.0-darwin-arm64.tar.gz"
      sha256 "8eaecbb00314bf7460dfdeb2a5d2af18541ad041448c76c8978d5f023ed67cec"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/teak-sh/homebrew-tap/releases/download/v0.4.0/teak-v0.4.0-linux-amd64.tar.gz"
      sha256 "656c545a96bbf31348176e889500af830c21f4ef1933a28824eafebcdd3d0fa2"
    end

    on_arm do
      url "https://github.com/teak-sh/homebrew-tap/releases/download/v0.4.0/teak-v0.4.0-linux-arm64.tar.gz"
      sha256 "2253fa351d88df9952ee24505405b6e182209eff110e7d4101bfd3fe09ea3ce7"
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

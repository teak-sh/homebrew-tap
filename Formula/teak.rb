# teak v0.5.0, built from commit 3b24d7cc89fdcd0d5227123356dd0fcb6b5b2735.
# mise run release:stage made this file (scripts/release/pack in teak's
# repository); each release replaces it with its own.
class Teak < Formula
  desc "Linux dev environments for you and the coding agents you run"
  homepage "https://teak.sh"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/teak-sh/homebrew-tap/releases/download/v0.5.0/teak-v0.5.0-darwin-arm64.tar.gz"
      sha256 "633fe67227477f8954fad42eedc7e2f7fa2f27860d01e64a4f0fd65862dd51e8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/teak-sh/homebrew-tap/releases/download/v0.5.0/teak-v0.5.0-linux-amd64.tar.gz"
      sha256 "bb246085c864c53136ceb94295be212893f9b59b58daefe3e5eb51754976c9c3"
    end

    on_arm do
      url "https://github.com/teak-sh/homebrew-tap/releases/download/v0.5.0/teak-v0.5.0-linux-arm64.tar.gz"
      sha256 "95a25e6e8dfd99b3c6161551a9852140acff1a16576e842eaa0c7e465431c092"
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

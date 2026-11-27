# Generated from .github/homebrew/kopi.rb in keyute/kopi by its release workflow.
# Overwritten on every release; edit the template there.
class Kopi < Formula
  desc "Coding-agent CLI built on PiG"
  homepage "https://github.com/keyute/kopi"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keyute/kopi/releases/download/v0.3.0/kopi_0.3.0_darwin_arm64.tar.gz"
      sha256 "c2a6c1d6bb99f92a8094925fb9be19d5125c6e121503f92de81542eef3487bc1"
    else
      url "https://github.com/keyute/kopi/releases/download/v0.3.0/kopi_0.3.0_darwin_amd64.tar.gz"
      sha256 "e75fcf7307d5e688d0a84cfb5e301f8ce501d1a38fa41ad55fe05ddcff641900"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keyute/kopi/releases/download/v0.3.0/kopi_0.3.0_linux_arm64.tar.gz"
      sha256 "c664759ffae198ed9b0743fa291e832d1b2ef393e4732a3911c61d2ef0924697"
    else
      url "https://github.com/keyute/kopi/releases/download/v0.3.0/kopi_0.3.0_linux_amd64.tar.gz"
      sha256 "2b38e25d5ef7d454d7c8df9655a09bd6714e9411e963045e4817d0161fdc79fa"
    end
  end

  def install
    bin.install "kopi"
    prefix.install "third_party"
    generate_completions_from_executable(bin/"kopi", shell_parameter_format: :cobra)
  end

  test do
    assert_match "kopi v#{version}", shell_output("#{bin}/kopi version")
  end
end

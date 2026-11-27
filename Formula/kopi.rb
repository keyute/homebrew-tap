# Generated from .github/homebrew/kopi.rb in keyute/kopi by its release workflow.
# Overwritten on every release; edit the template there.
class Kopi < Formula
  desc "Coding-agent CLI built on PiG"
  homepage "https://github.com/keyute/kopi"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keyute/kopi/releases/download/v0.3.1/kopi_0.3.1_darwin_arm64.tar.gz"
      sha256 "aadab627b1d1486f0864c7473aabf2e2efc785aea7f1f3abe81282537e1849b2"
    else
      url "https://github.com/keyute/kopi/releases/download/v0.3.1/kopi_0.3.1_darwin_amd64.tar.gz"
      sha256 "122eb1f743b6d50f252ab902e1794c6d15d2f905ae87a83a4f121ca1501082cd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keyute/kopi/releases/download/v0.3.1/kopi_0.3.1_linux_arm64.tar.gz"
      sha256 "b3002e9804a91229bf1dba76ce856139aad88cb4c0680ba46234e2d7f2c4b5df"
    else
      url "https://github.com/keyute/kopi/releases/download/v0.3.1/kopi_0.3.1_linux_amd64.tar.gz"
      sha256 "9f5f1cb2c5e7aa306058bcd09460aa282f0b2ef3905f56441a190128f0396660"
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

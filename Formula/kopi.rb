# Generated from .github/homebrew/kopi.rb in keyute/kopi by its release workflow.
# Overwritten on every release; edit the template there.
class Kopi < Formula
  desc "Coding-agent CLI built on PiG"
  homepage "https://github.com/keyute/kopi"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keyute/kopi/releases/download/v0.2.0/kopi_0.2.0_darwin_arm64.tar.gz"
      sha256 "394e67da8539d42e844097a5249bef7b0d8c49632e2b4280265a986ab3b20aff"
    else
      url "https://github.com/keyute/kopi/releases/download/v0.2.0/kopi_0.2.0_darwin_amd64.tar.gz"
      sha256 "5da0f71d21ecd6f0333c6f69bad50411418ea68d0b97eef25c22127c66cbe2d5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keyute/kopi/releases/download/v0.2.0/kopi_0.2.0_linux_arm64.tar.gz"
      sha256 "656f7db25098d7f8908910726afce99e340967f05a787f7c2f9ac152eb23a515"
    else
      url "https://github.com/keyute/kopi/releases/download/v0.2.0/kopi_0.2.0_linux_amd64.tar.gz"
      sha256 "920ee0eb5e4a4a97ad4a83db087f448d4e9cc699324578bf4b4c4b9b13e13d3d"
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

# Generated from .github/homebrew/kopi.rb in keyute/kopi by its release workflow.
# Overwritten on every release; edit the template there.
class Kopi < Formula
  desc "Coding-agent CLI built on PiG"
  homepage "https://github.com/keyute/kopi"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keyute/kopi/releases/download/v0.1.0/kopi_0.1.0_darwin_arm64.tar.gz"
      sha256 "206ca417394d8a498148ebc6408043b910a7892e4d836036139a243d21a1b28d"
    else
      url "https://github.com/keyute/kopi/releases/download/v0.1.0/kopi_0.1.0_darwin_amd64.tar.gz"
      sha256 "bb38ac32e6a03f6145de467c7bcd25b5e6597ba8212d2329cf7f1a993c5be7b8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keyute/kopi/releases/download/v0.1.0/kopi_0.1.0_linux_arm64.tar.gz"
      sha256 "39b7f5f994cbea7efb24b3dd759e5fa572190d61a3b63863cc96c4e8a3d2ceae"
    else
      url "https://github.com/keyute/kopi/releases/download/v0.1.0/kopi_0.1.0_linux_amd64.tar.gz"
      sha256 "b697aafd3baeb3a969dce16f281126af21538594eeb9855d289706adea27f207"
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

class Spotuify < Formula
  desc "Keyboard-native Spotify TUI, CLI, and daemon"
  homepage "https://github.com/planetaryescape/spotuify"
  version "0.1.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/planetaryescape/spotuify/releases/download/v#{version}/spotuify-v#{version}-macos-aarch64.tar.gz"
      sha256 "aaab407ed01f2dfd5b826bd589b480fe83af9721a3e59b14339de4283db4a037"
    else
      url "https://github.com/planetaryescape/spotuify/releases/download/v#{version}/spotuify-v#{version}-macos-x86_64.tar.gz"
      sha256 "ae38a19fa819e1b2d1cbc13c6e9ddfaee67bef7557cda166bfc086114d9a45c3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/planetaryescape/spotuify/releases/download/v#{version}/spotuify-v#{version}-linux-x86_64.tar.gz"
      sha256 "3c2235e9b0b69a094e40485b506998a749cc1f7cf69de39cb86d67a577d4547f"
    end
  end

  def install
    bin.install "spotuify"
    prefix.install "README.md"
    prefix.install "install" if File.directory?("install")
    prefix.install "recipes" if File.directory?("recipes")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/spotuify --version")
  end
end

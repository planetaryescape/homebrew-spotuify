class Spotuify < Formula
  desc "Keyboard-native Spotify TUI, CLI, and daemon"
  homepage "https://github.com/planetaryescape/spotuify"
  version "0.1.60"
  license "MIT"

  on_macos do
    depends_on "portaudio"

    if Hardware::CPU.arm?
      url "https://github.com/planetaryescape/spotuify/releases/download/v#{version}/spotuify-v#{version}-macos-aarch64.tar.gz"
      sha256 "e325a772fb4d4f02ccbd00f07ffe63c63d90d9931eace10cdd212ecb294a2c5d"
    else
      url "https://github.com/planetaryescape/spotuify/releases/download/v#{version}/spotuify-v#{version}-macos-x86_64.tar.gz"
      sha256 "54ece60ba9f2e9655b1c2777aaf9e4590fdc431f24faa60be99917597c0d67b8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/planetaryescape/spotuify/releases/download/v#{version}/spotuify-v#{version}-linux-x86_64.tar.gz"
      sha256 "f4b019d1fdb75241c0b6b09afec0899971df87c023aecb74aaa1764f5ef13974"
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

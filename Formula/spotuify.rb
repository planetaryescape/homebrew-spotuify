class Spotuify < Formula
  desc "Keyboard-native Spotify TUI, CLI, and daemon"
  homepage "https://github.com/planetaryescape/spotuify"
  version "0.1.32"
  license "MIT"

  on_macos do
    depends_on "portaudio"

    if Hardware::CPU.arm?
      url "https://github.com/planetaryescape/spotuify/releases/download/v#{version}/spotuify-v#{version}-macos-aarch64.tar.gz"
      sha256 "160fd3988ed7da6fa57488b0039f175c0c5a94e5e0ba6c67b773af1c5cdc0790"
    else
      url "https://github.com/planetaryescape/spotuify/releases/download/v#{version}/spotuify-v#{version}-macos-x86_64.tar.gz"
      sha256 "5939c344899b74d52f955e1555fb20368096c692e40335cf25d407956b9a77fd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/planetaryescape/spotuify/releases/download/v#{version}/spotuify-v#{version}-linux-x86_64.tar.gz"
      sha256 "667a5a1ba818c384540e602b020b8f0617797915f70760768bf6b686d38da878"
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

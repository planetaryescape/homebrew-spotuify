class Spotuify < Formula
  desc "Keyboard-native Spotify TUI, CLI, and daemon"
  homepage "https://github.com/planetaryescape/spotuify"
  version "0.1.30"
  license "MIT"

  on_macos do
    depends_on "portaudio"

    if Hardware::CPU.arm?
      url "https://github.com/planetaryescape/spotuify/releases/download/v#{version}/spotuify-v#{version}-macos-aarch64.tar.gz"
      sha256 "175aaea39b978ccd9682cf0b8846c852d3ecb187e3244883e9036f3556feeac0"
    else
      url "https://github.com/planetaryescape/spotuify/releases/download/v#{version}/spotuify-v#{version}-macos-x86_64.tar.gz"
      sha256 "8d90d72aeae87945975a3b2367f3452479f961191ec6f0d46ad9d675097d790f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/planetaryescape/spotuify/releases/download/v#{version}/spotuify-v#{version}-linux-x86_64.tar.gz"
      sha256 "30a25520fdc3a9047a17cc38b3ad83edfcb5408920ff559d61f2e3039291257f"
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

class Spotuify < Formula
  desc "Keyboard-native Spotify TUI, CLI, and daemon"
  homepage "https://github.com/planetaryescape/spotuify"
  version "0.1.51"
  license "MIT"

  on_macos do
    depends_on "portaudio"

    if Hardware::CPU.arm?
      url "https://github.com/planetaryescape/spotuify/releases/download/v#{version}/spotuify-v#{version}-macos-aarch64.tar.gz"
      sha256 "56f5a0eb715a583c9e8b597412396bd2fa84e896691d128c0e108ab3498fef8f"
    else
      url "https://github.com/planetaryescape/spotuify/releases/download/v#{version}/spotuify-v#{version}-macos-x86_64.tar.gz"
      sha256 "02e28fe8c3c798f319e9d3df45e945d18e18122c65cb858a9a97940ea2c4f88f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/planetaryescape/spotuify/releases/download/v#{version}/spotuify-v#{version}-linux-x86_64.tar.gz"
      sha256 "6b16040e3f32b0aa2994d4da4abf582fe499c4d6a69623e7a1ef5abc331d5ced"
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

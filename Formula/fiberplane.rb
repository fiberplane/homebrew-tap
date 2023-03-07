class Fiberplane < Formula
  desc "Command line tools for Fiberplane"
  homepage "https://fiberplane.com"
  url "https://github.com/fiberplane/fp.git"
  head "https://github.com/fiberplane/fp.git", branch: "main"
  version: "2.6.0"
  license "Apache-2.0 or MIT"

  on_macos do
     if Hardware::CPU.arm?
      url "https://fp.dev/fp/latest/aarch64-apple-darwin/fp"
      sha256 "4e93ac3b50a250e932077ea0c1467cb82a6b29bdc07d57d9577333e661d9e91b"

      def install
        bin.install "fp"
      end
    end
    if Hardware::CPU.intel?
      url "https://fp.dev/fp/latest/x86_64-apple-darwin/fp"
      sha256 "95c02f980016f394abcee33316677bb964740e66a4cade9eaffa4bb119882850"

      def install
        bin.install "fp"
      end
    end
  end

  on_linux do
        if Hardware::CPU.intel?
      url "https://fp.dev/fp/latest/x86_64-unknown-linux-gnu/fp"
      sha256 "c86d74b6c5a4c9dea23aa4dbe36fd909a35480d19008642f9522f82d634fc565"

      def install
        bin.install "fp"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://fp.dev/fp/latest/aarch64-unknown-linux-gnu/fp"
      sha256 "71560e22e4d169898e92e76fa5b55f89de1d00c30e8d6ccc2d70fdb348ce356e"

      def install
        bin.install "fp"
      end
    end
  end

  test do
    assert_match "Usage: fp [OPTIONS] <COMMAND>", shell_output("fp", 1)
  end
end

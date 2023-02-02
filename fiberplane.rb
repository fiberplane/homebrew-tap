class Fiberplane < Formula
  desc "Command line tools for Fiberplane"
  homepage "https://fiberplane.com"
  url "https://github.com/fiberplane/fp.git"
  version: "2.4.0"
  sha256 ""
  license "Apache-2.0 or MIT"

  depends_on "rust" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://fp.dev/fp/latest/aarch64-apple-darwin/fp"
      sha256 "" # FIXME: add sha
      def install
        bin.install "fiberplane"
      end
    end
    if Hardware::CPU.intel?
      url "https://fp.dev/fp/latest/x86_64-apple-darwin/fp"
      sha256 "" # FIXME: add sha
      def install
        bin.install "fiberplane"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://fp.dev/fp/latest/x86_64-unknown-linux-gnu/fp"
      sha256 "" # FIXME: add sha

      def install
        bin.install "fiberplane"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://fp.dev/fp/latest/aarch64-unknown-linux-gnu/fp"
      sha256 "" # FIXME: add sha

      def install
        bin.install "fiberplane"
      end
    end
  end

  test do
    assert_match "Usage: fp [OPTIONS] <COMMAND>", shell_output("fp", 1)
  end
end

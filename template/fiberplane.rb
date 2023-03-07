class Fiberplane < Formula
  desc "Command line tools for Fiberplane"
  homepage "https://fiberplane.com"
  url "https://github.com/fiberplane/fp.git"
  head "https://github.com/fiberplane/fp.git", branch: "main"
  version: {{version}}
  license "Apache-2.0 or MIT"

  on_macos do
     if Hardware::CPU.arm?
      url "https://fp.dev/fp/latest/aarch64-apple-darwin/fp"
      sha256 {{checksum_aarch64-apple-darwin}}

      def install
        bin.install "fp"
      end
    end
    if Hardware::CPU.intel?
      url "https://fp.dev/fp/latest/x86_64-apple-darwin/fp"
      sha256 {{checksum_x86_64-apple-darwin}}

      def install
        bin.install "fp"
      end
    end
  end

  on_linux do
        if Hardware::CPU.intel?
      url "https://fp.dev/fp/latest/x86_64-unknown-linux-gnu/fp"
      sha256 {{checksum_x86_64-unknown-linux-gnu}}

      def install
        bin.install "fp"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://fp.dev/fp/latest/aarch64-unknown-linux-gnu/fp"
      sha256 {{checksum_aarch64-unknown-linux-gnu}}

      def install
        bin.install "fp"
      end
    end
  end

  test do
    assert_match "Usage: fp [OPTIONS] <COMMAND>", shell_output("fp", 1)
  end
end

class Fp < Formula
  desc "Command line tools for Fiberplane"
  homepage "https://fiberplane.com"
  url "https://github.com/fiberplane/fp.git"
  head "https://github.com/fiberplane/fp.git", branch: "main"
  version "2.7.0"
  license "Apache-2.0 or MIT"

  on_macos do
     if Hardware::CPU.arm?
      url "https://fp.dev/fp/v2.7.0/aarch64-apple-darwin/fp"
      sha256 "fedb67f2e3d794bc211ec8be9bd462ae28d2bcc72f094ffedc4d9d87769a8e5e"

      def install
        bin.install "fp"
      end
    end
    if Hardware::CPU.intel?
      url "https://fp.dev/fp/v2.7.0/x86_64-apple-darwin/fp"
      sha256 "5a11252512c5e87ab3f5f9b898a03448febfa37c7fe19d82ab82389f2d4f8f4a"

      def install
        bin.install "fp"
      end
    end
  end

  on_linux do
        if Hardware::CPU.intel?
      url "https://fp.dev/fp/v2.7.0/x86_64-unknown-linux-gnu/fp"
      sha256 "95846876017cf508dd83ec557219a6977c8264c46253719f0f7c3997ae26b22a"

      def install
        bin.install "fp"
      end
    end

  end

  test do
    assert_match "Usage: fp [OPTIONS] <COMMAND>", shell_output("fp", 1)
  end
end

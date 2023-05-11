class Fp < Formula
  desc "Command line tools for Fiberplane"
  homepage "https://fiberplane.com"
  url "https://github.com/fiberplane/fp.git"
  head "https://github.com/fiberplane/fp.git", branch: "main"
  version "2.9.0"
  license "Apache-2.0 or MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://fp.dev/fp/v2.9.0/aarch64-apple-darwin/fp"
      sha256 "d8465131a595a343e95897bf461ab43b698b27f4c7b924cc55df7e794bb2d620"

      def install
        bin.install "fp"
      end
    end
    if Hardware::CPU.intel?
      url "https://fp.dev/fp/v2.9.0/x86_64-apple-darwin/fp"
      sha256 "3a36179527d0f50aae6b2f64c20b899906d07e3f23a85c4e40d4d651b67877ff"

      def install
        bin.install "fp"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://fp.dev/fp/v2.9.0/x86_64-unknown-linux-gnu/fp"
      sha256 "aaf82c770c4341dd5eb16b372efa71b4a2732308c8e1af2b43bd9c9aae6bb7e1"

      def install
        bin.install "fp"
      end
    end

  end

  test do
    assert_match "Usage: fp [OPTIONS] <COMMAND>", shell_output("fp", 1)
  end
end

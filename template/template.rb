class Fp < Formula
  desc "Command line tools for Fiberplane"
  homepage "https://fiberplane.com"
  url "https://github.com/fiberplane/fp.git"
  head "https://github.com/fiberplane/fp.git", branch: "main"
  version "${FP_VERSION}"
  license "Apache-2.0 or MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://fp.dev/fp/v${FP_VERSION}/aarch64-apple-darwin/fp"
      sha256 "${SHA256_AARCH64_APPLE_DARWIN}"

      def install
        bin.install "fp"
      end
    end
    if Hardware::CPU.intel?
      url "https://fp.dev/fp/v${FP_VERSION}/x86_64-apple-darwin/fp"
      sha256 "${SHA256_X86_64_APPLE_DARWIN}"

      def install
        bin.install "fp"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://fp.dev/fp/v${FP_VERSION}/x86_64-unknown-linux-gnu/fp"
      sha256 "${SHA256_X86_64_UNKNOWN_LINUX_GNU}"

      def install
        bin.install "fp"
      end
    end

  end

  test do
    assert_match "Usage: fp [OPTIONS] <COMMAND>", shell_output("fp", 1)
  end
end

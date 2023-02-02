class Fiberplane < Formula
  desc "Command line tools for Fiberplane"
  homepage "https://fiberplane.com"
  url "https://github.com/fiberplane/fp.git"
  head "https://github.com/fiberplane/fp.git", branch: "main"
  version: "2.4.0"
  license "Apache-2.0 or MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_ventura:  ""
    sha256 cellar: :any_skip_relocation, arm64_monterey: ""
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  ""
    sha256 cellar: :any_skip_relocation, ventura:        ""
    sha256 cellar: :any_skip_relocation, monterey:       ""
    sha256 cellar: :any_skip_relocation, big_sur:        ""
    sha256 cellar: :any_skip_relocation, catalina:       ""
    sha256 cellar: :any_skip_relocation, x86_64_linux:   ""
    sha256 cellar: :any_skip_relocation, arm64_linux:    ""
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "-vv", *std_cargo_args
    generate_completions_from_executable(bin/"fp", "completion")
  end

  test do
    assert_match "Usage: fp [OPTIONS] <COMMAND>", shell_output("fp", 1)
  end
end

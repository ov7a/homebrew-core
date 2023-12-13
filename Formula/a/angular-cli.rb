require "language/node"

class AngularCli < Formula
  desc "CLI tool for Angular"
  homepage "https://cli.angular.io/"
  url "https://registry.npmjs.org/@angular/cli/-/cli-17.0.7.tgz"
  sha256 "5dbb806d36c8aa0418193e62583a967a444db9c93b5bf8c3f8121973adff22fa"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "83492043a26aed48c25232cf67993bb49835ae27828620a70ee985c8e8be1df3"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "83492043a26aed48c25232cf67993bb49835ae27828620a70ee985c8e8be1df3"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "83492043a26aed48c25232cf67993bb49835ae27828620a70ee985c8e8be1df3"
    sha256 cellar: :any_skip_relocation, sonoma:         "1c574004b547fd71021c13efc94f4d8919762f8a2593329f1ada1b888877d884"
    sha256 cellar: :any_skip_relocation, ventura:        "1c574004b547fd71021c13efc94f4d8919762f8a2593329f1ada1b888877d884"
    sha256 cellar: :any_skip_relocation, monterey:       "1c574004b547fd71021c13efc94f4d8919762f8a2593329f1ada1b888877d884"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "83492043a26aed48c25232cf67993bb49835ae27828620a70ee985c8e8be1df3"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"ng", "new", "angular-homebrew-test", "--skip-install"
    assert_predicate testpath/"angular-homebrew-test/package.json", :exist?, "Project was not created"
  end
end

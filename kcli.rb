require "language/go"
require "utils"

class Kcli < Formula
  desc " Apple Cloud Infrastructure command line utility"
  homepage "https://github.pie.apple.com/aci/kcli"

  stable do
    version "1.0.4"
    url "https://artifacts.apple.com/aci-binaries-local/com/apple/aci/kcli/1.0.4/kcli-1.0.4.tar.gz"
    sha256 "73a77810b7ead87023676e4633253a2745aa19a2405ef4b5f7589e1a0f05e087"
  end

  head do
    version "1.1.0-beta.2"
    url "https://artifacts.apple.com/aci-binaries-local/com/apple/aci/kcli/1.1.0-beta.2/kcli-1.1.0-beta.2.tar.gz"
    sha256 "e57572d2c4871bcde0aeb70f49fc308c279a025e9394cd2f464c3d98b0aa75a4"
  end

  if which("kubectl", ENV['PATH'] + ":/usr/local/bin").nil?
    depends_on "kubectl"
  end

  bottle :unneeded

  def install
    bin.install "kcli"
    bin.install_symlink "kcli" => "apc"
  end

  test do
    system "#{bin}/kcli", "--help"
  end
end
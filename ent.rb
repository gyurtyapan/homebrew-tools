require "language/go"
require "utils"

class Ent < Formula
  desc " Network Entitlements CLI tool"
  homepage "https://github.pie.apple.com/official-star/repo/blob/main/docs/ent/README.md"
  version "1.0.2"
  sha256 "638e82bcc463b59e848cb60b8115fa9ed5fd9342a7396816aded4481ccd15e50"
  url "https://artifacts.apple.com/aci-binaries-local/com/apple/aci/ent/#{version}/ent-v#{version}.tar.gz"

  if which("ent", ENV['PATH'] + ":/usr/local/bin").nil?
    depends_on "ent"
  end

  bottle :unneeded

  def install
    bin.install "ent"
  end

  test do
    system "#{bin}/ent", "--help"
  end
end
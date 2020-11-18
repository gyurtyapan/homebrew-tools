require "utils"

class Virtctl < Formula
  desc "ACI virtctl utility for KubeVirt"
  homepage "https://github.pie.apple.com/privatecloud/kubevirt"

  stable do
    version "0.29.0-0"
    url "https://artifacts.apple.com/aci-monsoon-binaries-local/virtctl-archives/virtctl-v0.29.0-darwin-amd64.tar.gz"
    sha256 "ba48b646ea13c458cab853af8c44bbef64f5d3ecd99fe229d7fa5c71e44bee44"
  end

  head do
    version "0.29.0-0"
    url "https://artifacts.apple.com/aci-monsoon-binaries-local/virtctl-archives/virtctl-v0.29.0-darwin-amd64.tar.gz"
    sha256 "ba48b646ea13c458cab853af8c44bbef64f5d3ecd99fe229d7fa5c71e44bee44"
  end

  if which("kubectl", ENV['PATH'] + ":/usr/local/bin").nil?
    depends_on "kubectl"
  end

  bottle :unneeded

  def install
    bin.install "virtctl"
  end

  def caveats; <<~EOS
    \033[1;34m
    !!!!!!!!!!!!!!!!!
    The command 'virtctl vnc' Requires a third party VNC client to be installed.

    Tiger VNC: https://github.com/TigerVNC/tigervnc/releases
    RealViewer: https://www.realvnc.com/en/connect/download/viewer/macos/

    Please note and respect software licensing policies if you choose to install a VNC client.

    Create your own /usr/local/bin/remote-viewer to add custom VNC clients.
    !!!!!!!!!!!!!!!!!
    \033[0m
    EOS
  end

  test do
    system "#{bin}/virtctl", "--help"
  end
end
Skip to content
 Enterprise
Search or jump to…

Pull requests
Issues
Explore
 
@gyurtyapan 
Learn Git and GitHub without any code!
Using the Hello World guide, you’ll start a branch, write comments, and open a pull request.


0
65aci/homebrew-tools
 Code Issues 2 Pull requests 0 Projects 0 Wiki Insights
homebrew-tools/docker-machine-driver-vmware-nested.rb
@cchengleo cchengleo Add docker-machine-driver-vmware-nested formula (#14)
682c3c6 on Jul 9
30 lines (24 sloc)  1002 Bytes
  
class DockerMachineDriverVmwareNested < Formula
  desc "VMware Fusion & Workstation docker-machine driver with nested virtualization support"
  homepage "https://www.vmware.com/products/personal-desktop-virtualization.html"
  url "https://github.pie.apple.com/aci/docker-machine-driver-vmware.git",
    :tag      => "v0.1.1.patch",
    :revision => "bd9be93ce66e013874da133965a7de7eb378b6d3"

  depends_on "go" => :build
  depends_on "docker-machine"

  def install
    ENV["GOPATH"] = buildpath

    dir = buildpath/"src/github.pie.apple.com/aci/docker-machine-driver-vmware"
    dir.install buildpath.children

    cd dir do
      system "go", "build", "-o", "#{bin}/docker-machine-driver-vmware",
            "-ldflags", "-X main.version=#{version}"
      prefix.install_metafiles
    end
  end

  test do
    docker_machine = Formula["docker-machine"].opt_bin/"docker-machine"
    output = shell_output("#{docker_machine} create --driver vmware -h")
    assert_match "engine-env", output
  end
end
© 2020 GitHub, Inc.
Help
Support
API
Training
Blog
About
GitHub Enterprise Server 2.19.21

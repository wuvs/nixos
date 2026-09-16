{pkgs, ...}: {
  environment.sessionVariables.LIBVIRT_DEFAULT_URI = "qemu:///system";

  virtualisation.podman = {
    enable = true;
    dockerSocket.enable = true;
    dockerCompat = true;
  };

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
    };
  };

  programs.virt-manager = {
    enable = true;
  };
}

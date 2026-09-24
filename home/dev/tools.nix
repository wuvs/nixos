{pkgs, ...}: {
  home.packages = with pkgs; [
    binutils
    gdb
    gcc
    gnumake
    llvm
    lld
    wget
    curl
    yq
    libosinfo
    osinfo-db
    cloud-utils
    inotify-tools
    bruno
    scanmem
  ];

  programs.jq = {
    enable = true;
  };
}

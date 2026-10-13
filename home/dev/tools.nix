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
    protobuf
    postgresql
    buf
  ];

  programs.jq = {
    enable = true;
  };
}

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
  ];

  programs.jq = {
    enable = true;
  };
}

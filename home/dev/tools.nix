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
  ];

  programs.jq = {
    enable = true;
  };
}

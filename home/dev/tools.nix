{pkgs, ...}: {
  home.packages = with pkgs; [
    binutils
    gdb
    gcc
    gnumake
    llvm
    lld
  ];
}

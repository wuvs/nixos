{pkgs, ...}: {
  home.packages = with pkgs; [
    proton-vpn
    proton-pass
    proton-pass-cli
  ];
}

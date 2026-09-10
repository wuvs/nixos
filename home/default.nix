{
  host,
  pkgs,
  ...
}: {
  imports = [
    ./ai/claude.nix
    ./apps
    ./browsers/brave-origin.nix
    ./desktop/hyprland.nix
    ./desktop/noctalia.nix
    ./desktop/theming.nix
    ./dev/git.nix
    ./dev/ssh.nix
    ./editors/zed.nix
    ./shell
    ./terminal/kitty.nix
  ];

  home.username = host.username;
  home.homeDirectory = "/home/${host.username}";

  home.packages = with pkgs; [
    nixd
    alejandra
  ];

  home.stateVersion = host.stateVersion;

  programs.home-manager.enable = true;
}

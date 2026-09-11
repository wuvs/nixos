{host, ...}: {
  imports = [
    ./ai
    ./apps
    ./browsers
    ./desktop
    ./dev
    ./editors
    ./shell
    ./terminal
  ];

  home.username = host.username;
  home.homeDirectory = "/home/${host.username}";

  home.stateVersion = host.stateVersion;

  programs.home-manager.enable = true;
}

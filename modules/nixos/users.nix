{
  host,
  pkgs,
  ...
}: {
  users.users.${host.username} = {
    isNormalUser = true;
    description = host.username;
    extraGroups = [
      "networkmanager"
      "wheel"
      "lpadmin"
      "podman"
    ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  security.sudo.wheelNeedsPassword = false;
}

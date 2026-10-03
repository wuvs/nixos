{host, ...}: {
  imports = [
    ./hardware-configuration.nix

    ../../modules/nixos/amd-microcode.nix
    ../../modules/nixos/audio.nix
    ../../modules/nixos/bluetooth.nix
    ../../modules/nixos/boot.nix
    ../../modules/nixos/browsers.nix
    ../../modules/nixos/fingerprint.nix
    ../../modules/nixos/fonts.nix
    ../../modules/nixos/networking.nix
    ../../modules/nixos/nix-ld.nix
    ../../modules/nixos/nix-settings.nix
    ../../modules/nixos/noctalia.nix
    ../../modules/nixos/nvidia.nix
    ../../modules/nixos/onepassword.nix
    ../../modules/nixos/power.nix
    ../../modules/nixos/printing.nix
    ../../modules/nixos/scanning.nix
    ../../modules/nixos/session.nix
    ../../modules/nixos/steam.nix
    ../../modules/nixos/users.nix
    ../../modules/nixos/virtualisation.nix
  ];

  networking.hostName = host.hostName;
  networking.hosts."192.168.122.31" = ["gitlab.home.arpa"];
  networking.firewall.interfaces.virbr0.allowedTCPPorts = [3100];
  time.timeZone = host.timeZone;

  system.stateVersion = host.stateVersion;
}

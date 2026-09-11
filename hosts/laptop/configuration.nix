{
  host,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../../modules/nixos/audio.nix
    ../../modules/nixos/bluetooth.nix
    ../../modules/nixos/boot.nix
    ../../modules/nixos/browsers.nix
    ../../modules/nixos/fingerprint.nix
    ../../modules/nixos/fonts.nix
    ../../modules/nixos/intel-graphics.nix
    ../../modules/nixos/intel-microcode.nix
    ../../modules/nixos/networking.nix
    ../../modules/nixos/nix-ld.nix
    ../../modules/nixos/nix-settings.nix
    ../../modules/nixos/noctalia.nix
    ../../modules/nixos/onepassword.nix
    ../../modules/nixos/power.nix
    ../../modules/nixos/printing.nix
    ../../modules/nixos/session.nix
    ../../modules/nixos/steam.nix
    ../../modules/nixos/users.nix
  ];

  networking.hostName = host.hostName;
  time.timeZone = host.timeZone;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    brightnessctl
  ];

  system.stateVersion = host.stateVersion;
}

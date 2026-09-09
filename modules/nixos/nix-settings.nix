{ host, lib, ... }:

{
  i18n.defaultLocale = host.defaultLocale;

  i18n.extraLocaleSettings = {
    LC_ADDRESS = host.defaultLocale;
    LC_IDENTIFICATION = host.defaultLocale;
    LC_MEASUREMENT = host.defaultLocale;
    LC_MONETARY = host.defaultLocale;
    LC_NAME = host.defaultLocale;
    LC_NUMERIC = host.defaultLocale;
    LC_PAPER = host.defaultLocale;
    LC_TELEPHONE = host.defaultLocale;
    LC_TIME = host.defaultLocale;
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "1password"
      "1password-cli"
      "1password-gui"
      "claude-code"
      "cups-brother-dcp1610wlpr"
      "nvidia-persistenced"
      "nvidia-settings"
      "nvidia-x11"
      "steam"
      "steam-original"
      "steam-run"
      "steam-unwrapped"
    ];
}

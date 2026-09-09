{ ... }:

{
  services.power-profiles-daemon.enable = true;

  zramSwap = {
    enable = true;
    algorithm = "zstd";
  };
}

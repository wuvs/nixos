{ pkgs, ... }:

{
  services.xserver.videoDrivers = [ "modesetting" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;

    extraPackages = with pkgs; [
      intel-media-driver
      intel-compute-runtime
    ];
  };

  environment.sessionVariables.LIBVA_DRIVER_NAME = "iHD";
}

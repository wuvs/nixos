{ pkgs, ... }:

{
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      cups-brother-dcp1610wlpr
      cups-filters
      cups-browsed
    ];
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  environment.systemPackages = [ pkgs.cups-pdf-to-pdf ];
}

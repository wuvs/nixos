{pkgs, ...}: {
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      cups-brother-dcp1610wlpr
      cups-filters
      cups-browsed
    ];
  };

  hardware.printers = {
    ensurePrinters = [
      {
        name = "Brother_DCP-1610W";
        description = "Brother DCP-1610W";
        deviceUri = "socket://10.0.0.239:9100";
        model = "brother-DCP1610W-cups-en.ppd";
      }
    ];
    ensureDefaultPrinter = "Brother_DCP-1610W";
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  environment.systemPackages = [pkgs.cups-pdf-to-pdf];
}

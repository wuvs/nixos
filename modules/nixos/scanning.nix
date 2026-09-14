{...}: {
  hardware.sane = {
    enable = true;
    brscan4 = {
      enable = true;
      netDevices.dcp1610w = {
        model = "DCP-1610W";
        ip = "10.0.0.239";
      };
    };
  };
}

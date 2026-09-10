{...}: {
  networking.networkmanager.enable = true;

  networking.getaddrinfo = {
    enable = true;
    precedence = {
      "::ffff:0:0/96" = 100;
      "::/0" = 50;
    };
  };
}

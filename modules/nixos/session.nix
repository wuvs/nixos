{pkgs, ...}: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };

  services.displayManager.noctalia-greeter.enable = true;

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.greetd.enableGnomeKeyring = true;

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.gnome-keyring];
    config.common."org.freedesktop.impl.portal.Secret" = ["gnome-keyring"];
  };
}

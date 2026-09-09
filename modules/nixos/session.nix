{ ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };

  services.displayManager.noctalia-greeter.enable = true;

  xdg.portal = {
    enable = true;
  };
}

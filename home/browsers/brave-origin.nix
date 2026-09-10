{...}: {
  programs.brave-origin = {
    enable = true;
    commandLineArgs = [
      "--ozone-platform=wayland"
      "--ozone-platform-hint=wayland"
      "--enable-features=TouchpadOversrollHistoryNavigation"
    ];
    extensions = [
      {id = "aeblfdkhhhdcdjpifhhbdiojplfjncoa";}
    ];
  };
}

{...}: {
  programs.vesktop = {
    enable = true;
    settings = {
      appBadge = false;
      arRPC = true;
      checkUpdates = false;
      customTitleBar = false;
      disableMinSize = true;
      minimizeToTray = false;
      tray = false;
      splashBackground = "#000000";
      splashColor = "#ffffff";
      splashTheming = true;
      staticTitle = true;
      hardwareAcceleration = true;
      discordBranch = "stable";
    };
    vencord.settings = {
      autoUpdate = false;
      autoUpdateNotifications = false;
      disableMinSize = true;
      enabledThemes = ["noctalia.theme.css"];
      notifyAboutUpdates = false;
      plugins = {
        FakeNitro = {
          enabled = true;
        };
        MessageLogger = {
          enabled = true;
          ignoreSelf = true;
        };
      };
      useQuickCss = true;
    };
  };
}

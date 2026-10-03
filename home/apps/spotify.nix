{
  pkgs,
  inputs,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in {
  imports = [inputs.spicetify-nix.homeManagerModules.spicetify];

  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      hidePodcasts
      shuffle
    ];
    theme = spicePkgs.themes.comfy // {injectThemeJs = false;};
    colorScheme = "custom";
    customColorScheme = {
      text = "e3e2e6";
      subtext = "c4c6cf";
      main = "121316";
      main-elevated = "121316";
      main-transition = "0d0e11";
      highlight = "1b1b1e";
      highlight-elevated = "343538";
      sidebar = "121316";
      player = "121316";
      card = "121316";
      shadow = "121316";
      selected-row = "e3e2e6";
      button = "b2c7f5";
      button-active = "b2c7f5";
      button-disabled = "b2c7f5";
      tab-active = "121316";
      notification = "e6b8e5";
      notification-error = "ffb4ab";
      misc = "121316";
      play-button = "bfc6db";
      play-button-active = "bfc6db";
      progress-fg = "b2c7f5";
      progress-bg = "121316";
      heart = "ffb4ab";
      pagelink-active = "b489b4";
      radio-btn-active = "b489b4";
    };
  };
}

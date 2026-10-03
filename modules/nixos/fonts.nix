{pkgs, ...}: {
  fonts.packages = with pkgs; [
    noto-fonts-color-emoji
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    inter
  ];

  fonts.fontconfig.defaultFonts = {
    sansSerif = ["Inter Variable"];
    monospace = ["JetBrainsMono Nerd Font"];
    emoji = ["Noto Color Emoji"];
  };
}

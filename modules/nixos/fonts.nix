{pkgs, ...}: {
  fonts.packages = with pkgs; [
    noto-fonts-color-emoji
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    fira-sans
  ];

  fonts.fontconfig.defaultFonts = {
    sansSerif = ["Fira Sans"];
    monospace = ["JetBrainsMono Nerd Font"];
    emoji = ["Noto Color Emoji"];
  };
}

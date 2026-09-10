{pkgs, ...}: {
  fonts.packages = with pkgs; [
    noto-fonts-color-emoji
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
  ];

  fonts.fontconfig.defaultFonts.emoji = ["Noto Color Emoji"];
}

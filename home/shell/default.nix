{config, ...}: {
  programs.zsh = {
    enable = true;
    setOptions = [
      "APPEND_HISTORY"
    ];
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
        "web-search"
        "copyfile"
        "copybuffer"
        "dirhistory"
      ];
    };
    autosuggestion = {
      enable = true;
    };
    fastSyntaxHighlighting = {
      enable = true;
    };
    initContent = ''
      source $HOME/.config/fzf/themes/noctalia.sh
    '';
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    icons = "always";
  };

  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    configFile = "${config.home.homeDirectory}/.config/ohmyposh/zen.toml";
  };

  home.file.".config/ohmyposh/zen.toml".source = ./ohmyposh/zen.toml;

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.tmux = {
    enable = true;
  };
}

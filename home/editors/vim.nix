{...}: {
  programs.vim = {
    enable = true;
    settings = {
      number = true;
      shiftwidth = 4;
      tabstop = 4;
      expandtab = true;
      mouse = "a";
      ignorecase = true;
      smartcase = true;
      history = 1000;
    };
    extraConfig = ''
      set nocompatible
      filetype on
      filetype plugin on
      filetype indent on
      syntax on
      set nobackup
      set scrolloff=10
      set incsearch
      set showcmd
      set showmode
      set showmatch
      set hlsearch
      set ignorecase
      set smartcase
    '';
  };
}

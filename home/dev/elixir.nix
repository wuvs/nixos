{pkgs, ...}: {
  home.packages = with pkgs; [
    beam29Packages.elixir
    beam29Packages.elixir-ls
  ];
}

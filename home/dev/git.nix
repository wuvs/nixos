{
  lib,
  pkgs,
  ...
}:

{
  programs.git = {
    enable = true;
    settings = {
      init = {
        defaultBranch = "main";
      };
      user = {
        name = "wuvs";
        email = "wiph975@gmail.com";
      };
      gpg = {
        format = "ssh";
      };
      "gpg \"ssh\"" = {
        program = "${lib.getExe' pkgs._1password-gui "op-ssh-sign"}";
      };
      commit = {
        gpgsign = true;
      };
      user = {
        signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDXtAQqYoeQIlit4dE3zmjoivsh9ATe9/OSoGEscJXCd";
      };
    };
  };
}

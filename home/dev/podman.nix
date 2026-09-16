{pkgs, ...}: {
  home.packages = with pkgs; [
    podman-compose
  ];

  services.podman = {
    enable = true;
    settings = {
      registries.search = [
        "docker.io"
      ];
    };
  };
}

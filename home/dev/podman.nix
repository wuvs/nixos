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
      containers.engine.compose_warning_logs = false;
    };
  };
}

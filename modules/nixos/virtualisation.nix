{...}: {
  virtualisation.podman = {
    enable = true;
    dockerSocket.enable = true;
    networkSocket.enable = true;
    dockerCompat = true;
  };
}

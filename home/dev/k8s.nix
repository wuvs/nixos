{pkgs, ...}: {
  home.packages = with pkgs; [
    helm-ls
    k3d
    kubectl
    kubernetes-helm
    kubebuilder
    krew
  ];

  programs.k9s = {
    enable = true;
  };
}

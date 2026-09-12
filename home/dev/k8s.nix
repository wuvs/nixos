{pkgs, ...}: {
  home.packages = with pkgs; [
    helm-ls
    k3d
    kubectl
    kubernetes-helm
    kubebuilder
    kubectx
    argocd
    argo-workflows
    argo-rollouts
  ];

  programs.k9s = {
    enable = true;
  };
}

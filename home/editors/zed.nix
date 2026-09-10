{...}: {
  programs.zed-editor = {
    enable = true;
    defaultEditor = true;
    userSettings = {
      icon_theme = "Catppuccin Mocha";
      agent_servers = {
        claude-acp = {
          type = "registry";
        };
      };
      ui_font_size = 16;
      buffer_font_size = 14;
      theme = {
        mode = "system";
        light = "Noctalia Light";
        dark = "Noctalia Dark";
      };
      file_types = {
        Ansible = [
          "**.ansible.yml"
          "**.ansible.yaml"
          "**/defaults/*.yml"
          "**/defaults/*.yaml"
          "**/meta/*.yml"
          "**/meta/*.yaml"
          "**/tasks/*.yml"
          "**/tasks/*.yaml"
          "**/handlers/*.yml"
          "**/handlers/*.yaml"
          "**/group_vars/*.yml"
          "**/group_vars/*.yaml"
          "**/playbooks/*.yaml"
          "**/playbooks/*.yml"
          "**playbook*.yaml"
          "**playbook*.yml"
        ];
      };
      languages = {
        Nix = {
          language_servers = ["nixd" "!nil"];
          formatter = {
            external = {
              command = "alejandra";
              arguments = ["--quiet" "--"];
            };
          };
          format_on_save = "on";
        };
      };
    };
    extensions = [
      "ansible"
      "docker-compose"
      "dockerfile"
      "elixir"
      "helm"
      "html"
      "lua"
      "make"
      "nix"
      "opentofu"
      "toml"
    ];
  };
}

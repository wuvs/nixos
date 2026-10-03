{
  host,
  lib,
  pkgs,
  ...
}: let
  resolution = lib.splitString "x" (builtins.head (lib.splitString "@" host.mode));
  width = lib.toInt (builtins.elemAt resolution 0);
  height = lib.toInt (builtins.elemAt resolution 1);
in {
  home.packages = with pkgs; [
    brightnessctl
  ];

  programs.noctalia = {
    enable = true;
    systemd.enable = true;

    settings = {
      brightness.sync_all_monitors = true;
      bar.default.margin_ends = 300;

      desktop_widgets.enabled = false;

      idle = {
        behavior_order = ["lock" "screen-off" "lock-and-suspend"];
        behavior = {
          lock = {
            action = "lock";
            enabled = true;
            timeout = 600.0;
          };
          "lock-and-suspend" = {
            action = "lock_and_suspend";
            enabled = true;
            timeout = 900.0;
          };
          "screen-off" = {
            action = "screen_off";
            enabled = true;
            timeout = 660.0;
          };
        };
      };

      location.auto_locate = true;

      lockscreen.transition = [];

      lockscreen_widgets = {
        enabled = false;
        schema_version = 2;
        widget_order = ["lockscreen-login-box@${host.monitor}"];

        grid = {
          cell_size = 16;
          major_interval = 4;
          visible = true;
        };

        widget."lockscreen-login-box@${host.monitor}" = {
          box_height = 196.0;
          box_width = 810.0;
          cx = width / 2.0;
          cy = height * 898.0 / 1080.0;
          output = host.monitor;
          placement_height = height * 1.0;
          placement_width = width * 1.0;
          rotation = 0.0;
          type = "login_box";

          settings = {
            background_color = "surface_variant";
            background_opacity = 0.88;
            background_radius = 12.0;
            center_password_text = false;
            input_opacity = 1.0;
            input_radius = 6.0;
            layout = "regular";
            show_caps_lock = true;
            show_keyboard_layout = true;
            show_login_button = true;
            show_media = true;
            show_session_buttons = true;
            show_unlock_hint = true;
            show_weather = true;
          };
        };
      };

      nightlight = {
        enabled = true;
      };

      shell = {
        app_icon_colorize = true;
        lang = "en";
        greeter_sync.auto_sync = true;
        launch_apps_as_systemd_services = true;
      };

      theme = {
        builtin = "Noctalia";
        mode = "dark";
        source = "wallpaper";
        wallpaper_scheme = "m3-content";

        templates = {
          builtin_ids = ["btop" "gtk3" "gtk4" "hyprland" "kitty" "qt"];
          community_ids = ["claude-code" "brave-origin" "fastfetch" "pywalfox" "zed" "tmux" "fzf" "discord" "bat" "yazi" "spicetify"];
        };
      };

      wallpaper = {
        directory = "~/Pictures/Wallpapers";
        default.path = "~/Pictures/Wallpapers/3.png";
        last.path = "~/Pictures/Wallpapers/3.png";
        monitors."${host.monitor}".path = "~/Pictures/Wallpapers/3.png";
      };
    };
  };

  home.file."Pictures/Wallpapers" = {
    source = ./wallpapers;
    recursive = true;
  };
}

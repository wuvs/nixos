{
  config,
  host,
  lib,
  ...
}: {
  xdg.configFile."uwsm/env".source = "${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh";

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;

    systemd.enable = false;

    extraConfig = ''
      require("noctalia").apply_theme()
    '';

    settings = {
      mod._var = "SUPER";

      monitor = [
        {
          output = host.monitor;
          mode = host.mode;
          position = "0x0";
          scale = 1;
        }
      ];

      env = [
        {_args = ["XCURSOR_SIZE" "24"];}
        {_args = ["HYPRCURSOR_SIZE" "24"];}
        {_args = ["QT_QPA_PLATFORM" "wayland;xcb"];}
        {_args = ["QT_QPA_PLATFORMTHEME" "qt6ct"];}
        {_args = ["QT_WAYLAND_DISABLE_WINDOWDECORATION" "1"];}
      ];

      config = {
        general = {
          gaps_in = 5;
          gaps_out = 10;
        };

        decoration = {
          rounding = 20;
          rounding_power = 2;

          shadow = {
            enabled = true;
            range = 4;
            render_power = 3;
            color = lib.generators.mkLuaInline "0xee1a1a1a";
          };

          blur = {
            enabled = true;
            size = 3;
            passes = 2;
            vibrancy = 0.1696;
          };
        };

        animations.enabled = true;
        dwindle.preserve_split = true;
        master.new_status = "master";
        scrolling.fullscreen_on_one_column = true;

        misc = {
          force_default_wallpaper = 0;
          disable_hyprland_logo = true;
        };

        input = {
          kb_layout = "us";
          kb_variant = "";
          kb_model = "";
          kb_options = "";
          kb_rules = "";
          follow_mouse = 1;
          sensitivity = 0;
          touchpad.natural_scroll = false;
        };
      };

      curve = [
        {
          _args = [
            "easeOutQuint"
            {
              type = "bezier";
              points = [[0.23 1] [0.32 1]];
            }
          ];
        }
        {
          _args = [
            "easeInOutCubic"
            {
              type = "bezier";
              points = [[0.65 0.05] [0.36 1]];
            }
          ];
        }
        {
          _args = [
            "linear"
            {
              type = "bezier";
              points = [[0 0] [1 1]];
            }
          ];
        }
        {
          _args = [
            "almostLinear"
            {
              type = "bezier";
              points = [[0.5 0.5] [0.75 1]];
            }
          ];
        }
        {
          _args = [
            "quick"
            {
              type = "bezier";
              points = [[0.15 0] [0.1 1]];
            }
          ];
        }
        {
          _args = [
            "easy"
            {
              type = "spring";
              mass = 1;
              stiffness = 238.1191;
              dampening = 24.21279333;
            }
          ];
        }
      ];

      animation = [
        {
          leaf = "global";
          enabled = true;
          speed = 10;
          bezier = "default";
        }
        {
          leaf = "border";
          enabled = true;
          speed = 5.39;
          bezier = "easeOutQuint";
        }
        {
          leaf = "windows";
          enabled = true;
          speed = 4.79;
          spring = "easy";
        }
        {
          leaf = "windowsIn";
          enabled = true;
          speed = 4.1;
          spring = "easy";
          style = "popin 87%";
        }
        {
          leaf = "windowsOut";
          enabled = true;
          speed = 1.49;
          bezier = "linear";
          style = "popin 87%";
        }
        {
          leaf = "fadeIn";
          enabled = true;
          speed = 1.73;
          bezier = "almostLinear";
        }
        {
          leaf = "fadeOut";
          enabled = true;
          speed = 1.46;
          bezier = "almostLinear";
        }
        {
          leaf = "fade";
          enabled = true;
          speed = 3.03;
          bezier = "quick";
        }
        {
          leaf = "layers";
          enabled = true;
          speed = 3.81;
          bezier = "easeOutQuint";
        }
        {
          leaf = "layersIn";
          enabled = true;
          speed = 4;
          bezier = "easeOutQuint";
          style = "fade";
        }
        {
          leaf = "layersOut";
          enabled = true;
          speed = 1.5;
          bezier = "linear";
          style = "fade";
        }
        {
          leaf = "fadeLayersIn";
          enabled = true;
          speed = 1.79;
          bezier = "almostLinear";
        }
        {
          leaf = "fadeLayersOut";
          enabled = true;
          speed = 1.39;
          bezier = "almostLinear";
        }
        {
          leaf = "workspaces";
          enabled = true;
          speed = 1.94;
          bezier = "almostLinear";
          style = "fade";
        }
        {
          leaf = "workspacesIn";
          enabled = true;
          speed = 1.21;
          bezier = "almostLinear";
          style = "fade";
        }
        {
          leaf = "workspacesOut";
          enabled = true;
          speed = 1.94;
          bezier = "almostLinear";
          style = "fade";
        }
        {
          leaf = "zoomFactor";
          enabled = true;
          speed = 7;
          bezier = "quick";
        }
      ];

      gesture = [
        {
          fingers = 3;
          direction = "horizontal";
          action = "workspace";
        }
      ];

      workspace_rule = [
        {
          workspace = "1";
          monitor = host.monitor;
          persistent = true;
          default_name = "web";
        }
        {
          workspace = "2";
          monitor = host.monitor;
          persistent = true;
          default_name = "code";
        }
        {
          workspace = "3";
          monitor = host.monitor;
          persistent = true;
          default_name = "chat";
        }
        {
          workspace = "4";
          monitor = host.monitor;
          persistent = true;
          default_name = "game";
        }
        {
          workspace = "5";
          monitor = host.monitor;
          persistent = true;
          default_name = "design";
        }
      ];

      bind =
        [
          {_args = [(lib.generators.mkLuaInline ''mod .. " + Q"'') (lib.generators.mkLuaInline "hl.dsp.window.close()")];}
          {_args = [(lib.generators.mkLuaInline ''mod .. " + RETURN"'') (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("kitty")'')];}
          {_args = [(lib.generators.mkLuaInline ''mod .. " + B"'') (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("brave-origin")'')];}
          {_args = [(lib.generators.mkLuaInline ''mod .. " + E"'') (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("nautilus --new-window")'')];}
          {_args = [(lib.generators.mkLuaInline ''mod .. " + V"'') (lib.generators.mkLuaInline ''hl.dsp.window.float({ action = "toggle" })'')];}
          {_args = [(lib.generators.mkLuaInline ''mod .. " + P"'') (lib.generators.mkLuaInline "hl.dsp.window.pseudo()")];}
          {_args = [(lib.generators.mkLuaInline ''mod .. " + J"'') (lib.generators.mkLuaInline ''hl.dsp.layout("togglesplit")'')];} # dwindle only

          {_args = [(lib.generators.mkLuaInline ''mod .. " + left"'') (lib.generators.mkLuaInline ''hl.dsp.focus({ direction = "left" })'')];}
          {_args = [(lib.generators.mkLuaInline ''mod .. " + right"'') (lib.generators.mkLuaInline ''hl.dsp.focus({ direction = "right" })'')];}
          {_args = [(lib.generators.mkLuaInline ''mod .. " + up"'') (lib.generators.mkLuaInline ''hl.dsp.focus({ direction = "up" })'')];}
          {_args = [(lib.generators.mkLuaInline ''mod .. " + down"'') (lib.generators.mkLuaInline ''hl.dsp.focus({ direction = "down" })'')];}

          {_args = [(lib.generators.mkLuaInline ''mod .. " + mouse_down"'') (lib.generators.mkLuaInline ''hl.dsp.focus({ workspace = "e+1" })'')];}
          {_args = [(lib.generators.mkLuaInline ''mod .. " + mouse_up"'') (lib.generators.mkLuaInline ''hl.dsp.focus({ workspace = "e-1" })'')];}
          {_args = [(lib.generators.mkLuaInline ''mod .. " + mouse:272"'') (lib.generators.mkLuaInline "hl.dsp.window.drag()") {mouse = true;}];}
          {_args = [(lib.generators.mkLuaInline ''mod .. " + mouse:273"'') (lib.generators.mkLuaInline "hl.dsp.window.resize()") {mouse = true;}];}

          {_args = [(lib.generators.mkLuaInline ''mod .. " + SPACE"'') (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("noctalia msg panel-toggle launcher")'')];}
          {_args = [(lib.generators.mkLuaInline ''mod .. " + S"'') (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("noctalia msg panel-toggle control-center")'')];}
          {_args = [(lib.generators.mkLuaInline ''mod .. " + comma"'') (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("noctalia msg settings-toggle")'')];}
          {_args = ["ALT + Tab" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("noctalia msg window-switcher")'')];}

          {_args = ["XF86AudioRaiseVolume" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("noctalia msg volume-up")'')];}
          {_args = ["XF86AudioLowerVolume" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("noctalia msg volume-down")'')];}
          {_args = ["XF86AudioMute" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("noctalia msg volume-mute")'')];}
          {
            _args = [
              "XF86AudioMicMute"
              (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle")'')
              {
                locked = true;
                repeating = true;
              }
            ];
          }
          {_args = ["XF86MonBrightnessUp" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("noctalia msg brightness-up")'')];}
          {_args = ["XF86MonBrightnessDown" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("noctalia msg brightness-down")'')];}

          {_args = ["XF86AudioNext" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("playerctl next")'') {locked = true;}];}
          {_args = ["XF86AudioPause" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("playerctl play-pause")'') {locked = true;}];}
          {_args = ["XF86AudioPlay" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("playerctl play-pause")'') {locked = true;}];}
          {_args = ["XF86AudioPrev" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("playerctl previous")'') {locked = true;}];}
        ]
        ++ (map
          (i: {
            _args = [
              (lib.generators.mkLuaInline ''mod .. " + ${toString (lib.mod i 10)}"'')
              (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = ${toString i}})")
            ];
          })
          (lib.range 1 10))
        ++ (map
          (i: {
            _args = [
              (lib.generators.mkLuaInline ''mod .. " + SHIFT + ${toString (lib.mod i 10)}"'')
              (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = ${toString i} })")
            ];
          })
          (lib.range 1 10));

      window_rule = [
        {
          match.class = "dev.noctalia.Noctalia";
          float = true;
          size = "1080 920";
        }
        {
          name = "suppress-maximize-events";
          match.class = ".*";
          suppress_event = "maximize";
        }
        {
          name = "fix-xwayland-drags";
          match = {
            class = "^$";
            title = "^$";
            xwayland = true;
            float = true;
            fullscreen = false;
            pin = false;
          };
          no_focus = true;
        }
        {
          name = "move-hyprland-run";
          match.class = "hyprland-run";
          move = "20 monitor_h-120";
          float = true;
        }
      ];

      layer_rule = [
        {
          name = "noctalia";
          match.namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$";
          no_anim = true;
          ignore_alpha = 0.5;
          blur = true;
          blur_popups = true;
        }
      ];
    };
  };

  services.hyprpolkitagent = {
    enable = true;
  };
}

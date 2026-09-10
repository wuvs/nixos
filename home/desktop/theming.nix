{pkgs, ...}: let
  mkQtctSettings = name: {
    Appearnce = {
      color_scheme_path = "$HOME/.config/${name}/colors/noctalia.conf";
      custom_palette = true;
      icon_theme = "breeze-dark";
      standard_dialogs = "default";
      style = "breeze";
    };

    Interface = {
      activate_item_on_single_click = 1;
      buttonbox_layout = 0;
      cursor_flash_time = 1000;
      dialog_buttons_have_icons = 1;
      double_click_interval = 400;
      keyboard_scheme = 2;
      menus_have_icons = true;
      show_shortcuts_in_context_menus = true;
      toolbutton_style = 4;
      underline_shortcut = 1;
      wheel_scrool_lines = 3;
    };

    Troubleshooting = {
      force_raster_widgets = 1;
    };
  };
in {
  gtk = {
    gtk2 = {
      extraConfig = ''
        gtk-toolbar-style=GTK_TOOLBAR_ICONS
        gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
        gtk-button-images=0
        gtk-menu-images=0
        gtk-enable-event-sounds=1
        gtk-enable-input-feedback-sounds=0
        gtk-xfg-antialias=1
        gtk-xft-hinting=1
        gtk-xft-hintstyle="hintslight"
        gtk-xft-rgba="rgb"
      '';
    };
    gtk3 = {
      colorScheme = "dark";
      extraConfig = {
        gtk-toolbar-style = "GTK_TOOLBAR_ICONS";
        gtk-toolbar-icon-size = "GTK_ICON_SIZE_LARGE_TOOLBAR";
        gtk-button-images = 0;
        gtk-menu-images = 0;
        gtk-enable-event-sounds = 1;
        gtk-enable-input-feedback-sounds = 0;
        gtk-xfg-antialias = 1;
        gtk-xft-hinting = 1;
        gtk-xft-hintstyle = "hintslight";
        gtk-xft-rgba = "rgb";
      };
    };
    gtk4 = {
      colorScheme = "dark";
    };
    theme = {
      name = "Adwaita";
      package = pkgs.gnome-themes-extra;
    };
    font = {
      name = "Fira Sans Semi-Bold";
      size = 11;
    };
    enable = true;

    iconTheme = {
      name = "Kora";
      package = pkgs.kora-icon-theme;
    };

    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };
  };

  qt = {
    enable = true;
    platformTheme = {
      name = "qtct";
    };

    qt5ctSettings = mkQtctSettings "qt5ct";
    qt6ctSettings = mkQtctSettings "qt6ct";
  };

  home.pointerCursor = {
    enable = true;
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 24;
  };
}

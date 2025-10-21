{
  config,
  pkgs,
  lib,
  ...
}:

let
  wallpaper = "${config.home.homeDirectory}/.local/share/wallpapers/deer-landscape-01.jpg";
in
{
  home.packages = with pkgs; [
    hyprcursor
    nordic
    papirus-icon-theme
    bibata-cursors
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      monitor=,preferred,auto,1

      exec-once = hyprpaper &
      exec-once = waybar &
      exec-once = mako &

      bind = SUPER, Return, exec, kitty
      bind = SUPER, Q, killactive,
      bind = SUPER, D, exec, wofi --show drun
      bind = SUPER, C, exec, hyprctl reload
      bind = SUPER SHIFT, Q, exit,

      general {
        gaps_in = 8
        gaps_out = 15
        border_size = 2
        col.active_border = rgb(f5bde6)
        col.inactive_border = rgb(666666)
      }

      decoration {
        rounding = 14
        blur = yes
        blur_size = 10
        blur_passes = 3
        blur_new_optimizations = true
        drop_shadow = yes
        shadow_ignore_window = true
        shadow_range = 20
        shadow_render_power = 3
        col.shadow = rgba(0, 0, 0, 0.25)
      }

      animations {
        enabled = yes
        bezier = easeOut, 0.25, 1, 0.5, 1
        animation = windows, 1, 4, easeOut
        animation = border, 1, 6, easeOut
        animation = fade, 1, 3, easeOut
      }

      input {
        kb_layout = us
        follow_mouse = 1
        sensitivity = 0
      }

      misc {
        vfr = true
        disable_hyprland_logo = true
      }
    '';
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ wallpaper ];
      wallpaper = [ ",${wallpaper}" ];
    };
  };

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 36;
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [
          "pulseaudio"
          "battery"
          "tray"
        ];

        clock = {
          format = "  %a %d %b  %H:%M";
        };
        pulseaudio = {
          format = " {volume}%";
        };
        battery = {
          format = "{capacity}%";
        };
      };
    };

    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font", sans-serif;
        font-size: 13px;
        color: #ffffff;
      }
      window#waybar {
        background-color: rgba(255, 255, 255, 0.15);
        border-radius: 18px;
        border: 1px solid rgba(255, 255, 255, 0.25);
        backdrop-filter: blur(20px);
        padding: 6px 12px;
        margin: 8px 10px;
      }
      #clock, #battery, #pulseaudio, #tray {
        padding: 0 10px;
      }
    '';
  };

  programs.wofi = {
    enable = true;
    settings = {
      prompt = "";
      allow_images = false;
      hide_scroll = true;
      location = "center";
      width = 600;
      lines = 8;
    };
    style = ''
      window {
        background-color: rgba(255, 255, 255, 0.15);
        border-radius: 16px;
        border: 1px solid rgba(255, 255, 255, 0.25);
        backdrop-filter: blur(25px);
        padding: 10px;
      }
      entry {
        color: #ffffff;
        font-family: "JetBrainsMono Nerd Font";
        font-size: 13px;
        border: none;
        background: transparent;
      }
      #input {
        padding: 8px;
        border-radius: 10px;
        background-color: rgba(255, 255, 255, 0.1);
        margin-bottom: 6px;
      }
    '';
  };

  services.mako = {
    enable = true;
    settings = {
      default-timeout = 3000;
      border-size = 2;
      border-radius = 8;
      border-color = "#88C0D0";
      text-color = "#ECEFF4";
      background-color = "#2E3440";
      font = "JetBrainsMono Nerd Font 11";
    };
    # font = "JetBrainsMono Nerd Font 11";
    # backgroundColor = "#202020";
    # textColor = "#ffffff";
    # borderColor = "#88C0D0";
    # borderSize = 2;
    # borderRadius = 8;
    # defaultTimeout = 5000;
  };

  gtk = {
    enable = true;
    theme = {
      name = "Nordic";
      package = pkgs.nordic;
    };
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };
  };

  home.file = {
    ".local/share/wallpapers".source = "../.local/wallpapers";
  };
}

{...}: {
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "noctalia";
      theme_background = true;
      truecolor = true;
      force_tty = false;
      presets = "cpu:1:default,proc:0:default cpu:0:default,mem:0:default,net:0:default cpu:0:block,net:0:tty";
      vim_keys = false;
      rounded_corners = true;
      terminal_sync = true;
      graph_symbol = "braille";
      graph_symbol_cpu = "default";
      graph_symbol_gpu = "default";
      graph_symbol_mem = "default";
      graph_symbol_net = "default";
      graph_symbol_proc = "default";
      shown_boxes = "cpu mem net proc";
      update_ms = 2000;
      proc_sorting = "cpu lazy";
      proc_reversed = false;
      proc_tree = false;
      proc_colors = true;
      proc_gradient = true;
      proc_per_core = false;
      proc_mem_bytes = true;
      proc_cpu_graphs = true;
      proc_info_smaps = false;
      proc_left = false;
      proc_filter_kernel = false;
      proc_aggregate = false;
      keep_dead_proc_usage = false;
      cpu_graph_upper = "Auto";
      cpu_graph_lower = "Auto";
      show_gpu_info = "Auto";
      cpu_invert_lower = true;
      cpu_single_graph = false;
      cpu_bottom = false;
      show_uptime = true;
      show_cpu_watts = true;
      check_temp = true;
      cpu_sensor = "Auto";
      show_coretemp = true;
      cpu_core_map = "";
      temp_scale = "celsius";
      base_10_sizes = false;
      show_cpu_freq = true;
      freq_mode = "first";
      clock_format = "%X";
      background_update = true;
      custom_cpu_name = "";
      disks_filter = "";
      mem_graphs = true;
      mem_below_net = false;
      zfs_arc_cached = true;
      show_swap = true;
      swap_disk = true;
      show_disks = true;
      only_physical = true;
      use_fstab = true;
      zfs_hide_datasets = false;
      disk_free_priv = false;
      show_io_stat = true;
      io_mode = false;
      io_graph_combined = false;
      io_graph_speeds = "";
      net_download = 100;
      net_upload = 100;
      net_auto = true;
      net_sync = true;
      net_iface = "";
      base_10_bitrate = "Auto";
      show_battery = true;
      selected_battery = "Auto";
      show_battery_watts = true;
      log_level = "WARNING";
      save_config_on_exit = true;
      nvml_measure_pcie_speeds = true;
      rsmi_measure_pcie_speeds = true;
      gpu_mirror_graph = true;
      shown_gpus = "nvidia amd intel";
      custom_gpu_name0 = "";
      custom_gpu_name1 = "";
      custom_gpu_name2 = "";
      custom_gpu_name3 = "";
      custom_gpu_name4 = "";
      custom_gpu_name5 = "";
    };
  };

  programs.htop.enable = true;

  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "nixos_small";
        type = "auto";
        width = 12;
        padding = {
          top = 1;
          right = 4;
          left = 3;
        };
      };
      display = {
        separator = " ";
      };
      modules = [
        {
          key = "╭───────────╮";
          type = "custom";
        }
        {
          key = "│ {#34} user    {#keys}│";
          type = "title";
          format = "{user-name}";
        }
        {
          key = "│ {#34}󰇅 hname   {#keys}│";
          type = "title";
          format = "{host-name}";
        }
        {
          condition = {
            "!system" = "macOS";
          };
          type = "disk";
          keyIcon = "";
          key = "│{#34} {icon} os age {#keys} │";
          folders = "/";
          format = "{create-time:10} [{days} days ({years} years)]";
        }
        {
          key = "│ {#34}󰅐 uptime  {#keys}│";
          type = "uptime";
        }
        {
          key = "│ {#34}{icon} distro  {#keys}│";
          type = "os";
        }
        {
          key = "│ {#34} kernel  {#keys}│";
          type = "kernel";
        }
        {
          key = "│ {#34} wm      {#keys}│";
          type = "wm";
        }
        {
          key = "│ {#34}󰇄 desktop {#keys}│";
          type = "de";
        }
        {
          key = "│ {#34} term    {#keys}│";
          type = "terminal";
        }
        {
          key = "│ {#34} shell   {#keys}│";
          type = "shell";
        }
        {
          key = "│ {#34}󰍛 cpu     {#keys}│";
          type = "cpu";
          showPeCoreCount = true;
        }
        {
          key = "│ {#34}󰉉 disk    {#keys}│";
          type = "disk";
          folders = "/";
        }
        {
          key = "│ {#34} memory  {#keys}│";
          type = "memory";
        }
        {
          key = "├───────────┤";
          type = "custom";
        }
        {
          key = "│ {#34} colors  {#keys}│";
          type = "colors";
          symbol = "circle";
        }
        {
          key = "╰───────────╯";
          type = "custom";
        }
      ];
    };
  };
}

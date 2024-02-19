{pkgs, ...}: {
  home.stateVersion = "23.11";


  # Packages Setup
  home.packages = with pkgs; [
    pfetch-rs
    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder

    # networking tools
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing

    # misc
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    # Graphical
    chromium
    adw-gtk3
    teams-for-linux
    gnome.gnome-tweaks
    libreoffice

    # Dev tools
    gcc
    mysql
    mongo
    jdk
    nodejs_18
    python3
    flutter
    neovide
    android-tools
    awscli
    google-cloud-sdk
    dig
    whois
    hadoop
    python311Packages.pymongo


    # IDE(s)
    android-studio
    jetbrains.idea-community
    vscode
    rstudio
    staruml
    ciscoPacketTracer8
    virtualbox
    weka
    wireshark

    # Gnome extensions
    gnomeExtensions.dash-to-dock
    gnomeExtensions.blur-my-shell

    # Gnome theming
    ubuntu_font_family
    yaru-theme
    noto-fonts
    noto-fonts-cjk-sans

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # productivity
    hugo # static site generator
    glow # markdown previewer in terminal


    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
  ];

  programs.git = {
    enable = true;
    userName = "Nithin Krishnaa";
    userEmail = "info@nithinkrishna.in";
  };

}

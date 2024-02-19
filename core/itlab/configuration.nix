{ config, lib, pkgs, ... }:
{
  networking.hostName = "itlab"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # Set Console fonts
  console = {
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-116n.psf.gz"; 
    packages = with pkgs; [ terminus_font ];
    #keyMap = "us";
    #useXkbConfig = true; # use xkb.options in tty.
  };



  # Enable Xorg
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    displayManager.autoLogin.enable = true;
    displayManager.autoLogin.user = "nithin";
    excludePackages = [ pkgs.xterm ];
  #  layout = "us";
  #  xkbVariant = "";
  };

  # Gnome workaround
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # Gnome cleanup
  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour
    gnome-text-editor
    ]) ++ (with pkgs.gnome; [
      gnome-music
      gnome-terminal
      gedit # text editor
      epiphany # web browser
      geary # email reader
      gnome-characters
      gnome-maps
      seahorse
      gnome-logs
      gnome-calculator
      yelp ]
     );

  # Enable CUPS
  services.printing.enable = true;

  # Enable Pipewire
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

 # Set up user(s)
  users.users.itlab= {
    isNormalUser = true;
    description = "Nithin Krishnaa";
    extraGroups = [ "wheel" "networkmanager"]; # Enable ‘sudo’ for the user.
  };

  # Packages
  environment.systemPackages = with pkgs; [ neovim git htop tree home-manager ];
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 22 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  networking.firewall.enable = true;

  # Housekeeping
  nix.gc = {
    automatic = true;
    options = "--delete-older-than 30d";
  };
  nix.optimise.automatic = true;
  system.autoUpgrade = {
    enable = true;
    allowReboot = true;
  };

  # Don't fuck with this
  # system.copySystemConfiguration = true;
  system.stateVersion = "24.05"; 
}

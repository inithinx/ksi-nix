{ config, lib, pkgs, modulesPath, ... }: {

  boot = {
    consoleLogLevel = 3;
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "usb_storage" "sd_mod" ];
      kernelModules = [ ];
      systemd.enable = true;
      verbose = false;
    };
    loader = {
      timeout = 0;
      systemd-boot.enable = true;
      systemd-boot.consoleMode = "max";
      efi.canTouchEfiVariables = true;
    };
    kernelParams = [ "quiet" "splash" "loglevel=0" "fsck.mode=skip" "rd.systemd.show_status=false" "rd.udev.log_level=0" "udev.log_priority=0" "boot.shell_on_fail" ];
    plymouth = {
      enable = true;
      theme = "bgrt";
    };
  };

  services.fstrim.enable = true;

  # (the default) this is the recommended approach. When using systemd-networkd it's
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp4s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp3s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}

# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let fs = disk: { device = disk; options = [ "nosuid" "nodev" "nofail" "x-gvfs-show" ]; };

in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # The URI of the NixOS channel to use for automatic upgrades
  system.autoUpgrade.channel = "https://nixos.org/channels/nixos-unstable";

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "17.03";

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.default = 5;
  boot.loader.grub.useOSProber = true; # To Properly Load Other Os's
  boot.loader.grub.splashImage = "/home/saeed/.config/grub/morpheous.png"; # must be equivalent to your screen resolution.(example: 1920*1080)

  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only
 
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.saeed = {
    isNormalUser = true;
    home = "/home/saeed";
    extraGroups = [ "wheel" "networkmanager" ];
    uid = 1000;
  };

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone. example: Pacific/Honolulu
  time.timeZone = "Asia/Tehran";

  # Network Configurations
  networking.hostName = ""; # Define your hostname.
  networking.networkmanager.enable = true;

  # override "unfree license (‘unfree’), refusing to evaluate!"
  nixpkgs.config.allowUnfree = true;

  # Auto Mount Partitions  
  fileSystems."/run/media/saeed/C/" = fs "/dev/disk/by-label/C";
  fileSystems."/run/media/saeed/D/" = fs "/dev/disk/by-label/D";
  fileSystems."/run/media/saeed/9a7479bc-5664-48a2-8b2f-11db5a75a69e/" = fs "/dev/disk/by-uuid/9a7479bc-5664-48a2-8b2f-11db5a75a69e"; # Arch's Home
  fileSystems."/run/media/saeed/b5f5f7f2-22d2-4aff-b320-ccd95b493314/" = fs "/dev/disk/by-uuid/b5f5f7f2-22d2-4aff-b320-ccd95b493314"; # Arch's Root

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "eurosign:e";

  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.displayManager.sddm.autoNumlock = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Enable Nvidia & Intel graphic drivers
  services.xserver.videoDrivers = [ "intel" ];
  hardware.opengl.driSupport32Bit = true;
 
  # TouchPad
  services.xserver.synaptics.enable = true;
  services.xserver.synaptics.twoFingerScroll = true;

  # Sound
  # PulseAudio
  hardware.pulseaudio.enable = true;

  # Alsa
  sound.enable = true;

  # BlueTooth
  # hardware.bluetooth.enable = true;

  # Tor
  services.tor.enable = true;
  services.tor.extraConfig = builtins.readFile "/home/saeed/.config/tor/torrc";

  # Polipo
  services.polipo.enable = true;
  services.polipo.proxyAddress = "127.0.0.1";
  services.polipo.proxyPort = 8123;

  # ZSH
  programs.zsh.enable = true;
  users.users.saeed.shell = pkgs.zsh;
  # If You Want To Set it For All Users:
  # users.defaultUserShell = pkgs.zsh

  # List packages installed in system profile. To search by name, run: $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    # Essential 
    #tor
    #git
    ntfs3g
    #gparted
    #unetbootin
    #speedcrunch
    #zsh
    #zsh-prezto
    #ark
    #unzip
  
    # Editors
    #vim
    #vscode

    # IDE's
    #qtcreator
    #clementine

    # Libraries & Frameworks
    #openjdk

    # Drivers & Kernel Modules
    #xf86_video_nouveau
    #glxinfo

    # Download Managers
    #aria2
    #deluge
    #youtube-dl

    # BlueTooth
    #bluez
    #blueman

    # Communication
    #tdesktop 
    #hexchat

    # Office
    #okular

    # Utility
    #goldendict
    #spectacle # Screen Capture

    # Graphic Design
    #gimp
    #shotwell
    #inkscape
  ];

  

  # services.xserver.displayManager.sddm.extraConfig = pkgs.lib.mkForce
  #    (''
  #      [Theme]
  #      Current=abstractdark
  #      ThemeDir=/home/saeed/.config/sddm/themes
  #    '');
  # services.xserver.displayManager.sddm.theme = pkgs.lib.mkForce (builtins.readFile "/home/saeed/.config/sddm/breeze-slider/Main.qml");
  # services.xserver.displayManager.sddm.theme = builtins.readFile "/home/saeed/.config/sddm/breeze-slider/Main.qml";

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;
  
  # Garbage!!!
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

}

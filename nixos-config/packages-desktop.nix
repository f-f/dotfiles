# Packages list - desktop
## Note: does not contain configuration for software that is
## already covered by other NixOS options (e.g. emacs)

{ config, pkgs, ... }:

let unstable = import <nixos-unstable> { config.allowUnfree = true; };
in {
  # Nix meta-config
  nixpkgs.config = {
    allowUnfree = true;

    firefox = {
      enableGoogleTalkPlugin = true;
      enableGnomeExtensions = true;
    };

    chromium = {
      enablePepperFlash = true;
    };
  };

  # Finally, packages
  environment.systemPackages = with pkgs; [

    # Gnome
    chrome-gnome-shell
    gnome3.dconf
    gnome3.glib_networking
    gnome3.gnome-shell-extensions
    lxappearance-gtk3
    numix-gtk-theme
    numix-icon-theme
    numix-cursor-theme
    gnomeExtensions.caffeine
    gnomeExtensions.dash-to-dock
    gnomeExtensions.dash-to-panel
    gnomeExtensions.nohotcorner
    unstable.gnomeExtensions.timepp

    # Desktop apps
    alacritty
    steam
    keepassx-community
    calibre
    gparted
    synergy
    emacs

    # Audio
    pavucontrol
    qjackctl
    vlc
    spotify
    ardour

    # Internet
    firefox
    google-chrome

    # Messaging
    tdesktop
    slack

    # Devops
    kubernetes
    terraform
    unstable.google-cloud-sdk

    # Haskell packages
    haskellPackages.stylish-haskell

    # Dev pkgs
    mypy
    ncurses

    # Unstable packages:
    unstable.stack
    unstable.tigervnc
    unstable.anki
    unstable.dropbox
    unstable.postgresql96
    unstable.jetbrains.pycharm-community
    unstable.teamviewer
    unstable.yarn
    unstable.jetbrains.phpstorm
  ];
}


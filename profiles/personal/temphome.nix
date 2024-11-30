{ config, pkgs, userSettings, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = userSettings.username;
  home.homeDirectory = "/home/"+userSettings.username;

  programs.home-manager.enable = true;

  imports = [ ../work/home.nix # Personal is essentially work system + games


            ];

  home.stateVersion = "22.11"; # Please read the comment before changing.

  home.packages = with pkgs; [

    # Core
    zsh
    alacritty
    brave
    git
    syncthing
    zellij
    vscode
tmux
vesktop
btop
zoxide
figlet
spotify
python3
pipenv
    podman
nodejs
    go

 # dev
 podman-desktop
 postman
 insomnia
 grpc
 toxiproxy

    oh-my-zsh
    oh-my-posh
    fzf-zsh
    sway

  ];

  xdg.enable = true;
  xdg.userDirs = {
    extraConfig = {
      XDG_GAME_DIR = "${config.home.homeDirectory}/Media/Games";
      XDG_GAME_SAVE_DIR = "${config.home.homeDirectory}/Media/Game Saves";
    };
  };

}
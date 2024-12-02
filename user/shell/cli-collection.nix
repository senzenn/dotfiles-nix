{ pkgs, ... }:
{
  # Collection of useful CLI apps
  home.packages = with pkgs; [
    # Command Line
    disfetch lolcat cowsay
    
    xclip
    starfetch
    cava
    killall
    libnotify
    timer
    brightnessctl
    gnugrep
    bat eza fd bottom ripgrep
    rsync
    unzip
    w3m
    pandoc
    hwinfo
    pciutils
    lua54Packages.luarocks
    numbat
    lua
    nix
    deno


# rust cli
rustycli
rustywind
rustlings
rustypaste
# Solana Dev
solana-cli

anchor
(pkgs.callPackage ../pkgs/pokemon-colorscripts.nix { })
    (pkgs.writeShellScriptBin "airplane-mode" ''
      #!/bin/sh
      connectivity="$(nmcli n connectivity)"
      if [ "$connectivity" == "full" ]
      then
          nmcli n off
      else
          nmcli n on
      fi
    '')
    vim neovim
  ];
}

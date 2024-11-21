{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
nushell

    kitty
  ];
  programs.kitty.enable = true;
  programs.kitty.settings = {
    background_opacity = lib.mkForce "0.85";
    modify_font = "cell_width 80%";
  };
}

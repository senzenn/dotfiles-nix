{ pkgs, ... }:

{
  home.packages = with pkgs; [
      # Rust setup
      rustup

 solana-cli
 anchor

  ];
}

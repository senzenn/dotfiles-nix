
{ pkgs, ... }:
let

  myAliases = {
    gaa = "git add .";
    gc = "git commit -m";
    gp = "git push";
    ls = "eza --icons -l -T -L=1";
    cat = "bat";
    htop = "btm";
    fd = "fd -Lu";
    w3m = "w3m -no-cookie -v";
    neofetch = "disfetch";
    fetch = "disfetch";
    gitfetch = "onefetch";
    "," = "comma";
    dog =  "phoenix sync user";
  };

in
{

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    shellAliases = myAliases;

    initExtra = ''
      # Zoxide initialization
      eval "$(zoxide init zsh)"
      
      # Starship initialization
      eval "$(starship init zsh)"

      PROMPT=" ◉ %U%F{magenta}%n%f%u@%U%F{blue}%m%f%u:%F{yellow}%~%f
       %F{green}→%f "
      RPROMPT="%F{red}▂%f%F{yellow}▄%f%F{green}▆%f%F{cyan}█%f%F{blue}▆%f%F{magenta}▄%f%F{white}▂%f"
      [ $TERM = "dumb" ] && unsetopt zle && PS1='$ '
      bindkey '^P' history-beginning-search-backward
      bindkey '^N' history-beginning-search-forward
    '';
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = myAliases;

    initExtra = ''
      # Zoxide initialization
      eval "$(zoxide init bash)"

      # Starship initialization
      eval "$(starship init bash)"
    '';
  };

  home.packages = with pkgs; [
    disfetch lolcat cowsay onefetch
    gnugrep gnused
    bat eza bottom fd bc
    direnv nix-direnv
    neofetch zsh-z
    zoxide
    fastfetch
    bun yarn pnpm deno
    oh-my-zsh
    fzf
    zinit
    oh-my-posh
    starship  # Ensure Starship is installed
  ];

  # Create the configuration file for Starship
  # The path is set as `~/.config/starship.toml`
  home.file."${config.home.homeDirectory}/.config/starship.toml" = {
    source = ./starship.toml;  # Source file that contains your Starship config
    createDirs = true;
  };

  programs.direnv.enable = true;
  programs.direnv.enableZshIntegration = true;
  programs.direnv.nix-direnv.enable = true;
}

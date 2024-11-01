{ pkgs, ... }:
let
  aliases = import ./nix-config/aliases.nix;

in
{
  programs.tmux = {
    enable = true;
    # Specify the path to your custom tmux configuration file
    extraConfig = ''
      source-file $HOME/nix-config/tmux.conf
    '';
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    shellAliases = aliases.myAliases;

    initExtra = ''
      # Zoxide initialization
      eval "$(zoxide init zsh)"
      
      # Oh My Posh initialization
      eval "$(oh-my-posh init zsh --config $HOME/.config/poshthemes/mytheme.json)"

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
    shellAliases = aliases.myAliases;

    initExtra = ''
      # Zoxide initialization
      eval "$(zoxide init bash)"
      
      # Oh My Posh initialization
      eval "$(oh-my-posh init bash --config $HOME/.config/poshthemes/mytheme.json)"
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
    oh-my-posh
    fzf
  ];

  programs.direnv.enable = true;
  programs.direnv.enableZshIntegration = true;
  programs.direnv.nix-direnv.enable = true;
}


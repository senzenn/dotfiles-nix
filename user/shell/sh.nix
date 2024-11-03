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
      
      # Oh My Posh initialization
      eval "$(oh-my-posh init zsh  --config $HOME/.config/poshthemes/mytheme.omp.json)"

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


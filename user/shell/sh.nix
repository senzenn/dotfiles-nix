{ pkgs, ... }:
let
  myAliases = {
    gaa = "git add .";
    gcc = "git commit -m";
    gco = "git checkout";
    gp = "git push";
    ls = "eza --icons -l -T -L=1";
    gl = "git pull origin main";
    gcm = "git checkout main";
    gba = "git branch";
    gcp = "git cherry-pick";
    glgg = "git log --graph --max-count=10";
    gm = "git merge";
    gmb = "git merge";
    cat = "bat";
    htop = "btm";
    fd = "fd -Lu";
    w3m = "w3m -no-cookie -v";
    neofetch = "disfetch";
    fetch = "disfetch";
    gitfetch = "onefetch";
    "," = "comma";
    dog = "phoenix sync user";
    nn = "neovide .";
    ggpull = "git pull origin $(current_branch)";
    ggpush = "git push origin $(current_branch)";
    gcb = "git checkout -b";
    gpc = "grep -r";
    gpr = "sudo grep -r /";
  };

in
{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    shellAliases = myAliases;

    plugins = [
      "git"
      "zsh-autosuggestions"
      "zsh-syntax-highlighting"
      "zsh-completions"
      "zsh-history-substring-search"
      "zsh-nvm"
      "zsh-z"
      "zoxide"
      "starship"
      "ohmyzsh"
    ];

    # Key bindings for accepting autosuggestions
    bindkey '^I' autosuggest-accept

    # Set the theme to agnoster for a retro look
    promptInit = ''
      autoload -U promptinit; promptinit
      prompt agnoster
    '';

    # Oh My Zsh configuration
    initExtra = ''
      # Load Oh My Zsh
      export ZSH="$HOME/.oh-my-zsh"
      ZSH_THEME="agnoster"
      plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-completions zsh-history-substring-search zsh-nvm zsh-z zoxide starship)
      source $ZSH/oh-my-zsh.sh
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
    disfetch
    gdu
    lolcat
    cowsay
    onefetch
    gnugrep
    gnused
    bat
    eza
    bottom
    fd
    bc
    direnv
    nix-direnv
    neofetch
    zsh-z
    zoxide
    fastfetch
    bun
    yarn
    pnpm
    deno
    oh-my-zsh
    fzf
    zinit
    oh-my-posh
    starship
    rustup  # For Solana development (Rust)
    mongodb-compass
    telegram-desktop
    obsidian
    nodejs  # Node.js for backend development
    python3  # Python for backend development
    jq  # JSON processing tool (common in backend)
    notion-app-enhanced # Notion app 
    ansible
    slack 
    tree
    telegram-bot-api 
    gparted
    lazygit
    jetbrains.webstorm
    jetbrains.rust-rover
    jetbrains.goland
    neovide
    crypto-tracker
    crypto-org-wallet
    botan3 # crypto library
    erlang # realtime 
    erlang-ls
    firefox 
    elixir
  ];

  programs.direnv.enable = true;
  programs.direnv.enableZshIntegration = true;
  programs.direnv.nix-direnv.enable = true;
}

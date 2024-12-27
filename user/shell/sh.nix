

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

  # Custom starship config for full-stack dev + Solana dev
  starshipConfig = ''
    # Git Status Module
    [git_status]
    format = "([[$all_status]] )"

    # Node.js Version
    [nodejs]
    format = "[$version]($style)"
    style = "cyan"

    # Docker Module (if you're using Docker)
    [docker]
    symbol = "🐳 "
    format = "[$symbol$container_name]($style) "
    style = "yellow"

    # Rust for Solana (check if you're using rust toolchain)
    [rust]
    format = "[$version]($style)"
    style = "red"

    # Python (in case your backend uses Python/Django/Flask)
    [python]
    format = "[$version]($style)"
    style = "green"

    # JavaScript (for Node.js-based services)
    [javascript]
    format = "[$version]($style)"
    style = "purple"

    # Virtualenv (for Python environments)
    [python.virtualenv]
    format = "[$virtualenv]($style)"
    style = "yellow"

    # FZF (fuzzy search)
    [fzf]
    style = "blue"

    # NPM (for Node.js projects)
    [npm]
    format = "[$symbol$version]($style)"
    style = "yellow"

    # Solana (CLI tools)
    [solana]
    symbol = "🚀"
    format = "[$symbol$cluster]($style)"
    style = "magenta"

    # Custom directory for Solana dev
    [directory]
    style = "bold green"

    # Add custom prompt symbol
    [character]
    success_symbol = "[➜]($style)"
    error_symbol = "[✗]($style)"
  '';

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

      # Optional: Uncomment this if using oh-my-zsh
      # eval "$(oh-my-zsh init -)"

      # Key bindings
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

    typescript 
firefox
    pnpm
    deno
    oh-my-zsh
    fzf
    zinit
    oh-my-posh
    starship
bottom    
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

#  do not expose yourself 

 jetbrains.webstorm
 jetbrains.rust-rover
jetbrains.goland




neovide
#crypto 
crypto-tracker
crypto-org-wallet
crypto-tracker
botan3 # crypto library
erlang # realtime 
erlang-ls

elixir
  ];

  programs.direnv.enable = true;
  programs.direnv.enableZshIntegration = true;
  programs.direnv.nix-direnv.enable = true;
}

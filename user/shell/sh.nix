
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
    dog = "phoenix sync user";
    nn = "neovide .";
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


#  do not expose yourself 
 webstorm
 rust-rover
 goland
  ];

  programs.direnv.enable = true;
  programs.direnv.enableZshIntegration = true;
  programs.direnv.nix-direnv.enable = true;
}

{ pkgs, ... }:
let

  myAliases = {
    ls = "eza --icons -l -T -L=1";
    cat = "bat";
    htop = "btm";
    fd = "fd -Lu";
    w3m = "w3m -no-cookie -v";
    neofetch = "disfetch";
    fetch = "disfetch";
    gitfetch = "onefetch";
    "," = "comma";
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
      export POSH_THEMES_PATH="$HOME/dotfiles/poshthemes"
      mkdir -p "$POSH_THEMES_PATH"
      oh-my-posh get theme mytheme.omp.json -d "$POSH_THEMES_PATH"
      eval "$(oh-my-posh init zsh --config "$POSH_THEMES_PATH/mytheme.omp.json")"

      PROMPT=" ◉ %U%F{magenta}%n%f%u@%U%F{blue}%m%f%u:%F{yellow}%~%f
    '';
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = myAliases;

    initExtra = ''
      # Zoxide initialization
      eval "$(zoxide init bash)"
      
      # Oh My Posh initialization
      eval "$(oh-my-posh init bash --config $HOME/.config/poshthemes/mytheme.omp.json)"
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
  # Create the directory for the Oh My Posh theme if it doesn't exist
  home.file."config/poshthemes".source = pkgs.runCommand "create-poshthemes-dir" { } ''
    mkdir -p $out/config/poshthemes
  '';

  home.file."config/poshthemes/mytheme.omp.json".text = ''
    {
      "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
      "blocks": [
        {
          "alignment": "left",
          "newline": true,
          "segments": [
            {
              "foreground": "#ffbebc",
              "leading_diamond": "<#ff70a6> \ue200 </>",
              "properties": {
                "display_host": true
              },
              "style": "diamond",
              "template": "{{ .UserName }} <#ffffff>on</>",
              "type": "session"
            },
            {
              "foreground": "#bc93ff",
              "properties": {
                "time_format": "Monday <#ffffff>at</> 3:04 PM"
              },
              "style": "diamond",
              "template": " {{ .CurrentDate | date .Format }} ",
              "type": "time"
            },
            {
              "foreground": "#ee79d1",
              "properties": {
                "branch_icon": "\ue725 ",
                "fetch_stash_count": true,
                "fetch_status": true,
                "fetch_upstream_icon": true,
                "fetch_worktree_count": true
              },
              "style": "diamond",
              "template": " {{ .UpstreamIcon }}{{ .HEAD }}{{if .BranchStatus }} {{ .BranchStatus }}{{ end }}{{ if .Working.Changed }} \uf044 {{ .Working.String }}{{ end }}{{ if and (.Working.Changed) (.Staging.Changed) }} |{{ end }}{{ if .Staging.Changed }} \uf046 {{ .Staging.String }}{{ end }}{{ if gt .StashCount 0 }} \ueb4b {{ .StashCount }}{{ end }} ",
              "type": "git"
            }
          ],
          "type": "prompt"
        },
        {
          "alignment": "right",
          "segments": [
            {
              "foreground": "#a9ffb4",
              "style": "plain",
              "type": "text"
            },
            {
              "foreground": "#a9ffb4",
              "properties": {
                "style": "dallas",
                "threshold": 0
              },
              "style": "diamond",
              "template": " {{ .FormattedMs }}s <#ffffff>\ue601</>",
              "type": "executiontime"
            },
            {
              "properties": {
                "root_icon": "\uf292 "
              },
              "style": "diamond",
              "template": " \uf0e7 ",
              "type": "root"
            },
            {
              "foreground": "#94ffa2",
              "style": "diamond",
              "template": " <#ffffff>MEM:</> {{ round .PhysicalPercentUsed .Precision }}% ({{ (div ((sub .PhysicalTotalMemory .PhysicalFreeMemory)|float64) 1073741824.0) }}/{{ (div .PhysicalTotalMemory 1073741824.0) }}GB)",
              "type": "sysinfo"
            }
          ],
          "type": "prompt"
        },
        {
          "alignment": "left",
          "newline": true,
          "segments": [
            {
              "foreground": "#ffafd2",
              "leading_diamond": "<#00c7fc> \ue285 </><#ffafd2>{</>",
              "properties": {
                "folder_icon": "\uf07b",
                "folder_separator_icon": " \uebcb ",
                "home_icon": "home",
                "style": "agnoster_full"
              },
              "style": "diamond",
              "template": " \ue5ff {{ .Path }} ",
              "trailing_diamond": "<#ffafd2>}</>",
              "type": "path"
            },
            {
              "foreground": "#A9FFB4",
              "foreground_templates": ["{{ if gt .Code 0 }}#ef5350{{ end }}"],
              "properties": {
                "always_enabled": true
              },
              "style": "plain",
              "template": " \ue286 ",
              "type": "status"
            }
          ],
          "type": "prompt"
        }
      ],
      "console_title_template": "{{ .Folder }}",
      "transient_prompt": {
        "background": "transparent",
        "foreground": "#FEF5ED",
        "template": "\ue285 "
      },
      "version": 2
    }
  '';


  programs.direnv.enable = true;
  programs.direnv.enableZshIntegration = true;
  programs.direnv.nix-direnv.enable = true;
}


{ ... }:
{
  programs.bash = {
    enable = true;
    # Aliases go here, e.g.  ll = "ls -alF";
    initExtra = ''
      # LM Studio CLI
      export PATH="$PATH:$HOME/.lmstudio/bin"

      # opencode
      export PATH="$HOME/.opencode/bin:$PATH"

      # zoxide: smarter cd, use `z <part-of-path>` (and `zi` interactively)
      eval "$(zoxide init bash)"
    '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}

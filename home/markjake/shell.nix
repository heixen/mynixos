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
    '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}

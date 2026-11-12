{ ... }:
{
  programs.bash = {
    enable = true;
    # Aliases go here, e.g.  ll = "ls -alF";
    shellAliases = {
      ll = "ls -alF";
      rebuild = "sudo nixos-rebuild switch --flake ~/mynixos#nixos";
      dry-build = "sudo nixos-rebuild dry-build --flake ~/mynixos#nixos";
      update = "nix flake update --flake ~/mynixos";
      rollback = "sudo nixos-rebuild switch --rollback --flake ~/mynixos#nixos";
      boot-old = "sudo nixos-rebuild boot --rollback --flake ~/mynixos#nixos";
      list-gen = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
    };

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

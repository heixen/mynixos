# mynixos

Flake-based NixOS + Home Manager configuration.

## Layout

```
.
├── flake.nix                     # inputs (nixpkgs, home-manager) + nixosConfigurations
├── hosts/
│   └── nixos/                    # one directory per machine
│       ├── default.nix           # host composition root
│       └── hardware-configuration.nix
├── modules/
│   ├── nixos/                    # shared NixOS modules
│   │   ├── default.nix           # imports every module below
│   │   ├── core.nix              # nix settings, gc, locale, timezone
│   │   ├── boot.nix
│   │   ├── networking.nix
│   │   ├── audio.nix
│   │   ├── graphics.nix
│   │   ├── desktop.nix           # Hyprland, ly, portals, fonts
│   │   ├── services.nix          # bluetooth, printing, mysql, udisks
│   │   ├── users.nix
│   │   └── packages.nix          # system-wide packages
│   └── home/                     # reusable Home Manager modules (add as needed)
└── home/
    └── markjake/                 # per-user Home Manager config
        ├── default.nix
        ├── packages.nix
        ├── shell.nix
        └── dotfiles/             # symlinked/declarative dotfiles
```

## Usage

Build (does not activate):

```sh
sudo nixos-rebuild build --flake .#nixos
```

Switch to the new generation:

```sh
sudo nixos-rebuild switch --flake .#nixos
```

Update all flake inputs:

```sh
nix flake update
```

Update one input:

```sh
nix flake update nixpkgs
```

Show what the flake exposes:

```sh
nix flake show
```

## Disk space

Automatic GC runs weekly and keeps 14 days of generations. To prune manually
while keeping the two newest generation for rollback:

```sh
sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations +2
sudo nix-collect-garbage
```

`nix store gc` alone removes unreachable store paths but keeps every generation.

## Notes

- `system.stateVersion` and `home.stateVersion` are intentionally kept at `26.05`.
- Home Manager runs as a NixOS module, so there is **one** command:
  `sudo nixos-rebuild switch --flake .#nixos`. Do not run `home-manager switch`
  (there is no separate Home Manager profile/generation).
- The flake repo is the source of truth. `/etc/nixos` is the old channel-based
  configuration and is no longer used.
- Existing dotfiles are backed up with the `.hm-backup` suffix the first time
  Home Manager replaces them.
- Automatic GC keeps 14 days of generations; `nix.settings.auto-optimise-store`
  hardlinks duplicate store files to save space.

# Add Nix profile binaries
fish_add_path $HOME/.nix-profile/bin
fish_add_path /nix/var/nix/profiles/default/bin

# Add fallback system paths (for safety)
fish_add_path /usr/local/bin
fish_add_path /usr/bin
fish_add_path /bin
fish_add_path /usr/sbin
fish_add_path /sbin

# Add Homebrew paths (if you use Homebrew too)
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin

# Starship prompt
starship init fish | source

zoxide init fish | source

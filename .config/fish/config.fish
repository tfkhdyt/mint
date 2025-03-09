if status is-interactive
    alias ls="eza --icons --group-directories-first"
    alias ll="eza -lbh --icons --group-directories-first"

    abbr -a bat batcat
    abbr -a v nvim
    abbr -a xclip xclip -sel clip
    abbr -a lg lazygit
    abbr -a p pnpm
    abbr -a g git

    set -U fish_greeting ""
    set -gx GOPATH "$HOME/go"
    set -gx EDITOR nvim
    set -gx PNPM_HOME "$HOME/.local/share/pnpm"
    set -gx BUN_INSTALL "$HOME/.bun"
    set -gx ANDROID_HOME "$HOME/Android"
    set -gx JAVA_HOME "$(dirname $(dirname $(readlink -f $(which java))))"

    fish_add_path -a "$GOPATH/bin" "$HOME/.cargo/bin" "$BUN_INSTALL/bin" "$PNPM_HOME" \
        "$JAVA_HOME/bin" "$ANDROID_HOME/cmdline-tools/latest/bin" "$ANDROID_HOME/platform-tools" \
        "$ANDROID_HOME/emulator"

    starship init fish | source
    enable_transience

    zoxide init fish | source
end

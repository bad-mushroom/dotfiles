#!/usr/bin/env bash
set -e

DOTFILES="$HOME/.dotfiles"
BACKUP="$HOME/.dotfiles_backup"

mkdir -p "$BACKUP"

link() {
  local src="$1"
  local dest="$2"

  if [[ -L "$dest" ]]; then
    echo "✔ $dest already linked"
    return
  fi

  if [[ -e "$dest" ]]; then
    echo "📦 Backing up $dest → $BACKUP/"
    mv "$dest" "$BACKUP/"
  fi

  echo "🔗 Linking $dest → $src"
  ln -s "$src" "$dest"
}

# --- SYMLINK DOTFILES --- #

echo
echo "🔧 Setting up dotfile symlinks…"

link "$DOTFILES/bashrc"          "$HOME/.bashrc"
link "$DOTFILES/gitconfig"       "$HOME/.gitconfig"
link "$DOTFILES/gitignore_global" "$HOME/.gitignore_global"
link "$DOTFILES/vimrc"           "$HOME/.vimrc"
link "$DOTFILES/profile"         "$HOME/.profile"

# --- VIM PLUG INSTALLATION --- #

echo
echo "📦 Installing vim-plug (if missing)…"

VIM_PLUG="$HOME/.vim/autoload/plug.vim"

if [[ ! -f "$VIM_PLUG" ]]; then
  curl -fLo "$VIM_PLUG" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  echo "✔ vim-plug installed"
else
  echo "✔ vim-plug already installed"
fi

# --- FASTFETCH INSTALLATION --- #

echo
echo "📦 Installing fastfetch (if missing)…"

if ! command -v fastfetch >/dev/null 2>&1; then
  brew install fastfetch
  echo "✔ fastfetch installed"
else
  echo "✔ fastfetch already installed"
fi

# --- STREAM DECK CONFIGURATION --- #

echo
echo "🎛 Setting up Stream Deck configuration..."

STREAMDECK_BASE="$HOME/Library/Application Support/com.elgato.StreamDeck"
STREAMDECK_PROFILES="$STREAMDECK_BASE/ProfilesV3"

# Detect Stream Deck app
if [[ ! -d "/Applications/Elgato Stream Deck.app" ]]; then
  echo "⚠️ Stream Deck app not found."
  echo "   Install it from: https://www.elgato.com/en/stream-deck"
else
  echo "✔ Stream Deck app detected."
fi

# Restore profiles
if [[ -d "$DOTFILES/streamdeck/profiles" ]]; then
  mkdir -p "$STREAMDECK_PROFILES"
  cp -R "$DOTFILES/streamdeck/profiles/"* "$STREAMDECK_PROFILES/"
  echo "✔ Stream Deck profiles restored to ProfilesV3"
else
  echo "ℹ️ No Stream Deck profiles found in dotfiles"
fi

# --- DONE --- #

echo
echo "📁 Current symlinks:"
ls -al "$HOME" | grep "\->" || true

echo
echo "🎉 Setup complete!"
echo "👉 Open vim and run :PlugInstall"

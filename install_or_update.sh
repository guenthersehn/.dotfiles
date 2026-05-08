#!/bin/zsh

# 1. SETUP ENVIRONMENT
DOTFILES_DIR="${0:a:h}"
CONFIG_DIR="$DOTFILES_DIR/config"
VUNDLE_DIR="$HOME/.vim/bundle/Vundle.vim"

mkdir -p "$CONFIG_DIR"

# Load URLs from local files
BREW_INSTALL_URL=$(cat "$DOTFILES_DIR/brew.url")
VUNDLE_REPO_URL=$(cat "$DOTFILES_DIR/vundle.url")

SILENCE="/dev/null"
[[ "$1" == "-v" ]] && SILENCE="/dev/stdout"

# 2. HOMEBREW & PACKAGES
echo "--- 🍺 Running Homebrew Maintenance ---"
if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL $BREW_INSTALL_URL)"
    eval "$(/opt/homebrew/bin/brew shellenv)" 2>/dev/null || eval "$(/usr/local/bin/brew shellenv)"
fi
brew update > $SILENCE 2>&1
grep -v '^#' "$DOTFILES_DIR/brew_packages.txt" | while read pkg; do
    brew list "$pkg" &>/dev/null || brew install "$pkg" > $SILENCE 2>&1
done
brew list --cask font-fira-code-nerd-font &>/dev/null || brew install --cask font-fira-code-nerd-font > $SILENCE 2>&1

# 3. SYMLINKING
echo "--- 🔗 Linking Configuration Files ---"
ln -sf "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/vimrc" "$HOME/.vimrc"
mkdir -p "$HOME/.config/archey4" "$HOME/.config"
ln -sf "$CONFIG_DIR/archey_config.json" "$HOME/.config/archey4/config.json"
ln -sf "$CONFIG_DIR/starship.toml" "$HOME/.config/starship.toml"

# 4. SHELL TOOLS
echo "--- 🐚 Shell Tools ---"
[ -d "$HOME/.oh-my-zsh" ] && git -C "$HOME/.oh-my-zsh" pull --quiet > $SILENCE 2>&1
if [ -d "$(brew --prefix)/opt/fzf" ]; then
    $(brew --prefix)/opt/fzf/install --no-update-rc --no-bash --key-bindings --completion --all > $SILENCE 2>&1
fi

# 5. VIM & VUNDLE
echo "--- 📝 Syncing Vim Plugins ---"
[[ ! -d "$VUNDLE_DIR" ]] && git clone --quiet "$VUNDLE_REPO_URL" "$VUNDLE_DIR" > $SILENCE 2>&1
git -C "$VUNDLE_DIR" pull --quiet > $SILENCE 2>&1
vim -es -u "$HOME/.vimrc" -i NONE +PluginUpdate +PluginInstall +qall > $SILENCE 2>&1

# 6. iTERM2 SETTINGS
echo "--- ⚙️ Applying iTerm2 Font Settings ---"
# Clean up previous attempts
rm -rf "$HOME/Library/Application Support/iTerm2/DynamicProfiles" && mkdir -p "$HOME/Library/Application Support/iTerm2/DynamicProfiles"
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool false

# The exact string your manual fix generated
FONT_NAME="FiraCodeNFM-Med 13"
PLIST="$HOME/Library/Preferences/com.googlecode.iterm2.plist"

# Update EVERY profile found in the bookmarks to use the verified font
COUNT=$(/usr/libexec/PlistBuddy -c "Print :'New Bookmarks':" "$PLIST" 2>/dev/null | grep -c "Guid" || echo 0)
for (( i=0; i<$COUNT; i++ )); do
    /usr/libexec/PlistBuddy -c "Set :'New Bookmarks':$i:'Normal Font' '$FONT_NAME'" "$PLIST" 2>/dev/null
    /usr/libexec/PlistBuddy -c "Set :'New Bookmarks':$i:'Non Ascii Font' '$FONT_NAME'" "$PLIST" 2>/dev/null
done

# Force macOS to reload the settings cache
killall cfprefsd 2>/dev/null

echo "--- ✅ Setup Complete! ---"
source "$HOME/.zshrc"


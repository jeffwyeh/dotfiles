tap "homebrew/bundle"
tap "homebrew/cask"
tap "homebrew/core"
tap "homebrew/services"
tap "homebrew/cask-fonts"
tap "koekeishiya/formulae"
tap "FelixKratz/formulae"
tap "amazon/amazon"

###############
## Utilities ##
###############
brew "coreutils" # GNU core utilities
brew "git"       # git - more up to date
brew "jq"        # JSON command line parser
brew "tree"      # Utility to display file structure in the command line 
brew "pygments"  # Colorize output (used for cless and ccat aliases) 
brew "ifstat"    # Network statistics (used for sketchybar) 
brew "grep"      # Better grep 
brew "mdcat"     # Markdown renderer for command line
brew "vim"       # vim - more up to date (required for YouCompleteMe)
brew "go"        # Required for YouCompleteMe
brew "starship"  # Custom prompt

#######################
## Mac customization ##
#######################
brew "koekeishiya/formulae/yabai"     # Window tiler
brew "koekeishiya/formulae/skhd"      # Keyboard shortcuts
brew "FelixKratz/formulae/sketchybar" # macOS toolbar replacement
brew "neovim"                         # ???

############
## Amazon ##
############
brew "ninja-dev-sync" # Sync to dev desktop

###########
## Casks ##
###########
cask "visual-studio-code"        # VS Code
cask "font-fira-code"            # Coding font
cask "font-fira-code-nerd-font"  # Coding font with additional glyphs
cask "font-fontawesome"          # Glyph font
cask "dcv-viewer"                # Dev desktop remote viewer
cask "balance-lock"              # Lock left-right audio balance (since macOS is dumb)
cask "boop"                      # Program to quickly format text blocks (useful for JSON)
cask "bluesnooze"                # Turn off bluetooth when macOS sleeps (since macOS is dumb, again)
cask "warp"                      # Warp "AI" terminal
cask "unison"                    # Unison file synchronization
cask "hyperkey"                  # Convert caps lock into hyper key

############
## Unused ##
############
#tap "cmacrae/formulae"
#brew "cmacrae/formulae/spacebar" # Replaced by sketchybar
#cask "mac-mouse-fix"             # Additional mouse functionality
#cask "background-music"          # Individual app sound control
#cask "wezterm"                   # Another terminal
#cask "kitty"                     # Another terminal
#cask "alacritty"                 # Another terminal
#cask "iterm2"                    # Terminal
#cask "scroll-reverser"           # Fix scrolling direction for external mice

###########################
## Service auto restarts ##
###########################
brew 'yabai', restart_service: :changed
brew 'skhd', restart_service: :changed
#brew 'spacebar', restart_service: :changed

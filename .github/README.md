# YADM Managed Dotfile Repository

This is a repository for managing all dotfiles for my personal configuration.
Below is a list of what this repository will set up:
* Zsh
    * Commonly used aliases (located at $HOME/.config/zsh/custom/)
    * [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)
    * [Powerlevel10k](https://github.com/romkatv/powerlevel10k) (Zsh theme)
* vim
    * Includes installation of vimplug and plugins

## Mac-specific

* [yabai](https://github.com/koekeishiya/yabai) - a tiling window manager
* [skhd](https://github.com/koekeishiya/skhd) - keyboard shortcuts for yabai
* [sketchybar](https://github.com/FelixKratz/SketchyBar) - a menubar replacement
* ~~[spacebar](https://github.com/cmacrae/spacebar) - a menubar replacement~~ Using sketchybar instead
* ~~[Hammerspoon](http://www.hammerspoon.org/) - required for stackline~~ Replaced by sketchybar indicator
* ~~[stackline](https://github.com/AdamWagner/stackline) - visual support for stacks in yabai~~ Replaced by sketchybar indicator

### Yabai Dock integration

Yabai requires installing a script runner into the Dock app to perform the various
space manipulations. This requires you to disable specific features of the System
Integrity Protection (SIP). You can follow the steps on the Yabai Wiki page:
https://github.com/koekeishiya/yabai/wiki/Disabling-System-Integrity-Protection 

Once it is disabled you need to run the following command to install the scripting addition:

    # install the scripting addition
    sudo yabai --install-sa

    # load the scripting addition
    killall Dock

### Yabai upgrade steps

You can find the latest upgrade steps on the Yabai Wiki:

https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(latest-release)#updating-to-the-latest-release

## Bootstrapping a new system

### Generate and add an SSH key to GitHub

    ssh-keygen

Copy the public key (eg.g `~/.ssh/id_rsa.pub`) and add it to GitHub.com.

### Install Homebrew (Mac only)

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

### Install [yadm](https://github.com/TheLocehiliosan/yadm)

    # If on a Mac, use homebrew to install YADM
    brew install yadm

    # If not on a Mac, the simplest way is to download the script directly
    curl -fLo /usr/local/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && chmod a+x /usr/local/bin/yadm

The manual installation may require `sudo` permissions.

### Clone the repository with yadm

    yadm clone --recurse-submodules git@github.com:jeffwyeh/dotfiles.git

### Bootstrap using yadm

    yadm bootstrap

### Source Zsh (optional)

    source ~/.zshrc

### Install Brew bundle (optional)

Note: this step is performed during the yadm bootstrap process but is added
here for completeness.

    brew bundle --global

### Configure iTerm2 to find custom preferences

    # Specify the preferences directory
    defaults write com.googlecode.iterm2 PrefsCustomFolder -string "$HOME/.config/iterm/"

    # Tell iTerm2 to use the custom preferences in the directory
    defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true

### Use the following color scheme for Slack (based on base16-one-dark)

    #282C34,#2C3849,#E5C07B,#282C34,#3E4451,#ABB2BF,#98C379,#E06C75,#0F131B,#ABB2BF

### Install [CLI for OSX dictionary](https://github.com/aztack/osx-dictionary)

    wget https://raw.githubusercontent.com/takumakei/osx-dictionary/master/osx-dictionary.rb
    brew install --HEAD -s osx-dictionary.rb
    rm osx-dictionary.rb

### Install pygments on Linux

    sudo yum install python-pygments

## What's missing?

* Making the home and end keys function correctly on Mac
    * See [this link](https://damieng.com/blog/2015/04/24/make-home-end-keys-behave-like-windows-on-mac-os-x)
    * We may be able to add this as a bootstrap step
* Alfred installation and configuration files
* BTT installation and configuration files
* Amphetamine installation and configuration files
* Amphetamine enhancer installation
* Bootstrap can be more robust
* VSCode settings

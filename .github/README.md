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
* [spacebar](https://github.com/cmacrae/spacebar) - a menubar replacement
* [Hammerspoon](http://www.hammerspoon.org/) - required for stackline
* [stackline](https://github.com/AdamWagner/stackline) - visual support for stacks in yabai

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

### Install Homebrew (Mac only)

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

### Install [yadm](https://github.com/TheLocehiliosan/yadm)

    # If on a Mac, use homebrew to install YADM
    brew install yadm

    # If not on a Mac, the simplest way is to download the script directly
    curl -fLo /usr/local/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && chmod a+x /usr/local/bin/yadm

### Clone the repository with yadm

    yadm clone https://github.com/jeffwyeh/dotfiles.git

### Bootstrap using yadm

    yadm bootstrap

### Source Zsh (optional)

    source ~/.zshrc

### Install Brew bundle (optional)

Note: this step is performed during the yadm bootstrap process but is added
here for posterity.

    brew bundle install
    brew bundle cleanup --force

## What's missing?

* Git configuration files, aliases, and commands
    * Need to think about rolling [dev-tools](https://github.com/jeffwyeh/dev-tools) into this repository
* Making the home and end keys function correctly on Mac
    * See [this link](https://damieng.com/blog/2015/04/24/make-home-end-keys-behave-like-windows-on-mac-os-x)
    * We may be able to add this as a bootstrap step
* Alfred installation and configuration files
* BTT installation and configuration files
* Amphetamine installation and configuration files
* Amphetamine enhancer installation
* Bootstrap can be more robust
* iTerm2 configuration
    * Is this even possible, or should we move to kitty or alacritty?
* VSCode settings

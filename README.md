![Fish Shell](https://github.frapsoft.com/top/fish-shell.png)

# Fish Shell Setup OS X [![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg?v=102)](https://github.com/ellerbrock/open-source-badge/) [![Gitter Chat](https://badges.gitter.im/frapsoft/frapsoft.svg)](https://gitter.im/frapsoft/frapsoft/)

Terminal Setup for OS X with [Fish Shell](https://fishshell.com/), [Fisherman](http://fisherman.sh/), [Powerline Fonts](https://github.com/powerline/fonts) and [iTerm2](https://www.iterm2.com/).

![Fish Shell](https://github.frapsoft.com/screenshots/fish-shell-v4.jpg)

## Quick Install

Can't wait to run the fish shell?  
You can run the [install.sh](https://github.com/ellerbrock/tutorial-fish-shell-setup-osx/blob/master/install.sh) to install the [Fish Shell](https://fishshell.com/), [Fisherman](http://fisherman.sh/), [Powerline Fonts](https://github.com/powerline/fonts) and [iTerm2](https://www.iterm2.com/).

`curl https://raw.githubusercontent.com/ellerbrock/fish-shell-setup-osx/master/install.sh | bash`

## iTerm2

- Download and Install [iTerm2](https://www.iterm2.com/) - a better Terminal for OS X.
- [iTerm2 Color Schemas](http://iterm2colorschemes.com/) - Color Themes for iTerm2

## Powerline Fonts

- <https://github.com/powerline/fonts>
- <https://github.com/gabrielelana/awesome-terminal-fonts>

```
brew install fontconfig
cp /usr/local/etc/fonts/fonts.conf.bak /usr/local/etc/fonts/fonts.conf

git clone https://github.com/powerline/fonts.git
./fonts/install.sh
```

## Fish Shell

Fish Shell Installation (latest):  
`brew install fish --HEAD`

add the shell to the system know shells: `echo /usr/local/bin/fish | sudo tee -a /etc/shells`

make fish your default shell:  
`chsh -s /usr/local/bin/fish`

The Fish Shell configuration folder is located under: `~/.config/fish/`

The main configuration file is: `~/.config/fish/config.fish`, i source here 2 files.

```
source ~/.fish_aliases
source ~/.fish_variables
```

create a file `~/.fish_variables` to source your variables:

```
# Setup your Github Token
set --export HOMEBREW_GITHUB_API_TOKEN "01010101010101010101010101"

# add /usr/local/sbin to your PATH Variable
set --export PATH /usr/local/sbin $PATH
```

create a file `~/.fish_aliases` to source your aliases:

```
alias l "ls -alF"
alias .. "cd .."
alias sshserver "ssh user@server.dev"
alias updatedb "sudo /usr/libexec/locate.updatedb"
alias myrsync "rsync -aihvP"
```

## Fisherman (Fish Shell Extension / Plugins)

Homepage: [fisherman.sh](http://fisherman.sh/)

Installation:  
`curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman`

- `fisher up` update all
- `fisher ls-remote` list all available plugins
- `fisher z` autocompletion for most used directories
- `fisher edc/bass` for better bash compatibility
- `fisher cprintf` printf with colours
- `fisher docker-completion` docker completion
- `brew install fzf; fisher fzf` fuzzing finder
- `brew install grc; fisher grc` colourizer for terminal apps

## Themes

A [list with screenshots](https://github.com/oh-my-fish/oh-my-fish/blob/master/docs/Themes.md) of available themes.

I like the Budspencer Theme, so lets install it.

Make sure sure you have install Fish in the latest Version (`brew install fish --HEAD`) to run the budspencer theme.

`brew install --with-default-names gnu-sed` install dependencies

`fisher omf/theme-budspencer` install the theme budspencer

Theme Setup:

```
set -U budspencer_nogreeting
set -U fish_key_bindings fish_vi_key_bindings
```

## Tips & Tricks

`fish_update_completions` run this once in a while to make the fish prompt aware of available commands and parameters

## Update Script

If you run this more often makes then you can put an alias to this file in your `~/.fish_aliases we talked about above.

```
#!/usr/bin/env fish

echo 'start updating ...'

echo 'updating homebrew'
brew update
brew upgrade
brew cleanup

echo 'updating fish shell'
fisher up
fish_update_completions

echo 'updating npm'
npm update -g

echo 'checking Apple Updates'
/usr/sbin/softwareupdate -ia

exit 0
```

## iTerm default screen

I use the terminal a lot and one windows is just not enought for me.  
You can setup your default window in iTerm2 like you want, mine looks like this:

[![Fish Shell Screenshot](https://github.frapsoft.com/screenshots/fish-shell-v1.png)](https://github.frapsoft.com/screenshots/fish-shell-v1.png)

One big windows on the left for coding or more detailed stuff and two split windows on the right to quickly fire some commands.

To Setup your window like you prefare just right click in the iTerms windows and say "Split Pane Vertically or Horizontally" to your needs.  
When you like it go to "Window -> Save Window Arrangment". For the last step go to "Preferences -> Arrangment" and set it to default.  
Next time you open iTerms it starts with your prefared awesome window setup.

[![Fish Shell Screenshot](https://github.frapsoft.com/screenshots/fish-shell-v2.png)](https://github.frapsoft.com/screenshots/fish-shell-v2.png)

# Aliases and Exports

## Aliases

```
alias rmi "rm -i"

# This is equivalent to entering the following function:

function rmi
    rm -i $argv
end

funcsave
```

<http://fishshell.com/docs/current/commands.html#alias>

## Exports

`set -xU APIKEY "SEC112233"`

> x == export  
> U == universal - meaning that you can access the Variable from other sessions or terminals as well.

`set --export PATH /usr/local/sbin $PATH` another way to export

More details can be found here:

- <http://fishshell.com/docs/2.2/commands.html#set>
- <http://fishshell.com/docs/current/tutorial.html#tut_exports>

## Fun Stuff

- [ASCII Font Generator](http://patorjk.com/software/taag/#p=display&f=Doh&t=Frapsoft)
- [20 Funny Terminal Commands](http://www.tecmint.com/20-funny-commands-of-linux-or-linux-is-fun-in-terminal/)
- [Open Source Badge](https://github.com/ellerbrock/open-source-badge/)

## Other useful Resources

- [Awesome fish](https://github.com/brj/awesome-fish) - A curated list of awesome tools, prompts and other cool nuggets for the amazing fish-shell.
- [Fish Shell Cookbook](https://github.com/brj/fish-shell-cookbook) - Tips and recipes for fish, from shell to plate.
- [Awesome OS X Command Line](https://github.com/herrbischoff/awesome-osx-command-line) - Use your OS X terminal shell to do awesome things.

### Contact / Social Media

*Get the latest News about Web Development, Open Source, Tooling, Server & Security*

[![Twitter](https://github.frapsoft.com/social/twitter.png)](https://twitter.com/frapsoft/)
[![Facebook](https://github.frapsoft.com/social/facebook.png)](https://www.facebook.com/frapsoft/)
[![Google+](https://github.frapsoft.com/social/google-plus.png)](https://plus.google.com/116540931335841862774)
[![Gitter](https://github.frapsoft.com/social/gitter.png)](https://gitter.im/frapsoft/frapsoft/)
[![Github](https://github.frapsoft.com/social/github.png)](https://github.com/ellerbrock/)

### Development by 

Developer / Author: [Maik Ellerbrock](https://github.com/ellerbrock/)  
Company: [Frapsoft](https://github.com/frapsoft/)


### License 

<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br />

This work by <a xmlns:cc="http://creativecommons.org/ns#" href="https://github.com/ellerbrock/" property="cc:attributionName" rel="cc:attributionURL">Maik Ellerbrock</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.

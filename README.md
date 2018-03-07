My Linux Env
============

This is a repository of my own linux configuration files.

# Why?

It's a pain having to setup a new Linux environment. I have had to do it many times for various reasons and this repo is an attempt to reduce that pain in future. Also it's good to keep a record of interesting configs I have come across.

# How this works

It's basically all [https://news.ycombinator.com/item?id=11070797](here) but documenting in a little more detail for future me here.

## First Time

This is how to do this first time ever i.e. you are on a machine with a config and you want to start tracking that config. Not use an existing one.

```bash
# Initialize a bare repo in a directory called .cfg
git init --bare ~/.cfg

# Setup an alias for interacting with this repo (using config but can be whatever)
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> ~/.bashrc && source ~/.bashrc
```

```bash
# Basically ignore (just don't show) untracked files
config config --local status.showUntrackedFiles no
```

```bash
# If you want to push this to a remote, set that up
config remote add origin {your repo URL}
```

Now you can add the files you want to track.

Small side note. On mac I notice it's usually .bash_profile instead of .bashrc so, since I was on Ubuntu here, I have made that a symlink:

```bash
ln -s .bashrc .bash_profile
```

For this repo I did this (my apologies if this gets out of sync):

```bash
config add .bashrc .bash_aliases .bash_exports .bash_functions .bash_path .bash_profile .bash_prompt
```

```bash
config add .gitconfig .gitignore
```

```bash
config commit -m 'Added config files'
config push
```

## Pulling configs to a new machine

Warning! I haven't actually done this yet but will try to update this with any corrections if I do.

This is what I would do.

Setup the alias the same as if it was a new setup.

```bash
git init --bare ~/.cfg

echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> ~/.bashrc && source ~/.bashrc

config config --local status.showUntrackedFiles no

config remote add origin {your repo URL}
```

Now you have a choice. You can delete or move and backup your local config files and just do `config pull`

Or, if you have local configs you want to keep, you can add them, commit them and merge from remote. 
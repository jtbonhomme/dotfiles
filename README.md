# My dotfiles

## Workspace Configuration

Add a `devrc` file containing the directory path of the `Development` workspace directory.
This file is not considered by git.

For example:

```
% echo 'DEV=$HOME/Documents/Developpements' > ~/dotfiles/devrc
```

## Symlink

Add a symbolic link for any dotfile you may want to use:

```
% ln -s $HOME/dotfiles/devrc $HOME/.devrc
```

# .dotfiles

Idea was stolen from [this topic][1] on HN.
There is alias in `.zshrc` called `dtf`:
```
alias dtf='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

It's allows you keep `.git` directory sepate from `$HOME`. Track and commit changes with same git commands:
```
dtf status
dtf add .vimrc
```

## Install
Replicate files:
```
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/vandal-x/.dotfiles.git $HOME
```

If home direcotory isn't empty, clone to temporary directory, then delete it
```
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/vandal-x/.dotfiles.git $HOME/.dotfiles-tmp
rm -rf .dotfiles-tmp
```

## TODO

- add bootstrap script

[1]: https://news.ycombinator.com/item?id=11070797

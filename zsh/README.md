# Zsh settings

Use [prezto](https://github.com/sorin-ionescu/prezto).

## powerline10k

https://github.com/romkatv/powerlevel10k/blob/master/README.md#i-cannot-make-powerlevel10k-work-with-my-plugin-manager-help

```
prezto: Open ~/.zpreztorc and put zstyle :prezto:module:prompt theme off in it. Remove any other command that sets theme such as zstyle :prezto:module:prompt theme powerlevel9k.
```

```
git clone https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc
```
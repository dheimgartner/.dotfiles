# .dotfiles

> Manage with GNU stow.
> stow just creates symlinks and you can manipulate the configs either in `.dotfiles`
> or at the linked location!

- Keep individual `.gitignore` (e.g. `.dotfiles/nvim/.config/nvim/.gitignore`, to exclude `plugin/`)
- Link to target by first navigating to `.dotfiles` and then either `stow *` or `stow <config>`

> `stow */` will only link the immediate subdirectories.

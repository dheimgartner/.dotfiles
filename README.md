# .dotfiles

Based on:
1. https://www.youtube.com/watch?v=CxAT1u8G7is&t=17subdirectory
2. https://www.youtube.com/watch?v=90xMTKml9O0

> Manage with GNU stow.
> stow just creates symlinks and you can manipulate the configs either in `.dotfiles`
> or at the linked location!

- Keep individual `.gitignore` (e.g. `.dotfiles/nvim/.config/nvim/.gitignore`, to exclude `plugin/`)
- Link to target by first navigating to `.dotfiles` and then either `stow *` or `stow <config>`
- You can easily have a versioned subdirectory (i.e. version `.dotfiles/nvim/.config/nvim`)
- You can easily remove symlinks with stow (e.g. `stow -D .`)

What's the difference to `stow .`?
- Equivalent to `stow --dir=~/.dotfiles --target=~/`
- So this will literally symlink `nvim/.config/nvim/....` to your home -> we don't want that!

> `stow */` will only link the immediate subdirectories.

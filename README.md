# nvim-pandoc

A basic integration of `pandoc` features on Neovim.

## Usage

`:PandocWrite [ext]`: executes `pandoc filename.foo -o filename.ext`. If `[ext]` is left empty, writes to `filename.pdf`.

`:PandocRead [ext]`: executes `xdg-open filename.ext`. If `[ext]` is left empy, tries to open `filename.pdf`.

## TODO list

- Add ability to change PDF reader
- Add ability to change pandoc args
- Probably something more
- Better error handling

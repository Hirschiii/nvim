<h1 align="center">
  <img
    src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/misc/transparent.png"
    height="30"
    width="0px"
  />
  dope
  <img
    src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/misc/transparent.png"
    height="30"
    width="0px"
  />
</h1>

<p align="center">
  <img src="https://user-images.githubusercontent.com/41671631/176990490-aeb6111b-41ea-4767-bc03-c0aee4774a4e.png"
  height = "40%"
  width = "40%"
  />
</p>

## Structure

```
lua
├── core
│   ├── cli.lua
│   ├── helper.lua
│   ├── init.lua
│   ├── keymap.lua
│   ├── options.lua
│   └── pack.lua
├── internal
│   ├── cursorword.lua
│   ├── epoch.lua
│   ├── event.lua
│   └── track.lua
├── keymap
│   ├── init.lua
│   └── remap.lua
└── modules
    ├── completion
    │   ├── config.lua
    │   └── package.lua
    ├── debug
    │   ├── config.lua
    │   └── package.lua
    ├── editor
    │   ├── config.lua
    │   └── package.lua
    ├── fun
    │   ├── config.lua
    │   └── package.lua
    ├── lsp
    │   ├── config.lua
    │   └── package.lua
    ├── tools
    │   ├── config.lua
    │   └── package.lua
    └── ui
        ├── config.lua
        └── package.lua
```

- `core` heart of dope it include the api of dope
- `modlues` plugin module and config in this folder
- `snippets` vscode snippets json file


### Cli tool

`bin/dope` is a cli tool for dope config. run `./bin/dope help` check more detail

you can use `/bin/dope debug ui,editor` for debug modues. when you get trouble
this is useful for your debug, this command mean disable `ui editor` modules.Then
the plugins in `ui,editor` modules not load.

## How to install plugins

dope use [lazy.nvim](https://github.com/folk/lazy.nvim) as package management plugin. register a plugin in `package.lua` by using dope api `require('core.pack').package`. more usage check the
lazy.nvim doc and you can some examples in package.lua file.

### How to create module

create a fold inside `modlues` folder and `package.lua` file you must created inside your module.
dope will auto read this file at startup.


### How to config keymap



## Tips

- Improve key repeat

```
mac os need restart
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

linux
xset r rate 210 40
```

## Donate

[![](https://img.shields.io/badge/PayPal-00457C?style=for-the-badge&logo=paypal&logoColor=white)](https://paypal.me/bobbyhub)

If you'd like to support my work financially, buy me a drink through [paypal](https://paypal.me/bobbyhub)

## License MIT

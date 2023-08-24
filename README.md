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

In dope there are some apis that make it easy to set keymap. All apis are defined in `core/keymap.lua`.

```lua
keymap.(n/i/c/v/x/t)map -- function to generate keymap by vim.keymap.set
keymap.new_opts -- generate opts into vim.keymap.set
-- function type that work with keymap.new_opts
keymap.silent keymap.noremap keymap.expr keymap.nowait keymap.remap
keymap.cmd -- just return string with <Cmd> and <CR>
keymap.cu -- work like cmd but for visual map
```

Use these apis to config your keymap in `keymap` folder. In this folder `keymap/init.lua` is necessary but if you

have many vim mode remap you can config them in `keymap/other-file.lua` in dope is `config.lua` just an

example file. Then config plugins keymap in `keymap/init.lua`. the example of api usage

```lua
-- generate keymap in noremal mode
nmap {
  -- packer
  {'<Leader>pu',cmd('Lazy update'),opts(noremap,silent,'Lazy update')},
   {"<C-h>",'<C-w>h',opts(noremap)},
  
}

also you can pass a table not include sub table to `map` like

```lua
nmap {'key','rhs',opts(noremap,silent)}
```

`<leader>...`-keybindings are configured with `whichkey`.
For this to work we need to require the `whichkey` module. 
`Whichkey` groups the keybindings. So you can the for example the
`l` group for `LSP`. If you have the default config and you hit `<leader>l`
on your keyboard should `whichkey` pop up after some time and it will
show you the next options.

```lua
local which_key = require("modules.editor.config")
local mapping = {
  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
  }
}

local opts = {
  prefix = "<leader>",
}

-- return mapping, opts
which_key.which_key_regester(mapping, opts)
```

use `:h vim.keymap.set` to know more about.



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

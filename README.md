# Keybindings:

## Telescope:

| Mode | Kombination | Funktion                          | Beschreibung                              |
| ---- | ----------- | --------------------------------- | ----------------------------------------- |
| "n"  | "<space>fd" | builtin.find_files                | Datein bei Namen                          |
| "n"  | "<space>ft" | builtin.git_files                 | Alle Git-Datein                           |
| "n"  | "<space>fh" | builtin.help_tags                 | NeoVims Hilfe-Tags                        |
| "n"  | "<space>fg" | builtin.live_grep                 | Live Grep in alle Datein                  |
| "n"  | "<space>fb" | builtin.buffers                   | Alle offenen Buffer                       |
| "n"  | "<space>/"  | builtin.current_buffer_fuzzy_find | Fuzzyfinding im Buffer (wie "/")          |
| "n"  | "<space>gw" | builtin.grep_string               | Alle Datein mit dem Wort unter dem Cursor |
| "n"  | "<space>en" |                                   | Alle NeoVim config Datein                 |
| "n"  | "<space>fa" |                                   | Alle Plugin-Datein                        |

## LSP

| Mode | Kombination | Funktion                    | Beschreibung                                 |
| ---- | ----------- | --------------------------- | -------------------------------------------- |
| "n"  | "gd"        | builtin.lsp_definitions     | Definition der Funktion                      |
| "n"  | "gr"        | builtin.lsp_references      | Alle Referencen                              |
| "n"  | "gD"        | vim.lsp.buf.declaration     | Zur Declaration (Nicht immer unterstuetzt)   |
| "n"  | "gT"        | vim.lsp.buf.type_definition | Springt zur Definition des Typen             |
| "n"  | "K"         | vim.lsp.buf.hover           | Allgemeine Informationen                     |
| "i"  | "<c-h>"     | vim.lsp.buf.signature_help  | Zeigt die Attribute einer Funktion an        |
| "n"  | "<space>cr" | vim.lsp.buf.rename          | Benennt alle referencen um                   |
| "n"  | "<space>ca" | vim.lsp.buf.code_action     | Listet mögliche Code Actions auf             |
| "n"  | "<space>v"  | vim.diagnostics.open_float  | Oeffnet die kompletten diagnostics der Zeile |

# Snippet idee

```
::: dynamic

:::
```

zu:

```
\startdynamic
\stopdyncamic
```

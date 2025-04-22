<h1 align="center">
	OldWorld for <a href="https://github.com/neovim/neovim">Neovim</a>
</h1>

<p align="center">
	<a href="https://github.com/dgox16/oldworld.nvim/stargazers"><img src="https://img.shields.io/github/stars/dgox16/oldworld.nvim?style=for-the-badge&colorA=161617&colorB=e6b99d"></a>
	<a href="https://github.com/dgox16/oldworld.nvim/issues"><img src="https://img.shields.io/github/issues/dgox16/oldworld.nvim?style=for-the-badge&colorA=161617&colorB=ea83a5"></a>
	<a href="https://github.com/dgox16/oldworld.nvim/contributors"><img src="https://img.shields.io/github/contributors/dgox16/oldworld.nvim?style=for-the-badge&colorA=161617&colorB=92a2d5"></a>
</p>

After a long time using themes with bright and saturated colors, I've decided to give my eyes a more relaxing view. OldWorld is a theme heavily based on [mellow.nvim](https://github.com/mellow-theme/mellow.nvim) but adding new colors and new integrations with different plugins.

Why not simply fork it? I've thought about it carefully, but my idea with the theme is to add new colors, changing some of the existing ones, which would eventually result in a different theme.

## 📷 Preview

![preview_default](https://github.com/user-attachments/assets/b2e64ab8-2559-49d4-ad7c-917344c669f2)

## 🎨 Pallete

![oldworld (1)](https://github.com/user-attachments/assets/0e0db774-92ac-4cda-93b4-9c3cd38a68c2)

## 📦 Installation

With [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
    "dgox16/oldworld.nvim",
    lazy = false,
    priority = 1000,
}
```

## 🚀 Usage

Using lua:

```lua
vim.cmd.colorscheme("oldworld")
```

## ⚙️ Configuration

The theme will use the default values unless you change the default configuration shown below:

```lua
local default_config = {
    terminal_colors = true, -- enable terminal colors
    variant = "default", -- default, oled, cooler
    styles = { -- You can pass the style using the format: style = true
        comments = {}, -- style for comments
        keywords = {}, -- style for keywords
        identifiers = {}, -- style for identifiers
        functions = {}, -- style for functions
        variables = {}, -- style for variables
        booleans = {}, -- style for booleans
    },
    integrations = { -- You can disable/enable integrations
        alpha = true,
        cmp = true,
        flash = true,
        gitsigns = true,
        hop = false,
        indent_blankline = true,
        lazy = true,
        lsp = true,
        markdown = true,
        mason = true,
        navic = false,
        neo_tree = false,
        neogit = false,
        neorg = false,
        noice = true,
        notify = true,
        rainbow_delimiters = true,
        telescope = true,
        treesitter = true,
    },
    highlight_overrides = {}
}
```

To configure a setting, you should pass that setting with the changed value following the structure of the default configuration.

```lua
require("oldworld").setup({
    styles = {
        booleans = { italic = true, bold = true },
    },
    integrations = {
        hop = true,
        telescope = false,
    },
    highlight_overrides = {
        Comment = { bg = "#ff0000" }
    }
})
```

## 🔥 Contributing

It's my first theme and my first Neovim plugin. I know in advance that there will be several things to improve. If you like the theme and find an improvement, you can make a PR, and I'll review it. The intention is to create a more comprehensive theme.

## 🎙️ Acknowledgements

- [mellow.nvim](https://github.com/mellow-theme/mellow.nvim) used its amazing color palette and styles as a base.

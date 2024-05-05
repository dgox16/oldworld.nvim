<p align="center">
  <h1 align="center">OldWorld.nvim</h1>
</p>

After a long time using themes with saturated colors, I've decided to give my eyes a more relaxing view. OldWorld is a theme heavily based on [mellow.nvim](https://github.com/mellow-theme/mellow.nvim) but adding new colors and new integrations with different plugins.

Why not simply fork it? I've thought about it carefully, but my idea with the theme is to add new colors, changing some of the existing ones, which would eventually result in a different theme.

## 📷 Preview

![image](https://github.com/dgox16/oldworld.nvim/assets/90411765/bcdca460-eb00-487a-b210-01bb09421048)

![image](https://github.com/dgox16/oldworld.nvim/assets/90411765/365be514-8a05-48ef-b879-95531d7677d4)

## 📦 Installation

With [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
    "dgox16/oldworld.nvim",
    lazy = false,
    priority = 1000,
    config = true,
}
```

## 🚀 Usage

Using lua:

```lua
vim.cmd.colorscheme("oldworld")
```

## ⚙️ Configuration

The theme will use the default themes unless you change the default configuration shown below:

```lua
local default_config = {
    terminal_colors = true,
    styles = {
        comments = { italic = true },
        keywords = {},
        identifiers = {},
        functions = { italic = true },
        variables = {},
        booleans = {},
    },
}
```

If you want to change any setting, you will need to pass the configuration with the adjusted value to the setup function according to your needs.

```lua
require("oldworld").setup({
    terminal_colors = true, -- enable terminal colors
    styles = { -- You can pass the style using the format: style = true
        comments = { italic = true }, -- style for comments
        keywords = {}, -- style for keywords
        identifiers = {}, -- style for identifiers
        functions = { italic = true }, -- style for functions
        variables = {}, -- style for variables
        booleans = { bold = true }, -- style for booleans
    },
})
```

## 🔥 Contributing

It's my first theme and my first Neovim plugin. I know in advance that there will be several things to improve. If you like the theme and find an improvement, you can make a PR, and I'll review it. The intention is to create a more comprehensive theme.

## 🎙️ Acknowledgements

-   [mellow.nvim](https://github.com/mellow-theme/mellow.nvim) used its amazing color palette as a base.

return require'packer'.startup(function()
    use 'wbthomason/packer.nvim'
    use "EdenEast/nightfox.nvim" -- Packer
    use 'nvim-tree/nvim-web-devicons'
    use 'nvim-tree/nvim-tree.lua'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use("windwp/nvim-autopairs")
    use {
        "terrortylor/nvim-comment"
    }
    use("nvim-lualine/lualine.nvim") --> a statusline written in lua
    -- cpp highlight
    use 'octol/vim-cpp-enhanced-highlight'
    use 'https://github.com/terryma/vim-multiple-cursors' -- CTRL + N for multiple cursors

    use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
})
end)

return require'packer'.startup(function()
    use 'wbthomason/packer.nvim'
    use 'nvim-tree/nvim-web-devicons'
--    use "EdenEast/nightfox.nvim"
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
end)

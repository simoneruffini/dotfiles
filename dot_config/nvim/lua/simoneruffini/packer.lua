-- only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Treesitter
    use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    -- Colorscheme Noctis
    --use { 'kartikp10/noctis.nvim', requires = { 'rktjmp/lush.nvim' } }
    -- Install without configuration
    use ({ 'projekt0n/github-nvim-theme', tag = 'v0.0.7'})
end)

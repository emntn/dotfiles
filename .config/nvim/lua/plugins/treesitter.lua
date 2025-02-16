return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require('nvim-treesitter.install').compilers = { 'gcc' }
      require('nvim-treesitter.configs').setup {
        ensure_installed = { "bash", "javascript", "lua", "markdown_inline", "python", "regex", "rust", "tsx", "typescript" },
        auto_install = true,
        highlight = {
          enable = true,
          disable = { "markdown" },
        }
      }
    end
  }
}

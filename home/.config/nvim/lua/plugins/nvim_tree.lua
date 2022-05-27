local function config()
  vim.g.nvim_tree_root_folder_modifier = ":t"

  require"nvim-tree".setup{
    open_on_setup = true,
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    update_cwd = true,
    update_focused_file = {
      enable = true,
    },
    filters = {
      dotfiles = false,
    },
    view = {
      side = "left",
      width = 25,
    },
    git = {
      enable = false,
      ignore = false,
    },
    actions = {
      open_file = {
        resize_window = true,
      },
      change_dir = {
        enable = true,
        restrict_above_cwd = true,
      }
    },
    renderer = {
      indent_markers = {
        enable = true,
      },
    },
  }

  -- auto close file exploer when quiting incase a single buffer is left
  vim.cmd([[ autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'nvimtree') | q | endif ]])
end

return {
  "kyazdani42/nvim-tree.lua",
  config=config,
  requires = {
    { "kyazdani42/nvim-web-devicons" },
  },
}

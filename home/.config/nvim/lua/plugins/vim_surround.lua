local function config()
  vim.cmd("nmap ds       <Plug>Dsurround")
  vim.cmd("nmap cs       <Plug>Csurround")
  vim.cmd("nmap cS       <Plug>CSurround")
  vim.cmd("nmap ys       <Plug>Ysurround")
  vim.cmd("nmap yS       <Plug>YSurround")
  vim.cmd("nmap yss      <Plug>Yssurround")
  vim.cmd("nmap ySs      <Plug>YSsurround")
  vim.cmd("nmap ySS      <Plug>YSsurround")
  vim.cmd("xmap gs       <Plug>VSurround")
  vim.cmd("xmap gS       <Plug>VgSurround")
end

return {
  "tpope/vim-surround",
  keys = { "c", "d", "y" },
  config = config,
}

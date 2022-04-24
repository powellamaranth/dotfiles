local bootstrap = require("bootstrap")

bootstrap.install_packer()
bootstrap.disable_builtins()

bootstrap.load_core({
  "options",
  "autocmds",
  "mappings",
})

bootstrap.load_plugins({
  "impatient",
  "packer",
  "plenary",
  "dracula",
  "nvim_notify",
  "neoscroll",
  "better_escape",
  "web_devicons",
  "lualine",
  "telescope",
  "tree",
  "bufferline",
})

bootstrap.load_custom_init()

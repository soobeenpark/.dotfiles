
local overrides = require("custom.configs.overrides")

local plugins = {

  -- override plugin configs

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
}

return plugins

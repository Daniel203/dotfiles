local Remap = require("config.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<leader>gh", ":diffset //3");
nnoremap("<leader>gu", ":diffset //2");

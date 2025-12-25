return {
	{
		"RRethy/base16-nvim",
		priority = 1000,
		config = function()
			require('base16-colorscheme').setup({
				base00 = '#131316',
				base01 = '#1f1f22',
				base02 = '#343437',
				base03 = '#45464e',
				base04 = '#c6c6ce',
				base05 = '#e4e2e5',
				base06 = '#e4e2e5',
				base07 = '#303033',
				base08 = '#ffb4ab',
				base09 = '#e3badc',
				base0A = '#c6c6ce',
				base0B = '#bac6ed',
				base0C = '#c2c6d7',
				base0D = '#bac6ed',
				base0E = '#c2c6d7',
				base0F = '#ffb4ab',
			})

			local function set_hl_mutliple(groups, value)
				for _, v in pairs(groups) do vim.api.nvim_set_hl(0, v, value) end
			end

			vim.api.nvim_set_hl(0, 'Visual',
				{ bg = '#657194', fg = '#ffffff', bold = true })
			vim.api.nvim_set_hl(0, 'LineNr', { fg = '#45464e' })
			vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#bac6ed', bold = true })

			local current_file_path = vim.fn.stdpath("config") .. "/lua/plugins/dankcolors.lua"

			if not _G._matugen_theme_watcher then
				local uv = vim.uv or vim.loop
				_G._matugen_theme_watcher = uv.new_fs_event()

				_G._matugen_theme_watcher:start(current_file_path, {}, vim.schedule_wrap(function()
					local new_spec = dofile(current_file_path)

					if new_spec and new_spec[1] and new_spec[1].config then
						new_spec[1].config()
						print("󰂖 Matugen: Colors reloaded!")
					end
				end))
			end
		end
	}
}

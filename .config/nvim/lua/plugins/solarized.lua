return {
	'maxmx03/solarized.nvim',
	lazy = false,
	priority = 1000,
	config = function()
		vim.o.termguicolors = true
		vim.o.background = 'dark'
		require('solarized').setup({
			transparent = {
				enabled = true,
				pmenu = false,
				normal = false,
				normalfloat = false,
				neotree = true,
				nvimtree = true,
				whichkey = true,
				telescope = true,
				lazy = false,
			},
			on_highlights = function(colors, color)
				---@type solarized.highlights
				local groups = {
					SpellBad = { underline = true, strikethrough = false, fg = colors.red, undercurl = true },
					CursorLineNr = { fg = colors.base0 },
					Identifier = { fg = colors.base0 },
					Operator = { fg = colors.green },
					Type = { fg = colors.base0 },
					Property = { fg = colors.yellow },
					Underlined = { fg = colors.green },
					Title = { fg = colors.base0, bold = true },
					WinSeparator = { fg = colors.base01 },
					FloatTitle = { fg = colors.base01, bg = colors.base03 },
					FloatBorder = { fg = colors.base01, bg = colors.base03 },
					['@lsp.type.type'] = { fg = colors.yellow },
					['@lsp.type.struct'] = { fg = colors.yellow },
					['@lsp.type.trait'] = { fg = colors.yellow },
					['@lsp.type.parameter'] = { fg = colors.base0, italic = false },
				}
				return groups
			end,
			on_colors = nil,
			palette = 'solarized', -- solarized (default) | selenized
			variant = 'spring', -- "spring" | "summer" | "autumn" | "winter" (default)
			error_lens = {
				text = false,
				symbol = false,
			},
			styles = {
				enabled = true,
				comments = { italic = true },
			},
			plugins = {
				treesitter = true,
				lspconfig = true,
				navic = true,
				cmp = true,
				indentblankline = true,
				neotree = true,
				nvimtree = true,
				whichkey = true,
				dashboard = true,
				gitsigns = true,
				telescope = true,
				noice = true,
				hop = true,
				ministatusline = true,
				minitabline = true,
				ministarter = true,
				minicursorword = true,
				notify = true,
				rainbowdelimiters = true,
				bufferline = true,
				lazy = true,
				rendermarkdown = true,
				ale = true,
				coc = true,
				leap = true,
				alpha = true,
				yanky = true,
				gitgutter = true,
				mason = true,
				flash = true,
			},
		})
		vim.cmd.colorscheme 'solarized'
	end,
}

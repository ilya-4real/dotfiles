return {
	{
		'neovim/nvim-lspconfig',
		opts = {
			inlay_hints = true,
		},
		config = function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
			local lspconfig = require('lspconfig')
			lspconfig.basedpyright.setup{
				settings = {
					capabilites = capabilities,
					basedpyright = {
						analysis = {
							exclude = {"**/.venv","env*", ".env", "**/venv", "**/__pycache__", "**/node_modules", "/usr/lib/node_modules/" },
							typeCheckingMode = "standard",
							autoSearchPaths = true,
							useLibraryCodeForTypes=true,
							diagnosticMode="workspace",
							reportMissingTypeStubs = true,
						},
					},
				},
			}
			-- lspconfig.ruff.setup{
				-- capabilities=capabilities,
			-- }
			lspconfig.rust_analyzer.setup{
				capabilities=capabilities,
				settings = {
					['rust-analyzer'] = {
						inlayHints = {
						enable = true,
						typeHints = true,
						parameterHints = true,
						}
					}
				}
			}
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if client == nil then
						return
					end
					if client.name == 'ruff' then
						-- Disable hover in favor of Pyright
						client.server_capabilities.hoverProvider = false
					end
				end,
				desc = 'LSP: Disable hover capability from Ruff',
			})
		end
	}
}

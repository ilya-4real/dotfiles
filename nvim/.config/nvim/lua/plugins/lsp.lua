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
							exclude = {"**/.venv","env*", "**/.nox/**", ".env", "**/venv", "**/__pycache__", "**/node_modules", "/usr/lib/node_modules/" },
							typeCheckingMode = "standard",
							autoSearchPaths = true,
							useLibraryCodeForTypes=true,
							diagnosticMode="workspace",
							reportMissingTypeStubs = true,
						},
					},
				},

			-- lspconfig.pylsp.setup{
			-- 	capabilities = capabilities,
			-- 	settings = {
			-- 		pylsp = {
			-- 			plugins = {
			-- 				pylsp_mypy = {
			-- 					enable = true,
			-- 					live_mode=false,
			-- 					report_progress=true,
			-- 					-- dmypy=true,
			-- 					-- strict=true,
			-- 					follow_imports="normal"
			-- 				},
			-- 				jedi_completion = {enable = true},
			-- 				preload = { enabled = true },  -- Faster startup
			-- 			}
			-- 		}
					-- pylsp_mypy = {
					-- 	enabled = true,
					-- 	strict = true,
					-- 	live_mode = false,  -- Requires file save to update
					-- 	overrides = {"--show-error-codes", "--disallow-any-generics"},
					-- },
					-- jedi_completion = { enabled = true },
					-- jedi_hover = { enabled = true },
					-- jedi_references = { enabled = true },
					-- jedi_signature_help = { enabled = true },
					-- jedi_symbols = { enabled = true },
					--
					-- -- Advanced features
					-- rope_completion = { enabled = true },
					-- mccabe = { enabled = true },  -- Code complexity
					-- pylint = { enabled = false },  
			}
			lspconfig.emmet_language_server.setup{
				capabilities=capabilities,
			}
			lspconfig.elixirls.setup {
				capabilities=capabilities,
				cmd = { "/home/ilya/elxrls/language_server.sh" },  -- uses the installed binary
				filetypes = { "elixir", "eelixir", "heex" },
				root_dir = lspconfig.util.root_pattern("mix.exs", ".git"),
			}
			lspconfig.ruff.setup{
				on_attach = function(client, bufnr)
					client.server_capabilities.documentFormattingProvider = true
				end
		}
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
			lspconfig.gopls.setup{
				capabilities= vim.tbl_deep_extend(
					"force", {}, require('cmp_nvim_lsp').default_capabilities(), lspconfig.gopls.capabilities or {}
				),
				filetypes ={ "go", "gomod", "gowork", "gotmpl" },
				settings = {
					gopls = {
					completeUnimported=true,
					usePlaceholders=true,
						hints = {
							assignVariableTypes = true,
							compositeLiteralFields = true,
							compositeLiteralTypes = true,
							constantValues = true,
							functionTypeParameters = true,
							parameterNames = false,
							rangeVariableTypes = true
						},
					semanticTokens=true
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

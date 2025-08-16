{ config, pkgs, ... }:

{
	programs.neovim = {
		enable = true;
		defaultEditor = true; plugins = with pkgs.vimPlugins;[
			telescope-nvim
			(nvim-treesitter.withPlugins (p: [
				p.java
				p.lua
				p.javascript
				p.python
				p.nix
				p.kotlin
			]))
			nvim-lspconfig
			nvim-jdtls
			nvim-cmp
			cmp-nvim-lsp
			cmp-buffer
			cmp-path

		];

		extraPackages = with pkgs; [
			jdt-language-server
			ripgrep
			lombok
			fd
			wl-clipboard

			#compali
			gcc          
			nodejs       
			tree-sitter  
		];

		extraLuaConfig = ''
			local lspconfig = require('lspconfig')

			local cmp = require('cmp')
			cmp.setup({
			 sources = {
			  { name = 'nvim_lsp' },
			  { name = 'buffer' },
			  { name = 'path' },
			 },
			mapping = {
				['<Tab>'] = cmp.mapping.select_next_item(),
				['<CR>'] = cmp.mapping.confirm({ select = true }),
			}
			})

			-- setup jdtls
			local jdtls = require('jdtls')
			local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
			local workspace_dir = vim.fn.expand('~/.cache/jdtls/workspace/') .. project_name

			local config = {
				cmd = {
					'jdtls',
					'--jvm-arg=-javaagent:${pkgs.lombok}/share/java/lombok.jar',
					 --'--jvm-arg=-javaagent:/nix/store/qa7mmvbawqga89nw0lws7pakhcl0mhww-lombok-1.18.38/share/java/lombok.jar', --work if parametrs not work
					'-data', workspace_dir,
				},
				root_dir = jdtls.setup.find_root({'.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle'}),
				on_attach = on_attach,
				capabilities = require('cmp_nvim_lsp').default_capabilities(),
				settings = {
					java = {
						signatureHelp = { enabled = true },
						contentProvider = { preferred = 'fernflower' },
						compile = {
							nullAnalysis = {
								mode = "automatic"
							}
						},
						configuration = {
							updateBuildConfiguration = "interactive"
						}
					}
				},
				on_attach = function(client, bufnr)
					local opts = { noremap=true, silent=true, buffer=bufnr }
					vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
					vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
					vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
					vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
					vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
				end,
			}

			vim.api.nvim_create_autocmd('FileType', {
				pattern = 'java',
				callback = function()
					jdtls.start_or_attach(config)
				end,
			})

			vim.g.mapleader = " "  
			vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

			--Telescope
			require('telescope').setup()
			vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')

			--treesitter
			require('nvim-treesitter.configs').setup {
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = {
					enable = true,
				},
				incremental_selection = {
					enable = true,
				},
			}
			--syntax
			--hi @keyword gui=bold guifg=#f38ba8
			--hi @function gui=bold guifg=#89b4fa  
			--hi @string guifg=#a6e3a1
			--hi @comment guifg=#6c7086 gui=italic
			vim.cmd('syntax enable')
			vim.cmd([[

				hi @keyword gui=bold guifg=#ff6b9d
				hi @keyword.function gui=bold guifg=#ffa726
				hi @keyword.return gui=bold guifg=#66bb6a
				hi @keyword.operator gui=bold guifg=#42a5f5

				hi @function gui=bold guifg=#ab47bc
				hi @function.builtin gui=bold guifg=#ec407a
				hi @function.call gui=bold guifg=#7e57c2
				hi @function.method gui=bold guifg=#26c6da

				hi @string guifg=#a5d6a7
				hi @string.escape guifg=#ffcc02
				hi @string.special guifg=#ff8a65

				hi @number guifg=#81c784
				hi @number.float guifg=#aed581

				hi @type gui=bold guifg=#29b6f6
				hi @type.builtin gui=bold guifg=#26a69a
				hi @type.definition gui=bold guifg=#42a5f5
				
				hi @variable guifg=#ffb74d
				hi @variable.builtin guifg=#ffa726
				hi @variable.parameter guifg=#ff8a65

				hi @constant gui=bold guifg=#e57373
				hi @constant.builtin gui=bold guifg=#ef5350

				hi @comment guifg=#78909c gui=italic
				hi @comment.documentation guifg=#90a4ae gui=italic

				hi @operator guifg=#5c6bc0
				hi @punctuation guifg=#7986cb
				hi @punctuation.bracket guifg=#9575cd
				hi @punctuation.delimiter guifg=#ba68c8

				hi @symbol guifg=#f06292
				hi @tag guifg=#8bc34a
				hi @attribute guifg=#cddc39

				hi @error gui=bold guifg=#f44336
				hi @warning gui=bold guifg=#ff9800
			]])

			-- numbers
			vim.opt.number = true
			vim.opt.relativenumber = true
		'' 
			;
	};	
}

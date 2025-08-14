{ config, pkgs, ... }:

{
	programs.neovim = {
		enable = true;
		defaultEditor = true;
		plugins = with pkgs.vimPlugins;[
			#nerdtree
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
				fd
				wl-clipboard

				#compali
				gcc          
				nodejs       
				tree-sitter  
			];

		extraLuaConfig = ''
			local lspconfig = require('lspconfig')
			lspconfig.jdtls.setup{}

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

			vim.g.mapleader = " "  
			vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

			--Telescope
			require('telescope').setup()
			vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')

			--nerdtree
			--vim.keymap.set('n', '<C-n>', ':NERDTreeToggle<CR>')
			--vim.g.NERDTreeShowHidden = 1
			--vim.keymap.set('n', '<Tab>', '<C-w>w')

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
			vim.cmd('syntax enable')
			vim.cmd([[
				hi @keyword gui=bold guifg=#f38ba8
				hi @function gui=bold guifg=#89b4fa  
				hi @string guifg=#a6e3a1
				hi @comment guifg=#6c7086 gui=italic
			]])

			-- numbers
			vim.opt.number = true
			vim.opt.relativenumber = true
		'' #+ import ./neovimUtil/createFile.nix
		;
	};	
}

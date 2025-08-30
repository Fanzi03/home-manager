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
				p.html
				p.css
				p.sql
			]))
			harpoon2
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
			sqls

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

		''  + import ./neovimUtil/syntax.nix 
		    + import ./neovimUtil/treesitter.nix
		    + import ./neovimUtil/numbers.nix
		    + import ./neovimUtil/map.nix
		    + import ./neovimUtil/telescope.nix
		    + import ./neovimUtil/jdtls.nix { inherit pkgs; } 
		    + import ./neovimUtil/harpoon.nix
		    + import ./neovimUtil/fronted.nix
		    + import ./neovimUtil/sql.nix
			;
	};	
}

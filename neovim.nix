{ config, pkgs, ... }:

{
	programs.neovim = {
		enable = true;
		defaultEditor = true;
		plugins = with pkgs.vimPlugins; [
			nerdtree
			telescope-nvim
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

			--Telescope
			vim.g.mapleader = " "  -- пробел как leader
  
 			require('telescope').setup()
    
    			vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
  		'';
	};	
}

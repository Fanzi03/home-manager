''
	-- HTML Language Server
	lspconfig.html.setup({
	  capabilities = capabilities,
	  filetypes = { "html", "templ" },
	  init_options = {
	    configurationSection = { "html", "css", "javascript" },
	    embeddedLanguages = {
	      css = true,
	      javascript = true
	    }
	  }
	})

	-- CSS Language Server
	lspconfig.cssls.setup({
	  capabilities = capabilities,
	  settings = {
	    css = {
	      validate = true
	    },
	    scss = {
	      validate = true
	    },
	    less = {
	      validate = true
	    }
	  }
	})
	lspconfig.emmet_ls.setup({
		capabilities = capabilities,
  		filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact" }
	})
	
''

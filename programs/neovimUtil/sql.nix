''-- Using nvim-lspconfig
	require('lspconfig').sqls.setup{
	  on_attach = function(client, bufnr)
	  local opts = { noremap=true, silent=true, buffer=bufnr }  
	  end,
	  settings = {
	    sqls = {
	      connections = {
		{
		  driver = 'mysql',
		  --dataSourceName = 'username:password@tcp(localhost:3306)/dbname',
		},
		{
		  driver = 'postgresql', 
		  --dataSourceName = 'host=localhost port=5432 user=username password=password dbname=mydb sslmode=disable',
		},
	      },
	    },
	  },
	   filetypes = { 'sql', 'mysql' },
	}
''

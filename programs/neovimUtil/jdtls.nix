{pkgs, ... }:

''
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
					},
					imports = {
						gradle  = {
							wrapper = {
								checksums = {
									--{
                								--sha256 = "7d3a4ac4de1c32b59bc6a4eb8ecb8e612ccd0cf1ae1e99f66902da64df296172",
                								--allowed = true
              								--}
								}
							}
						}
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
''


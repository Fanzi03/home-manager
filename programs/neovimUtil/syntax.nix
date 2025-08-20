''
			--syntax
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
''


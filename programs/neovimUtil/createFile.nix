''
  -- Функция для создания нового файла
  local function create_new_file()
    vim.ui.input({ prompt = "Введите имя файла: " }, function(input)
      if input and input ~= "" then
        -- Если мы в NERDTree, получаем текущую директорию
        local current_dir = vim.fn.expand("%:p:h")
        if vim.bo.filetype == "nerdtree" then
          -- Получаем путь из NERDTree
          local line = vim.fn.getline(".")
          local nerdtree_path = vim.fn.substitute(line, "^[^/]*", "", "")
          if nerdtree_path ~= "" then
            current_dir = vim.fn.fnamemodify(nerdtree_path, ":h")
          end
        end
        
        local filepath = current_dir .. "/" .. input
        
        -- Создаем директории если не существуют
        vim.fn.mkdir(vim.fn.fnamemodify(filepath, ":h"), "p")
        
        -- Создаем и открываем файл
        vim.cmd("edit " .. vim.fn.fnameescape(filepath))
        
        -- Обновляем NERDTree если он открыт
        vim.cmd("silent! NERDTreeRefreshRoot")
      end
    end)
  end

  -- Привязываем к Shift+F5 в обычном режиме
  vim.keymap.set("n", "<S-F5>", create_new_file, { desc = "Создать новый файл" })
''

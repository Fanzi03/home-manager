
 ''
-- Минимальная рабочая конфигурация JDTLS
local jdtls = require('jdtls')

local jdtls_path = vim.fn.stdpath('data') .. "/lsp_servers/jdtls"
local path_to_jar = jdtls_path .. "/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar"
local lombok_path = jdtls_path .. "/plugins/lombok.jar"

local root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" })
if not root_dir then return end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fn.stdpath('data') .. '/java-workspace/' .. project_name

local cmd = {
  'java',
  '-Declipse.application=org.eclipse.jdt.ls.core.id1',
  '-Dosgi.bundles.defaultStartLevel=4',
  '-Declipse.product=org.eclipse.jdt.ls.core.product',
  '-Xms1g',
  '--add-modules=ALL-SYSTEM',
  '--add-opens', 'java.base/java.util=ALL-UNNAMED',
  '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
  '-jar', path_to_jar,
  '-configuration', jdtls_path .. '/config_linux',
  '-data', workspace_dir,
}

-- Добавляем Lombok только если файл существует
if vim.fn.filereadable(lombok_path) == 1 then
  table.insert(cmd, 3, '-javaagent:' .. lombok_path)
end

local config = {
  cmd = cmd,
  root_dir = root_dir,
  settings = {
    java = {
      eclipse = { downloadSources = true },
      maven = { downloadSources = true },
      implementationsCodeLens = { enabled = true },
      referencesCodeLens = { enabled = true },
    }
  },
  init_options = { bundles = {} },
}

jdtls.start_or_attach(config)
 ''

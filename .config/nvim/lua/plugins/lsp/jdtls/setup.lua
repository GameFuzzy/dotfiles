local M = {}

function M.setup()
  local jdtls = require 'jdtls'
  local jdtls_dap = require 'jdtls.dap'
  local jdtls_setup = require 'jdtls.setup'

  local home = vim.env.HOME
  local path_to_mason_packages = home .. '/.local/share/nvim/mason/packages'

  local root_markers = { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' }
  local root_dir = jdtls_setup.find_root(root_markers)
  local project_name = vim.fn.fnamemodify(root_dir, ':p:h:t')
  local workspace_dir = home .. '/.cache/jdtls/workspace' .. project_name

  local path_to_jdtls = path_to_mason_packages .. '/jdtls'
  local path_to_jar = vim.fn.glob(path_to_jdtls .. '/plugins/org.eclipse.equinox.launcher_*.jar')
  local path_to_lombok = path_to_jdtls .. '/lombok.jar'
  local path_to_config = path_to_jdtls .. '/config_mac'

  local path_to_jdebug = path_to_mason_packages .. '/java-debug-adapter'
  local path_to_jtest = path_to_mason_packages .. '/java-test'

  local bundles = {}
  local bundle_paths = {
    path_to_jdebug .. '/extension/server/com.microsoft.java.debug.plugin-*.jar',
    path_to_jtest .. '/extension/server/*.jar',
  }

  for _, pattern in ipairs(bundle_paths) do
    for _, bundle in ipairs(vim.fn.glob(pattern, true, true)) do
      if
        not vim.endswith(bundle, 'com.microsoft.java.test.runner-jar-with-dependencies.jar')
        and not vim.endswith(bundle, 'com.microsoft.java.test.runner.jar')
      then
        table.insert(bundles, bundle)
      end
    end
  end

  local extendedClientCapabilities = jdtls.extendedClientCapabilities
  extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

  local config = {
    flags = {
      allow_incremental_sync = true,
    },

    on_attach = function(_, bufnr)
      jdtls.setup_dap { hotcodereplace = 'auto' }
      jdtls_dap.setup_dap_main_class_configs()

      -- Create a command `:Format` local to the LSP buffer
      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
      end, { desc = 'Format current buffer with LSP' })
    end,

    init_options = {
      bundles = bundles,
      extendedClientCapabilities = extendedClientCapabilities,
    },

    capabilities = {
      workspace = {
        configuration = true,
      },
      textDocument = {
        completion = {
          completionItem = {
            snippetSupport = true,
          },
        },
      },
    },
  }

  config.cmd = {
    'java',

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '-javaagent:' .. path_to_lombok,
    '--add-modules=ALL-SYSTEM',
    '--add-opens',
    'java.base/java.util=ALL-UNNAMED',
    '--add-opens',
    'java.base/java.lang=ALL-UNNAMED',

    '-jar',
    path_to_jar,

    '-configuration',
    path_to_config,

    '-data',
    workspace_dir,
  }

  config.settings = {
    java = {
      references = {
        includeDecompiledSources = true,
      },
      format = {
        enabled = true,
        settings = {
          url = vim.fn.stdpath 'config' .. '/plugins/jdtls/styles/intellij-java-google-style.xml',
          profile = 'GoogleStyle',
        },
      },
      eclipse = {
        downloadSources = true,
      },
      maven = {
        downloadSources = true,
      },
      signatureHelp = { enabled = true },
      contentProvider = { preferred = 'fernflower' },
      -- eclipse = {
      -- 	downloadSources = true,
      -- },
      -- implementationsCodeLens = {
      -- 	enabled = true,
      -- },
      completion = {
        favoriteStaticMembers = {
          'org.hamcrest.MatcherAssert.assertThat',
          'org.hamcrest.Matchers.*',
          'org.hamcrest.CoreMatchers.*',
          'org.junit.jupiter.api.Assertions.*',
          'java.util.Objects.requireNonNull',
          'java.util.Objects.requireNonNullElse',
          'org.mockito.Mockito.*',
        },
        filteredTypes = {
          'com.sun.*',
          'io.micrometer.shaded.*',
          'java.awt.*',
          'jdk.*',
          'sun.*',
        },
        importOrder = {
          'java',
          'javax',
          'com',
          'org',
        },
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      codeGeneration = {
        toString = {
          template = '${object.className}{${member.name()}=${member.value}, ${otherMembers}}',
          -- flags = {
          -- 	allow_incremental_sync = true,
          -- },
        },
        useBlocks = true,
      },
      configuration = {
        -- runtimes = {
        --   {
        --     name = 'java-21-openjdk',
        --     path = '/opt/homebrew/Cellar/openjdk/21.0.2/',
        --   },
        -- },
      },
      -- project = {
      -- 	referencedLibraries = {
      -- 		"**/lib/*.jar",
      -- 	},
      -- },
    },
  }

  config.on_init = function(client, _)
    client.notify('workspace/didChangeConfiguration', { settings = config.settings })
  end

  -- Start Server
  jdtls.start_or_attach(config)

  -- Set Java Specific Keymaps
  require 'plugins.jdtls.keymaps'
end

return M

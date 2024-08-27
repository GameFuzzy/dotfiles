-- Modifies existing selenized colorscheme
-- See create.md and rktjmp/lush-template for more details on what can go in this file.

vim.opt.background = 'dark'
vim.g.colors_name = 'my-selenized'

local lush = require 'lush'
local selenized = require 'selenized'

local utils = require 'selenized.utils'
local c = utils.get_palette()

---@diagnostic disable: undefined-global
local spec = lush.extends({ selenized }).with(function(injected_functions)
  local sym = injected_functions.sym
  return {
    -- LspTrouble
    StatusLine { bg = c.bg_1 }, -- status line of current window

    -- TroubleIconArray { selenized['Special'], bg = c.bg_1 },
    -- TroubleIconBoolean { selenized['@boolean'], bg = c.bg_1 },
    -- TroubleIconClass { selenized['@type'], bg = c.bg_1 },
    -- TroubleIconConstant { selenized['@constant'], bg = c.bg_1 },
    -- TroubleIconConstructor { selenized['@constructor'], bg = c.bg_1 },
    -- TroubleIconDirectory { selenized['Special'], bg = c.bg_1 },
    -- TroubleIconEnum { selenized['@lsp.type.enum'], bg = c.bg_1 },
    -- TroubleIconEnumMember { selenized['@lsp.type.enumMember'], bg = c.bg_1 },
    -- TroubleIconEvent { selenized['Special'], bg = c.bg_1 },
    -- TroubleIconField { selenized['@variable.member'], bg = c.bg_1 },
    -- TroubleIconFile { selenized['Normal'], bg = c.bg_1 },
    -- TroubleIconFunction { selenized['@function'], bg = c.bg_1 },
    -- TroubleIconInterface { selenized['@lsp.type.interface'], bg = c.bg_1 },
    -- TroubleIconKey { selenized['@lsp.type.keyword'], bg = c.bg_1 },
    -- TroubleIconMethod { selenized['@function.method'], bg = c.bg_1 },
    -- TroubleIconModule { selenized['@module'], bg = c.bg_1 },
    -- TroubleIconNamespace { selenized['@module'], bg = c.bg_1 },
    -- TroubleIconNull { selenized['@constant.builtin'], bg = c.bg_1 },
    -- TroubleIconNumber { selenized['@number'], bg = c.bg_1 },
    -- TroubleIconObject { selenized['@constant'], bg = c.bg_1 },
    -- TroubleIconOperator { selenized['@operator'], bg = c.bg_1 },
    -- TroubleIconPackage { selenized['@module'], bg = c.bg_1 },
    -- TroubleIconProperty { selenized['@property'], bg = c.bg_1 },
    -- TroubleIconString { selenized['@string'], bg = c.bg_1 },
    -- TroubleIconStruct { selenized['@lsp.type.struct'], bg = c.bg_1 },
    -- TroubleIconTypeParameter { selenized['@lsp.type.typeParameter'], bg = c.bg_1 },
    -- TroubleIconVariable { selenized['@variable'], bg = c.bg_1 },

    -- TroubleIconArray { selenized['Special'], bg = c.bg_1 },
    -- TroubleIconBoolean { selenized['Boolean'], bg = c.bg_1 },
    -- TroubleIconClass { selenized['Type'], bg = c.bg_1 },
    -- TroubleIconConstant { selenized['Constant'], bg = c.bg_1 },
    -- TroubleIconConstructor { selenized['@constructor'], bg = c.bg_1 },
    -- TroubleIconDirectory { selenized['Special'], bg = c.bg_1 },
    -- TroubleIconEnum { selenized['@Structure'], bg = c.bg_1 },
    -- TroubleIconEnumMember { selenized['@variable.member'], bg = c.bg_1 },
    -- TroubleIconEvent { selenized['Special'], bg = c.bg_1 },
    -- TroubleIconField { selenized['@variable.member'], bg = c.bg_1 },
    -- TroubleIconFile { selenized['Normal'], bg = c.bg_1 },
    -- TroubleIconFunction { selenized['@function'], bg = c.bg_1 },
    -- TroubleIconInterface { selenized['Identifier'], bg = c.bg_1 },
    -- TroubleIconKey { selenized['Keyword'], bg = c.bg_1 },
    -- TroubleIconMethod { selenized['Special'], bg = c.bg_1 },
    -- TroubleIconModule { selenized['PreProc'], bg = c.bg_1 },
    -- TroubleIconNamespace { selenized['PreProc'], bg = c.bg_1 },
    -- TroubleIconNull { selenized['Constant'], bg = c.bg_1 },
    -- TroubleIconNumber { selenized['Number'], bg = c.bg_1 },
    -- TroubleIconObject { selenized['Structure'], bg = c.bg_1 },
    -- TroubleIconOperator { selenized['Operator'], bg = c.bg_1 },
    -- TroubleIconPackage { selenized['PreProc'], bg = c.bg_1 },
    -- TroubleIconProperty { selenized['@property'], bg = c.bg_1 },
    -- TroubleIconString { selenized['String'], bg = c.bg_1 },
    -- TroubleIconStruct { selenized['Structure'], bg = c.bg_1 },
    -- TroubleIconTypeParameter { selenized['Type'], bg = c.bg_1 },
    -- TroubleIconVariable { selenized['Identifier'], bg = c.bg_1 },
  }
end)

-- Pass the extended spec to lush for application
lush(spec)

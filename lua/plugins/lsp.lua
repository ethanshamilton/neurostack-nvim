return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false,
      },
      servers = {
        basedpyright = {
          settings = {
            basedpyright = {
              -- Set to "basic" for less strict checking
              typeCheckingMode = "basic", -- or "standard" or "off"

              -- Disable specific annoying diagnostics
              diagnosticMode = "openFilesOnly", -- don't check whole workspace

              -- Turn off specific rules
              disableOrganizeImports = false,
              analysis = {
                -- Ignore these specific diagnostics
                diagnosticSeverityOverrides = {
                  reportMissingTypeStubs = "none",
                  reportUnknownMemberType = "none",
                  reportUnknownArgumentType = "none",
                  reportUnknownVariableType = "none",
                  reportUnknownParameterType = "none",
                  reportMissingParameterType = "none",
                },
              },
            },
          },
        },
      },
    },
  },
}

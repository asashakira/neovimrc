return {
  "hrsh7th/nvim-cmp",
  dependencies = { "hrsh7th/cmp-emoji" },
  opts = function(_, opts)
    local cmp = require("cmp")
    table.insert(opts.sources, { name = "emoji" })
    -- table.insert(
    --   opts.mapping,
    --   cmp.mapping.preset.insert({
    --     ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
    --     ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
    --     ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    --     ["<C-f>"] = cmp.mapping.scroll_docs(4),
    --     ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
    --     ["<C-e>"] = cmp.mapping.abort(), -- close completion window
    --     ["<CR>"] = cmp.mapping.confirm({ select = false }),
    --   })
    -- )
  end,
}

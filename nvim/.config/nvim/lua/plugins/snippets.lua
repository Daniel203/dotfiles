return {
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
            local luasnip = require("luasnip")
            require("luasnip.loaders.from_vscode").lazy_load()

            luasnip.add_snippets(nil, {
                all = {
                    luasnip.snippet({
                        trig = "ttest",
                        namr = "Tokio test",
                        dscr = "Tokio test in rust"
                    }, {
                        luasnip.text_node({ "#[tokio::test]", "async fn " }),
                        luasnip.insert_node(1, "test_name"),
                        luasnip.text_node({ "() {", "    // Arrange", "", "    // Act", "", "    // Assert", "}" })
                    })
                },
            })
        end
    }
}

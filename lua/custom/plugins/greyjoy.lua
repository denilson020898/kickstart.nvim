return {
    "desdic/greyjoy.nvim",
    keys = {
        { "<Leader>gr", "<cmd>Greyjoy<CR>", desc = "[G]reyjoy [r]un" },
        { "<Leader>gt", "<cmd>GreyjoyTelescope<CR>", desc = "[G]reyjoy [t]elescope" },
        { "<Leader>gg", "<cmd>GreyjoyFzf fast<CR>", desc = "[G]reyjoy fast [g]roup" },
        { "<Leader>ge", "<cmd>Greyedit<CR>", desc = "[G]reyjoy [e]edit before run" },
    },
    dependencies = {
        { "akinsho/toggleterm.nvim" }, -- Optional
        { "nvim-lua/plenary.nvim" }, -- Optional
        { "nvim-telescope/telescope.nvim" }, -- Optional
    },
    cmd = { "Greyjoy", "Greyedit", "GreyjoyTelescope", "GreyjoyFzf" },
    config = function()
        local greyjoy = require("greyjoy")
        local condition = require("greyjoy.conditions")
        greyjoy.setup({
            output_results = require("greyjoy.terminals").term,
            -- output_results = require("greyjoy.terminals").toggleterm,
            last_first = true,
            extensions = {
                generic = {
                    commands = {
                        ["run {filename}"] = { command = { "python3", "{filename}" }, filetype = "python" },
                        ["build main.go"] = {
                            command = { "go", "build", "main.go" },
                            filetype = "go",
                            filename = "main.go",
                        },
                        ["zig build"] = {
                            command = { "zig", "build" },
                            filetype = "zig",
                        },
                        ["cmake -S . -B target"] = {
                            command = { "cmake", "-S", ".", "-B", "target" },
                            condition = function(n)
                                return condition.file_exists("CMakeLists.txt", n)
                                    and not condition.directory_exists("target", n)
                            end,
                        },
                    },
                },
                kitchen = { group_id = 2, targets = { "converge", "verify", "destroy", "test" }, include_all = false },
                docker_compose = { group_id = 3 },
                cargo = { group_id = 4 },
            },
            run_groups = { fast = { "generic", "makefile", "cargo", "docker_compose" } },
        })

        greyjoy.load_extension("cargo") -- optional
        greyjoy.load_extension("docker_compose") -- optional
        greyjoy.load_extension("generic") -- optional
        -- greyjoy.load_extension("kitchen") -- optional
        greyjoy.load_extension("makefile") -- optional
        greyjoy.load_extension("vscode_tasks") -- optional
    end,
}

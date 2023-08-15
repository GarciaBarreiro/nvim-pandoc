local function command(name, callback)
    vim.api.nvim_create_user_command(name, callback, {})
end

local pandoc = require("pandoc")

command('PandocWrite', function ()
    pandoc.write()
end)

command('PandocRead', function ()
    pandoc.read()
end)

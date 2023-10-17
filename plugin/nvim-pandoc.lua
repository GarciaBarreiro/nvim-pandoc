local function command(name, callback)
    vim.api.nvim_create_user_command(name, callback, { nargs = "?" })
end

local pandoc = require("pandoc")

command('PandocWrite', function (ext)
    pandoc.write(ext)
end)

command('PandocRead', function (ext)
    pandoc.read(ext)
end)

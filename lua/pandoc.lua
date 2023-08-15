local M = {}

local function getDocName(buf_name)
    local extension = "." .. string.match(buf_name, "[^.]+$")
    local pdf = string.gsub(buf_name, extension, ".pdf")
    return pdf
end

function M.write()
    local buf = vim.api.nvim_buf_get_name(0)
    local out = getDocName(buf)
    local command = "pandoc " .. buf .. " -o " .. out
    print(command)
    os.execute(command)
end

function M.read()
    local out = getDocName(vim.api.nvim_buf_get_name(0))
    os.execute("atril " .. out)
end

return M

local M = {}

local function getDocName(buf_name, ext)
    ext = string.match(ext.args, "^([%w]+)")    -- matches first word/returns nil if there's none
    if (ext == nil) then
        ext = "pdf"
    end
    local og_ext = string.match(buf_name, "[^.]+$")
    local doc = string.gsub(buf_name, og_ext, ext)
    return doc
end

function M.write(ext)
    local buf = vim.api.nvim_buf_get_name(0)
    local out = getDocName(buf, ext)
    local command = "pandoc " .. buf .. " -o " .. out .. " &"
    print(command)
    os.execute(command)
end

function M.read(ext)
    local out = getDocName(vim.api.nvim_buf_get_name(0), ext)
    os.execute("xdg-open " .. out .. " &")
end

return M

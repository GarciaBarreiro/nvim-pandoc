local M = {}

local J = require "plenary.job"

local function getDocName(buf_name, ext)
    ext = string.match(ext.args, "^([%w]+)")    -- matches first word/returns nil if there's none
    if (ext == nil) then
        ext = "pdf"
    end
    local og_ext = string.match(buf_name, "[^.]+$")
    local doc = string.gsub(buf_name, og_ext, ext)
    return doc
end

local function on_exit(job_id, code, _)
    if code ~= 0 then
        print(job_id:stderr_result()[1])
    end
end

function M.write(ext)
    local buf = vim.api.nvim_buf_get_name(0)
    local out = getDocName(buf, ext)
    local args = {buf, "-o", out}
    J:new({
        command = "pandoc",
        args = args,
        on_exit = on_exit,
    }):start()
end

function M.read(ext)
    local out = getDocName(vim.api.nvim_buf_get_name(0), ext)
    J:new({
        command = "xdg-open",
        args = {out},
        on_exit = on_exit,
    }):start()
end

return M

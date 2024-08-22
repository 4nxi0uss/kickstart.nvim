local function dump(o)
    if type(o) == 'table' then
        local s = '{ '

        for k, v in pairs(o) do
            if type(k) ~= 'number' then k = '"' .. k .. '"' end

            s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
        end

        return s .. '} '
    else
        return tostring(o)
    end
end

local function has_value(tab, val)
    for _, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

local function iter(str)
    local magicSigns = { '(', ')', '[', ']' };
    local res = "";

    for c in str:gmatch(".") do
        if has_value(magicSigns, c) then
            res = res .. "\\" .. c
        else
            res = res .. c
        end
    end

    return res
end

vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = { "*.html", "*.mjs", "*.js", "*.json", "*.jsx", "*.tsx" },
    callback = function(c)
        local pos = vim.fn.getpos('.')
        local current_lnum = pos[2]
        local current_col = pos[3]

        vim.api.nvim_command(":silent %!prettier " .. iter(c.file))
        vim.api.nvim_command(":call cursor(" .. current_lnum .. "," .. current_col .. ")")
    end,
    -- command = "silent %!prettierd --find-config-path %",
})

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

vim.api.nvim_create_autocmd('BufWritePost', {
    pattern = { "*.html", "*.mjs", "*.js", "*.json", "*.jsx", "*.tsx" },
    callback = function(c)
        vim.api.nvim_command(":silent %!prettierd --find-config-path " .. iter(c.file))
    end,
    -- command = "silent %!prettierd --find-config-path %",
})

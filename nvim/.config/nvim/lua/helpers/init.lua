local H = {}

-- See `:help vim.keymap.set`
H.keymap = function(mode, key, func, opts, desc)
    if desc ~= nil then
        opts.desc = desc
    end
    vim.keymap.set(mode, key, func, opts)
end

return H

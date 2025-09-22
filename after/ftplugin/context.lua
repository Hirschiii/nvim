vim.opt.foldmethod = "marker"

-- -- Define the Lua folding function
-- function MyFoldExpr()
--    -- Get the current line number
--    local line = vim.fn.getline(vim.v.lnum)
--
--    -- Start fold at 'startBuffer'
--    if string.find(line, "startbuffer") then
--       return "a1" -- Start fold
--    end
--
--    -- End fold at 'stopBuffer'
--    if string.find(line, "stopbuffer") then
--       return "s1" -- End fold
--    end
--
--    -- No folding change on other lines
--    return "="
-- end

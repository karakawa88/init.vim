local M = {}

function M.sprit(str, del) 
    local returnTable = {}
    for v in string.gmatch(str, "([^" .. del .. "]+)")
    do
        returnTable[#returnTable+1] = v
    end
    return returnTable
end
return M

local class = require("library/classic/classic")
local object = class:extend()

function object:new()

end

function object.load()
    local object_files = {}
    object_files = recursiveEnumerate('Objects', object_files)
    requireFiles(object_files)
end

return object
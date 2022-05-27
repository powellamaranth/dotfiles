local obj = {}
obj.__index = obj

obj.name = "SpacesInit"

function obj:start()
  local screen_uuid = hs.screen.primaryScreen():getUUID()
  local spaces = hs.spaces.allSpaces()

  for i = 1,9,1 do
    if spaces and not spaces[screen_uuid][i] then
      hs.spaces.addSpaceToScreen(screen_uuid)
    end
  end
end

return obj

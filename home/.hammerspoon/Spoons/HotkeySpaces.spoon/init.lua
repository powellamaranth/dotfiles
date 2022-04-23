local obj = {}
obj.__index = obj

-- Metadata
obj.name = "HotkeySpaces"
obj.version = "1.0"
obj.author = "Daniel Gatis <danielgatis@gmail.com>"
obj.license = "MIT - https://opensource.org/licenses/MIT"

function obj:start()
  local screen_uuid = hs.screen.primaryScreen():getUUID()
  local spaces = hs.spaces.allSpaces()

  for i = 1,9,1 do
    if not spaces[screen_uuid][i] then
      hs.spaces.addSpaceToScreen(screen_uuid)
    end
  end

  function set_spaces_hotkeys()
    local spaces = hs.spaces.allSpaces()

    for i = 1,9,1 do
      local space_id = spaces[screen_uuid][i]

      hs.hotkey.deleteAll({"alt"}, tostring(i))
      hs.hotkey.bind({"alt"}, tostring(i), function()
        if space_id then
          hs.spaces.gotoSpace(space_id)
          return
        end

        hs.spaces.addSpaceToScreen(screen_uuid)
        local spaces = hs.spaces.allSpaces()[screen_uuid]
        hs.spaces.gotoSpace(spaces[#spaces])
      end)
    end
  end

  set_spaces_hotkeys()
  local watcher = hs.spaces.watcher.new(set_spaces_hotkeys)
  watcher:start()

  return watcher
end

return obj

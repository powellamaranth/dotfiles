hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

-- Spaces hotkeys
function set_spaces_hotkeys()
  local main_screen_uuid = hs.screen.mainScreen():getUUID()
  local spaces = hs.spaces.allSpaces()

  for i = 1,9,1 do
    local space_id = spaces[main_screen_uuid][i]

    hs.hotkey.deleteAll({"cmd"}, tostring(i))
    hs.hotkey.bind({"cmd"}, tostring(i), function()
      if space_id then
        hs.spaces.gotoSpace(space_id)
        return
      end

      hs.spaces.addSpaceToScreen(main_screen_uuid)
      local spaces = hs.spaces.allSpaces()[main_screen_uuid]
      hs.spaces.gotoSpace(spaces[#spaces])
    end)
  end
end

set_spaces_hotkeys()
hs.spaces.watcher.new(set_spaces_hotkeys):start()

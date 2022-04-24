local obj = {}
obj.__index = obj

obj.name = "AlacrityHotkey"

function obj:start()
  hs.hotkey.bind({"ctrl"}, "return", function()
    hs.application.enableSpotlightForNameSearches(true)
    hs.application.launchOrFocus("Alacritty")
  end)
end

return obj

hs.hotkey.bind({ "ctrl", "alt", "cmd" }, "g", function()
	local app = hs.application.get("Alacritty")

	if not app then
		hs.application.launchOrFocus("Alacritty")
		hs.timer.doAfter(0.1, function()
			hs.eventtap.keyStroke({ "cmd" }, "n")
		end)
		return
	end

	app:activate()
	hs.timer.doAfter(0.1, function()
		hs.eventtap.keyStroke({ "cmd" }, "n")
	end)
end)

hs.hotkey.bind({ "ctrl", "alt", "cmd" }, "n", function()
	local app = hs.application.get("Alacritty")

	if not app then
		hs.application.launchOrFocus("Alacritty")
		hs.timer.doAfter(0.1, function()
			hs.eventtap.keyStroke({ "cmd" }, "n")
			hs.timer.doAfter(0.1, function()
				hs.eventtap.keyStrokes("nvim")
				hs.eventtap.keyStroke({}, "return")
			end)
		end)
		return
	end

	app:activate()
	hs.timer.doAfter(0.1, function()
		hs.eventtap.keyStroke({ "cmd" }, "n")
		hs.timer.doAfter(0.1, function()
			hs.eventtap.keyStrokes("nvim")
			hs.eventtap.keyStroke({}, "return")
		end)
	end)
end)

hs.hotkey.bind({ "ctrl", "alt", "cmd" }, "z", function()
	hs.execute("open -a Zen")
end)

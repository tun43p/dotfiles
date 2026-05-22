hs.hotkey.bind({ "ctrl", "alt", "cmd" }, "g", function()
	local app = hs.application.get("Ghostty")

	if not app then
		hs.application.launchOrFocus("Ghostty")
		hs.timer.doAfter(0.8, function()
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
	local app = hs.application.get("Ghostty")

	if not app then
		hs.application.launchOrFocus("Ghostty")
		hs.timer.doAfter(0.8, function()
			hs.eventtap.keyStroke({ "cmd" }, "n")
			hs.eventtap.keyStrokes("nvim")
			hs.eventtap.keyStroke({}, "return")
		end)
		return
	end

	app:activate()

	hs.timer.doAfter(0.1, function()
		hs.eventtap.keyStroke({ "cmd" }, "n")
		hs.eventtap.keyStrokes("nvim")
		hs.eventtap.keyStroke({}, "return")
	end)
end)

hs.hotkey.bind({ "ctrl", "alt", "cmd" }, "z", function()
	hs.execute("open -a Zen")
end)

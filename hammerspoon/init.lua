-- Launch kitty
hs.hotkey.bind({ "ctrl", "alt", "cmd" }, "k", function()
	local app = hs.application.get("kitty")

	if not app then
		hs.application.launchOrFocus("kitty")
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

-- Launch Visual Studio Code
hs.hotkey.bind({ "ctrl", "alt", "cmd" }, "c", function()
	hs.execute("open -a 'Visual Studio Code'")
end)

-- Launch Neovim
hs.hotkey.bind({ "ctrl", "alt", "cmd" }, "n", function()
	local app = hs.application.get("kitty")

	if not app then
		hs.application.launchOrFocus("kitty")
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

-- Launch Wiki
hs.hotkey.bind({ "ctrl", "alt", "cmd" }, "w", function()
	local app = hs.application.get("kitty")

	if not app then
		hs.application.launchOrFocus("kitty")
		hs.timer.doAfter(0.1, function()
			hs.eventtap.keyStroke({ "cmd" }, "n")
			hs.timer.doAfter(0.1, function()
				hs.eventtap.keyStrokes("nvim ~/.wiki/index.md")
				hs.eventtap.keyStroke({}, "return")
			end)
		end)
		return
	end

	app:activate()
	hs.timer.doAfter(0.1, function()
		hs.eventtap.keyStroke({ "cmd" }, "n")
		hs.timer.doAfter(0.1, function()
			hs.eventtap.keyStrokes("nvim ~/.wiki/index.md")
			hs.eventtap.keyStroke({}, "return")
		end)
	end)
end)

-- Launch Zen
hs.hotkey.bind({ "ctrl", "alt", "cmd" }, "z", function()
	hs.execute("open -a Zen")
end)

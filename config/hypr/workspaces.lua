for i = 1, 10 do
	if i % 2 == 0 then
		hl.workspace_rule({ workspace = tostring(i), monitor = "DP-2", layout = "dwindle" })
	else
		hl.workspace_rule({ workspace = tostring(i), monitor = "DP-1", layout = "master" })
	end
end


function table.append_all(list, t)
	if t then
		for _, v in pairs(t) do
			table.insert(list, v)
		end
	end
end

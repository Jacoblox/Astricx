local API = require(script.Parent:WaitForChild('Properties API')) or loadstring(game:HttpGet("https://anaminus.github.io/rbx/json/api/latest.json"))()

return function(object)
	local cn = object.ClassName
	local properties = {}
	
	local decoded = game:GetService('HttpService'):JSONDecode(API)
	
	for i,v in pairs(decoded) do
		local isPropertyType = v.type == "Property"
		local isObjectProperty = v.Class == cn
		
		if isPropertyType and isObjectProperty then
			if not pcall(function()
				return object[v.Name]
			end) then return end
			properties[v.Name] = object[v.Name]
		end
	end
	
	return properties
end

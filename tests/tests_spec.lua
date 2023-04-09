describe("some func", function()
	local func = require("{{plugin-short-name}}")

	it("Standard Case", function()
		local out = "value"
		assert.equals("value", out)
	end)

end)

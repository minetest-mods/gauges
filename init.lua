if minetest.settings:get_bool("health_bars") == false
or not minetest.settings:get_bool("enable_damage") then
	return
end

local v_dist = vector.distance

minetest.register_entity("gauges:hp_bar", {
	visual = "sprite",
	visual_size = {x = 1, y = 0.0625, z = 1}, -- Y value is (1 / 16) * 1
	textures = {"blank.png"}, -- The texture is changed later in the code
	collisionbox = {0},
	physical = false,

	on_step = function(self)
		local wielder = self.wielder and self.wielder

		if not wielder or v_dist(wielder:get_pos(), self.object:get_pos()) > 3 then
			self.object:remove()
			return
		end

		local hp = wielder:get_hp() <= 20 and wielder:get_hp() or 20
		local breath = wielder:get_breath() <= 10 and wielder:get_breath() or 11

		if self.hp ~= hp or self.breath ~= breath then
			self.object:set_properties({
				textures = {
					"health_" .. tostring(hp) .. ".png^" ..
					"breath_" .. tostring(breath) .. ".png"
				}
			})
			self.hp = hp
			self.breath = breath
		end
	end
})

local function add_gauge(player)
	local ent = minetest.add_entity(player:get_pos(), "gauges:hp_bar")

	ent:set_attach(player, "", {x = 0, y = 19, z = 0}, {x = 0, y = 0, z = 0})
	ent:get_luaentity().wielder = player
end

minetest.register_on_joinplayer(function(player)
	minetest.after(1, add_gauge, player)
end)

-- gauges: Adds health/breath bars above players
--
-- Copyright © 2014-2020 4aiman, Hugo Locurcio and contributors - MIT License
-- See `LICENSE.md` included in the source distribution for details.

local enabled = minetest.settings:get_bool("health_bars") ~= false
if enabled then
	enabled = minetest.settings:get_bool("enable_damage")
end

-- Localize this functions for better performance,
-- as it's called on every step
local vector_distance = vector.distance
local min = math.min
local max_breath = minetest.PLAYER_MAX_BREATH_DEFAULT or 11

local mt_5 = minetest.features.object_independent_selectionbox

local function add_gauge(player)
	if player and player:is_player() then
		local entity = minetest.add_entity(player:get_pos(), "gauges:hp_bar")

		-- Check Minetest version and set required entity heigh
		-- (The entity height offset was changed in Minetest 5.0.0)
		local height = mt_5 and 19 or 9

		entity:set_attach(player, "", {x=0, y=height, z=0}, {x=0, y=0, z=0})
		entity:get_luaentity().wielder = player
	end
end

minetest.register_entity("gauges:hp_bar", {
	visual = "sprite",
	visual_size = {x=1, y=1/16, z=1},
	textures = {"blank.png"},
	collisionbox = {0},
	physical = false,

	on_step = function(self)
		local player = self.wielder
		local gauge = self.object

		if not enabled or
				not player or not player:is_player() then
			gauge:remove()
			return
		elseif vector_distance(player:get_pos(), gauge:get_pos()) > 3 then
			gauge:remove()
			add_gauge(player)
			return
		end

		local hp = min(player:get_hp(), 20)
		local breath = min(player:get_breath(), max_breath)

		if self.hp ~= hp or self.breath ~= breath then
			local health_t = "health_"..hp..".png"
			local breath_t = "breath_"..breath..".png"

			if hp == 0 then
				health_t = "blank.png"
			end

			if breath == max_breath then
				breath_t = "blank.png"
			end

			gauge:set_properties({
				textures = {health_t.."^"..breath_t}
			})
			self.hp = hp
			self.breath = breath
		end
	end
})

if enabled then
	minetest.register_on_joinplayer(function(player)
		minetest.after(1, add_gauge, player)
	end)
end

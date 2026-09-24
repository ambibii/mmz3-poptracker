-- entry point for all lua code of the pack
-- more info on the lua API: https://github.com/black-sliver/PopTracker/blob/master/doc/PACKS.md#lua-interface
ENABLE_DEBUG_LOG = true
-- get current variant
local variant = Tracker.ActiveVariantUID
-- check variant info
IS_ITEMS_ONLY = variant:find("itemsonly")

print("-- Example Tracker --")
print("Loaded variant: ", variant)
if ENABLE_DEBUG_LOG then
    print("Debug logging is enabled!")
end

-- Utility Script for helper functions etc.
ScriptHost:LoadScript("scripts/utils.lua")

-- Logic
ScriptHost:LoadScript("scripts/logic/logic.lua")

-- Custom Items
ScriptHost:LoadScript("scripts/custom_items/class.lua")
ScriptHost:LoadScript("scripts/custom_items/progressiveTogglePlus.lua")
ScriptHost:LoadScript("scripts/custom_items/progressiveTogglePlusWrapper.lua")

-- Items
Tracker:AddItems("items/items.jsonc")

if not IS_ITEMS_ONLY then -- <--- use variant info to optimize loading
    -- Maps
    Tracker:AddMaps("maps/maps.jsonc")
    -- Locations
    --Tracker:AddLocations("locations/locations.jsonc")
    Tracker:AddLocations("locations/areax.jsonc")
    Tracker:AddLocations("locations/desert.jsonc")
    Tracker:AddLocations("locations/elevator.jsonc")
    Tracker:AddLocations("locations/energy.jsonc")
    Tracker:AddLocations("locations/forest.jsonc")
    Tracker:AddLocations("locations/ice_base.jsonc")
    Tracker:AddLocations("locations/library.jsonc")
    Tracker:AddLocations("locations/missile.jsonc")
    Tracker:AddLocations("locations/oceanic.jsonc")
    Tracker:AddLocations("locations/research.jsonc")
    Tracker:AddLocations("locations/residential.jsonc")
    Tracker:AddLocations("locations/resistance.jsonc")
    Tracker:AddLocations("locations/snowy.jsonc")
    Tracker:AddLocations("locations/spacecraft.jsonc")
    Tracker:AddLocations("locations/subarcadia.jsonc")
    Tracker:AddLocations("locations/volcano.jsonc")
    Tracker:AddLocations("locations/wr_factory.jsonc")
end

-- Layout
Tracker:AddLayouts("layouts/items.jsonc")
Tracker:AddLayouts("layouts/tracker.jsonc")
Tracker:AddLayouts("layouts/broadcast.jsonc")

-- AutoTracking for Poptracker
if PopVersion and PopVersion >= "0.18.0" then
    ScriptHost:LoadScript("scripts/autotracking.lua")
end

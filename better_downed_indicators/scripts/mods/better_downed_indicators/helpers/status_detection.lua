local PlayerUnitStatus = require("scripts/utilities/attack/player_unit_status")

local Status = {}

local function _health_ext(unit)
    return unit
        and ScriptUnit.has_extension(unit, "health_system")
        and ScriptUnit.extension(unit, "health_system")
        or nil
end

local function _uds(unit)
    local uds = unit
        and ScriptUnit.has_extension(unit, "unit_data_system")
        and ScriptUnit.extension(unit, "unit_data_system")
        or nil
    return (uds and uds.read_component) and uds or nil
end

local function _inventory(unit)
    local uds = _uds(unit)
    return uds and uds:read_component("inventory") or nil
end

local function _visual_loadout(unit)
    return unit
        and ScriptUnit.has_extension(unit, "visual_loadout_system")
        and ScriptUnit.extension(unit, "visual_loadout_system")
        or nil
end

local function _minigame_state(unit)
    local uds = _uds(unit)
    return uds and uds:read_component("minigame_character_state") or nil
end

local function _scanning_component(unit)
    local uds = _uds(unit)
    return uds and uds:read_component("scanning") or nil
end

local function _weapon_action_component(unit)
    local uds = _uds(unit)
    return uds and uds:read_component("weapon_action") or nil
end

local function _interaction_component(unit)
    local uds = _uds(unit)
    return uds and uds:read_component("interaction") or nil
end

function Status.for_unit(unit)
    if not unit or not HEALTH_ALIVE[unit] then
        return "dead"
    end

    local he = _health_ext(unit)
    if not (he and he.is_alive and he:is_alive()) then
        return "dead"
    end

    local uds = _uds(unit)
    local ds = uds and uds:read_component("disabled_character_state") or nil
    if ds and ds.is_disabled and ds.disabling_type ~= "none" then
        local dtype = ds.disabling_type
        return dtype == "vortex_grabbed" and "consumed" or dtype
    end

    local cs = uds and uds:read_component("character_state") or nil
    if cs then
        local sname = cs.state_name
        if sname == "hogtied" or sname == "knocked_down" or sname == "ledge_hanging" then
            return sname
        end
    end

    local inventory = _inventory(unit)
    if inventory and inventory.wielded_slot == "slot_device" then
        return "auspex"
    end

    local interaction_status = nil
    local interaction_mod = get_mod("better_downed_indicators")
    if interaction_mod and interaction_mod._interaction_active_units and interaction_mod._interaction_active_units[unit] then
        local interaction_data = interaction_mod._interaction_active_units[unit]
        local interaction_type = interaction_data.type
        if interaction_type == "health_station" then
            interaction_status = "healing"
        elseif interaction_type == "revive" or interaction_type == "remove_net" or interaction_type == "pull_up" or interaction_type == "rescue" then
            interaction_status = "helping"
        elseif interaction_type then
            local InteractionSettings = require("scripts/settings/interaction/interaction_settings")
            local interaction_templates = require("scripts/settings/interaction/interaction_templates")
            local template = interaction_templates[interaction_type]
            if template and template.duration and template.duration > 0 then
                interaction_status = "interacting"
            end
        end
    end

    local interaction_component = _interaction_component(unit)
    if not interaction_status and interaction_component then
        local InteractionSettings = require("scripts/settings/interaction/interaction_settings")
        local interaction_states = InteractionSettings.states
        local state = interaction_component.state
        if state == interaction_states.is_interacting then
            local interaction_type = interaction_component.type
            if interaction_type == "health_station" then
                interaction_status = "healing"
            elseif interaction_type == "revive" or interaction_type == "remove_net" or interaction_type == "pull_up" or interaction_type == "rescue" then
                interaction_status = "helping"
            elseif interaction_type then
                local interaction_templates = require("scripts/settings/interaction/interaction_templates")
                local template = interaction_templates[interaction_type]
                if template and template.duration and template.duration > 0 then
                    interaction_status = "interacting"
                end
            end
        end
    end

    if interaction_status then
        return interaction_status
    end

    if inventory and inventory.wielded_slot == "slot_luggable" then
        return "luggable"
    end

    return nil
end

Status.icons_glowing = {
    pounced = "content/ui/materials/mission_board/circumstances/hunting_grounds_01",
    warp_grabbed = "content/ui/materials/icons/circumstances/havoc/havoc_mutator_heinous_rituals",
    consumed = "content/ui/materials/mission_board/circumstances/nurgle_manifestation_01",
    grabbed = "content/ui/materials/mission_board/circumstances/nurgle_manifestation_01",
    knocked_down = "content/ui/materials/mission_board/circumstances/maelstrom_01",
    netted = "content/ui/materials/mission_board/circumstances/special_waves_01",
    ledge_hanging = "content/ui/materials/mission_board/circumstances/maelstrom_01",
    mutant_charged = "content/ui/materials/mission_board/circumstances/less_resistance_01",
    dead = "content/ui/materials/mission_board/circumstances/maelstrom_02",
    respawning = "content/ui/materials/mission_board/circumstances/maelstrom_02",
    hogtied = "content/ui/materials/mission_board/circumstances/maelstrom_02",
    auspex = "content/ui/materials/icons/pocketables/hud/auspex_scanner",
    luggable = "content/ui/materials/icons/player_states/lugged",
    healing = "content/ui/materials/hud/interactions/icons/respawn",
    helping = "content/ui/materials/hud/interactions/icons/help",
    interacting = "content/ui/materials/hud/interactions/icons/objective_side",
}

Status.icons = {
    pounced = "content/ui/materials/icons/circumstances/hunting_grounds_01",
    warp_grabbed = "content/ui/materials/icons/circumstances/havoc/havoc_mutator_heinous_rituals",
    consumed = "content/ui/materials/icons/circumstances/nurgle_manifestation_01",
    grabbed = "content/ui/materials/icons/circumstances/nurgle_manifestation_01",
    knocked_down = "content/ui/materials/icons/circumstances/maelstrom_01",
    netted = "content/ui/materials/icons/circumstances/special_waves_01",
    ledge_hanging = "content/ui/materials/icons/circumstances/maelstrom_01",
    mutant_charged = "content/ui/materials/icons/circumstances/less_resistance_01",
    dead = "content/ui/materials/icons/player_states/dead",
    respawning = "content/ui/materials/icons/player_states/dead",
    hogtied = "content/ui/materials/hud/interactions/icons/environment_alert",
    auspex = "content/ui/materials/icons/pocketables/hud/auspex_scanner",
    luggable = "content/ui/materials/icons/player_states/lugged",
    healing = "content/ui/materials/hud/interactions/icons/respawn",
    helping = "content/ui/materials/hud/interactions/icons/help",
    interacting = "content/ui/materials/hud/interactions/icons/objective_side",
}

return Status

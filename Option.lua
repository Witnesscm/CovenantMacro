local ADDON, ns = ...
local Addon = ns.Addon
local L = ns.L
local AceConfigRegistry = LibStub("AceConfigRegistry-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")
local Option = Addon:NewModule("Option")

local ipairs = ipairs
local format = string.format

function Option:Get(key, global)
	return global and Addon.db.global[key] or Addon.db.profile[key]
end

function Option:Set(key, value, global)
	if global then
		Addon.db.global[key] = value
	else
		Addon.db.profile[key] = value
	end
end

function Option:Set_MacroName(key, value)
	if InCombatLockdown() then
		Addon:Error(ERR_NOT_IN_COMBAT)
		return
	end

	if not value or value == "" then
		return
	end

	if Addon:Macro_Rename(Addon.db.global[key], value) then
		Addon.db.global[key] = value
	end
end

function Option:Set_MacroBody(key, value)
	if InCombatLockdown() then
		Addon:Error(ERR_NOT_IN_COMBAT)
		return
	end

	if value and strlenutf8(value) > 255 then
		Addon:Error(L["Macro command exceeds 255 characters"])
		return
	end

	Addon.db.profile[key] = value
	Addon:UpdateMacros(key)
end

function Option:Get_MacroIcon(type)
	local _, icon = GetMacroInfo(Addon.db.global[type.."Macro"])

	return icon or 134400
end

function Option:PickupMacro(type)
	if InCombatLockdown() then
		Addon:Error(ERR_NOT_IN_COMBAT)
		return
	end

	local name = Addon.db.global[type.."Macro"]
	local index = GetMacroIndexByName(name)
	if index and index > 0 then
		PickupMacro(index)
	else
		local covenant = Addon.CovenantID and Addon.CovenantID > 0 and ns.CovenantMap[Addon.CovenantID]
		if covenant then
			Addon:Macro_Refresh(name, Addon.db.profile[covenant..type])
			PickupMacro(GetMacroIndexByName(name))
		end
	end
end

function Option:GetMacroOptions(index, type)
	local options = {
		order = index,
		type = "group",
		args = {
			Name = {
				order = 1,
				name = L["Macro Name"],
				type = "input",
				get = function() return Option:Get(type.."Macro", true) end,
				set = function(_, value) Option:Set_MacroName(type.."Macro", value) end,
			},
			Icon = {
				order = 2,
				name = "",
				type = "execute",
				width = .5,
				image = function() return Option:Get_MacroIcon(type) end,
				imageWidth = 36,
				imageHeight = 36,
				func = function() Option:PickupMacro(type) end
			}
		}
	}

	for id, covenant in ipairs(ns.CovenantMap) do
		options.args[covenant..type] = {
			order = id + 10,
			name = L[covenant],
			type = "input",
			width = 2.5,
			multiline = 6,
			set = function(info, value) Option:Set_MacroBody(info[#info], value) end,
		}
	end

	return options
end

ns.Options = {
	type = "group",
	name = format("%s  v%s", ADDON, ns.Version),
	childGroups = "tab",
	get = function(info) return Option:Get(info[#info]) end,
	set = function(info, value) Option:Set(info[#info], value) end,
	args = {}
}

function Option:OnEnable()
	for i, type in ipairs(ns.AbilityTypes) do
		ns.Options.args[type] = Option:GetMacroOptions(i, type)
		ns.Options.args[type].name = L[type.." Ability"]
		ns.Options.args[type].args.Reset = {
			order = 3,
			name = RESET,
			type = "execute",
			confirm = true,
			confirmText = L["Reset all macros to defaults."],
			func = function()
				if InCombatLockdown() then Addon:Error(ERR_NOT_IN_COMBAT) return end
				Addon:InitSettings(type)
				Addon:UpdateMacros()
			end
		}
	end

	ns.Options.args["Custom"] = {
		order = 30,
		name = "+",
		type = "group",
		args = {
			Line = {
				order = 0,
				name = CUSTOM.." "..MACRO,
				type = "header",
			}
		}
	}

	for i = 1, ns.NUM_CUSTOM do
		ns.Options.args["Custom"..i] = Option:GetMacroOptions(i + 10, "Custom"..i)
		ns.Options.args["Custom"..i].name = CUSTOM.." "..i
		ns.Options.args["Custom"..i].hidden = function() return not Option:Get("Custom"..i) end

		ns.Options.args["Custom"].args["Custom"..i] = {
			order = i,
			name = CUSTOM.." "..i,
			type = "toggle",
			set = function(info, value)
				Option:Set(info[#info], value)
				Addon:UpdateMacros()
			end,
		}
	end

	AceConfigRegistry:RegisterOptionsTable(ADDON, ns.Options)
	AceConfigDialog:AddToBlizOptions(ADDON, ADDON)
end
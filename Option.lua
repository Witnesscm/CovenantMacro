local ADDON, ns = ...
local Addon = ns.Addon
local L = ns.L
local AceConfigRegistry = LibStub("AceConfigRegistry-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")
local Option = Addon:NewModule("Option")

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
	Addon:UpdateMacros(nil, key)
end

ns.Options = {
	type = "group",
	name = ADDON,
	childGroups = "tab",
	get = function(info) return Option:Get(info[#info]) end,
	set = function(info, value) Option:Set(info[#info], value) end,
	args = {},
}

function Option:OnEnable()
	for i, type in ipairs(ns.AbilityTypes) do
		ns.Options.args[type] = {
			order = i,
			name = L[type.." Ability"],
			type = "group",
			childGroups = "select",
			args = {
				Space1 = {
					order = 2,
					name = " ",
					type = "description",
					width = .5,
				},
				Reset = {
					order = 3,
					name = L["Reset All"],
					type = "execute",
					confirm = true,
					confirmText = L["Reset all macros to defaults."],
					func = function()
						if InCombatLockdown() then Addon:Error(ERR_NOT_IN_COMBAT) return end
						Addon:InitSettings(true)
						Addon:UpdateMacros(true)
					end
				},
				Space2 = {
					order = 4,
					name = " ",
					type = "description",
					width = "full",
				},
			},
		}

		ns.Options.args[type].args[type.."Macro"] = {
			order = 1,
			name = L["Macro Name"],
			type = "input",
			get = function(info) return Option:Get(info[#info], true) end,
			set = function(info, value) Option:Set_MacroName(info[#info], value) end,
		}

		local order = 5
		for _, covenant in ipairs(ns.CovenantMap) do
			ns.Options.args[type].args[covenant..type] = {
				order = order,
				name = L[covenant],
				type = "input",
				width = 2.5,
				multiline = 6,
				set = function(info, value) Option:Set_MacroBody(info[#info], value) end,
			}

			order = order + 1
		end
	end

	AceConfigRegistry:RegisterOptionsTable(ADDON, ns.Options)
	AceConfigDialog:AddToBlizOptions(ADDON, ADDON)
end
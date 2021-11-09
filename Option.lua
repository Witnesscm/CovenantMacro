local ADDON, ns = ...
local Addon = ns.Addon
local L = ns.L
local AceConfigRegistry = LibStub("AceConfigRegistry-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")
local Option = Addon:NewModule("Option")

local function get_function(info)
	return Addon.db.profile[info[#info]]
end

local function set_function(info, val)
	if InCombatLockdown() then Addon:ErrorMessage(ERR_NOT_IN_COMBAT) return end

	local key = info[#info]
	Addon.db.profile[key] = val
	Addon:UpdateMacros(nil, key)
end

local function macro_get_function(info)
	return Addon.db.global[info[#info]]
end

local function macro_set_function(info, val)
	if InCombatLockdown() then Addon:ErrorMessage(ERR_NOT_IN_COMBAT) return end

	local key = info[#info]
	if Addon:Macro_Rename(Addon.db.global[key], val) then
		Addon.db.global[key] = val
	end
end

local options = {
	type = "group",
	name = ADDON,
	childGroups = "tab",
	get = get_function,
	set = set_function,
	args = {
		Signature = {
			order = 1,
			name = L["Signature Ability"],
			type = "group",
			childGroups = "select",
			args = {
				SignatureMacro = {
					order = 1,
					name = L["Macro Name"],
					type = "input",
					get = macro_get_function,
					set = macro_set_function,
				},
				Space1 = {
					order = 2,
					name = " ",
					type = "description",
					width = .5,
				},
				button = {
					order = 3,
					name = L["Reset All"],
					type = "execute",
					confirm = true,
					confirmText = L["Reset all macros to defaults."],
					func = function()
						if InCombatLockdown() then Addon:ErrorMessage(ERR_NOT_IN_COMBAT) return end
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
				KyrianSignature = {
					order = 5,
					name = L["Kyrian"],
					type = "input",
					width = 2.5,
					multiline = 6,
				},
				VenthyrSignature = {
					order = 6,
					name = L["Venthyr"],
					type = "input",
					width = 2.5,
					multiline = 6,
				},
				NightFaeSignature = {
					order = 7,
					name = L["Night Fae"],
					type = "input",
					width = 2.5,
					multiline = 6,
				},
				NecrolordSignature = {
					order = 8,
					name = L["Necrolord"],
					type = "input",
					width = 2.5,
					multiline = 6,
				},
			},
		},
		Class = {
			order = 2,
			name = L["Class Ability"],
			type = "group",
			childGroups = "select",
			args = {
				ClassMacro = {
					order = 1,
					name = L["Macro Name"],
					type = "input",
					get = macro_get_function,
					set = macro_set_function,
				},
				Space1 = {
					order = 2,
					name = " ",
					type = "description",
					width = .5,
				},
				button = {
					order = 3,
					name = L["Reset All"],
					type = "execute",
					confirm = true,
					confirmText = L["Reset all macros to defaults."],
					func = function()
						if InCombatLockdown() then Addon:ErrorMessage(ERR_NOT_IN_COMBAT) return end
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
				KyrianClass = {
					order = 5,
					name = L["Kyrian"],
					type = "input",
					width = 2.5,
					multiline = 6,
				},
				VenthyrClass = {
					order = 6,
					name = L["Venthyr"],
					type = "input",
					width = 2.5,
					multiline = 6,
				},
				NightFaeClass = {
					order = 7,
					name = L["Night Fae"],
					type = "input",
					width = 2.5,
					multiline = 6,
				},
				NecrolordClass = {
					order = 8,
					name = L["Necrolord"],
					type = "input",
					width = 2.5,
					multiline = 6,
				},
			},
		},
	},
}

function Option:OnEnable()
	AceConfigRegistry:RegisterOptionsTable(ADDON, options)
	AceConfigDialog:AddToBlizOptions(ADDON, ADDON)
end
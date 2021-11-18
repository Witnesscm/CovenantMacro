local ADDON, ns = ...
local Addon = LibStub("AceAddon-3.0"):NewAddon(ADDON, "AceEvent-3.0")

local L = {}
setmetatable(L, {
	__index = function(self, key) return key end
})

ns.Addon = Addon
ns.L = L
ns.Version = GetAddOnMetadata(ADDON, "Version")
ns.MyClass = select(2, UnitClass("player"))
ns.NUM_CUSTOM = 5

_G[ADDON] = ns

local defaults = {
	global = {
		SignatureMacro = "CMSignature",
		ClassMacro = "CMClass",
	},
	profile = {

	}
}

function Addon:OnInitialize()
	for i = 1, ns.NUM_CUSTOM do
		local custom = "Custom"..i
		defaults.global[custom.."Macro"] = "CM"..custom
		defaults.profile[custom] = false
	end

	self.db = LibStub("AceDB-3.0"):New("CovenantMacroDB", defaults)
end

function Addon:Print(...)
	_G.DEFAULT_CHAT_FRAME:AddMessage("|cFF70B8FF"..ADDON..":|r " .. format(...))
end

function Addon:Error(...)
	_G.UIErrorsFrame:AddMessage("|cFF70B8FF"..format(...).."|r ")
end
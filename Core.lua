local _, ns = ...
local Addon = ns.Addon
local L = ns.L

local ipairs = ipairs
local strmatch = string.match

local defaultMacro = "#showtooltip\n/cast %s"

function Addon:Macro_Refresh(name, body)
	if not GetMacroInfo(name) then
		if GetNumMacros() >= 120 then
			Addon:Print(L["The number of General Macros has reached the upper limit."])
		else
			CreateMacro(name, "INV_MISC_QUESTIONMARK", body, nil)
			Addon:Print(L["Macro %s has been created."], name)
		end
	else
		EditMacro(name, nil, "INV_MISC_QUESTIONMARK", body)
	end
end

function Addon:Macro_Rename(old, new)
	if old == new then return end

	if GetMacroInfo(new) then
		Addon:Error(L["Macro %s already exists, please enter another name."], new)
		return
	end

	local index = GetMacroIndexByName(old)
	if index then
		EditMacro(index, new, nil, GetMacroBody(index))
		Addon:Print(L["Macro %s has been renamed to %s."], old, new)
		return true
	end
end

function Addon:UpdateMacros(notify, key)
	if InCombatLockdown() then
		self:RegisterEvent("PLAYER_REGEN_ENABLED")
		return
	end

	local covenant = self.CovenantID and self.CovenantID > 0 and ns.CovenantMap[self.CovenantID]
	if covenant then
		if key and not strmatch(key, covenant) then return end

		for _, type in ipairs(ns.AbilityTypes) do
			Addon:Macro_Refresh(self.db.global[type.."Macro"], self.db.profile[covenant..type])
		end

		if notify or key then
			Addon:Print(L["Macros has been updated."])
		end
	end
end

function Addon:InitSettings(force)
	for id, covenant in ipairs(ns.CovenantMap) do
		for _, type in ipairs(ns.AbilityTypes) do
			if force or self.db.profile[covenant..type] == "" then
				local spellID = type == "Signature" and ns.SignatureAbilities[id] or self.ClassAbilities[id]
				self.db.profile[covenant..type] = format(defaultMacro, GetSpellInfo(spellID))
			end
		end
	end
end

function Addon:OnEnable()
	self.CovenantID = C_Covenants.GetActiveCovenantID()
	self.ClassAbilities = ns.ClassAbilities[ns.MyClass]

	self:InitSettings()
	self:UpdateMacros()
	self:RegisterEvent("COVENANT_CHOSEN")
end

function Addon:COVENANT_CHOSEN(_, id)
	self.CovenantID = id or C_Covenants.GetActiveCovenantID()
	self:UpdateMacros(true)
end

function Addon:PLAYER_REGEN_ENABLED()
	self:UpdateMacros()
	self:UnregisterEvent("PLAYER_REGEN_ENABLED")
end
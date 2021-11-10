local _, ns = ...
local L = ns.L

local locale = GetLocale()
if locale == "zhCN" then
	L["Signature Ability"] = "标志技能"
	L["Class Ability"] = "职业技能"
	L["Macro Name"] = "宏名称"
	L["Kyrian"] = "格里恩"
	L["Venthyr"] = "温西尔"
	L["Night Fae"] = "法夜"
	L["Necrolord"] = "通灵领主"
	L["Reset All"] = "重置全部"
	L["Reset all macros to defaults."] = "重置所有宏命令到预设值。"
	L["Macro %s has been created."] = "宏 %s 已创建。"
	L["Macros has been updated."] = "宏已更新。"
	L["Macro %s already exists, please enter another name."] = "宏 %s 已存在, 请输入其他名称。"
	L["Macro %s has been renamed to %s."] = "宏 %s 更名为 %s。"
	L["The number of General Macros has reached the upper limit."] = "通用宏数量已达上限。"
	L["Macro command exceeds 255 characters"] = "宏命令超出255个字符"
end

-- ruRU by ZamestoTV
if locale == "ruRU" then
	L["Signature Ability"] = "Общая способность"
	L["Class Ability"] = "Классовая способность"
	L["Macro Name"] = "Название макроса"
	L["Kyrian"] = "Кирии"
	L["Venthyr"] = "Вентиры"
	L["Night Fae"] = "Ночной народец"
	L["Necrolord"] = "Некролорды"
	L["Reset All"] = "Сбросить все"
	L["Reset all macros to defaults."] = "Сбросить все макросы до значений по умолчанию."
	L["Macro %s has been created."] = "Макрос %s создан."
	L["Macros has been updated."] = "Макрос обновлен."
	L["Macro %s already exists, please enter another name."] = "Макрос %s уже существует. Введите другое название."
	L["Macro %s has been renamed to %s."] = "Макрос %s был переименован в %s."
	L["The number of General Macros has reached the upper limit."] = "Количество общих макросов достигло предела."
	L["Macro command exceeds 255 characters"] = "Macro command exceeds 255 characters"
end

--[[ -- example
if locale == "enUS" then
	L["Signature Ability"] = "Signature Ability"
	L["Class Ability"] = "Class Ability"
	L["Macro Name"] = "Macro Name"
	L["Kyrian"] = "Kyrian"
	L["Venthyr"] = "Venthyr"
	L["Night Fae"] = "Night Fae"
	L["Necrolord"] = "Necrolord"
	L["Reset All"] = "Reset All"
	L["Reset all macros to defaults."] = "Reset all macros to defaults."
	L["Macro %s has been created."] = "Macro %s has been created."
	L["Macros has been updated."] = "Macros has been updated."
	L["Macro %s already exists, please enter another name."] = "Macro %s already exists, please enter another name."
	L["Macro %s has been renamed to %s."] = "Macro %s has been renamed to %s."
	L["The number of General Macros has reached the upper limit."] = "The number of General Macros has reached the upper limit."
	L["Macro command exceeds 255 characters"] = "Macro command exceeds 255 characters"
end ]]
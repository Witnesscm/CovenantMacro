local _, ns = ...

ns.CovenantMap = {
	[1] = "Kyrian",
	[2] = "Venthyr",
	[3] = "NightFae",
	[4] = "Necrolord",
}

ns.AbilityTypes = {
	[1] = "Signature",
	[2] = "Class",
}

ns.SignatureAbilities = {
	[1] = 324739,	-- 召唤执事者 (格里恩)
	[2] = 300728,	-- 暗影之门 (温西尔)
	[3] = 310143,	-- 灵魂变形 (法夜)
	[4] = 324631,	-- 血肉铸造 (通灵领主)
}

ns.ClassAbilities = {
	["DEATHKNIGHT"] = {
		[1] = 312202,	-- 失格者之梏 (格里恩)
		[2] = 311648,	-- 云集之雾 (温西尔)
		[3] = 324128,	-- 消亡之债 (法夜)
		[4] = 315443,	-- 憎恶附肢 (通灵领主)
	},
	["DEMONHUNTER"] = {
		[1] = 306830,	-- 极乐敕令 (格里恩)
		[2] = 317009,	-- 罪孽烙印 (温西尔)
		[3] = 323639,	-- 恶魔追击 (法夜)
		[4] = 350570,	-- 燃焰饲魂 (通灵领主)
	},
	["DRUID"] = {
		[1] = 326434,	-- 志趣相投 (格里恩)
		[2] = 323546,	-- 饕餮狂乱 (温西尔)
		[3] = 323764,	-- 万灵之召 (法夜)
		[4] = 325727,	-- 激变蜂群 (通灵领主)
	},
	["HUNTER"] = {
		[1] = 308491,	-- 共鸣箭 (格里恩)
		[2] = 324149,	-- 劫掠射击 (温西尔)
		[3] = 328231,	-- 野性之魂 (法夜)
		[4] = 325028,	-- 死亡飞轮 (通灵领主)
	},
	["MAGE"] = {
		[1] = 307443,	-- 璀璨火花 (格里恩)
		[2] = 314793,	-- 折磨之镜 (温西尔)
		[3] = 314791,	-- 变易幻能 (法夜)
		[4] = 324220,	-- 死神之躯 (通灵领主)
	},
	["MONK"] = {
		[1] = 310454,	-- 精序兵戈 (格里恩)
		[2] = 326860,	-- 陨落僧众 (温西尔)
		[3] = 327104,	-- 妖魂踏 (法夜)
		[4] = 325216,	-- 骨尘酒 (通灵领主)
	},
	["PALADIN"] = {
		[1] = 304971,	-- 圣洁鸣钟 (格里恩)
		[2] = 316958,	-- 红烬圣土 (温西尔)
		[3] = 328620,	-- 仲夏祝福 (法夜)
		--328622,	-- 暮秋祝福 (法夜)
		--328281,	-- 凛冬祝福 (法夜)
		--328282,	-- 阳春祝福 (法夜)
		[4] = 328204,	-- 征服者之锤 (通灵领主)
	},
	["PRIEST"] = {
		[1] = 325013,	-- 晋升者之赐 (格里恩)
		[2] = 323673,	-- 控心术 (温西尔)
		[3] = 327661,	-- 法夜守护者 (法夜)
		[4] = 324724,	-- 邪恶新星 (通灵领主)
	},
	["ROGUE"] = {
		[1] = 323547,	-- 申斥回响 (格里恩)
		[2] = 323654,	-- 狂热鞭笞 (温西尔)
		[3] = 328305,	-- 败血刃伤 (法夜)
		[4] = 328547,	-- 锯齿骨刺 (通灵领主)
	},
	["SHAMAN"] = {
		[1] = 324386,	-- 暮钟图腾 (格里恩)
		[2] = 320674,	-- 收割链 (温西尔)
		[3] = 328923,	-- 法夜输灵 (法夜)
		[4] = 326059,	-- 始源之潮 (通灵领主)
	},
	["WARLOCK"] = {
		[1] = 312321,	-- 碎魂奉纳 (格里恩)
		[2] = 321792,	-- 灾祸降临 (温西尔)
		[3] = 325640,	-- 灵魂腐化 (法夜)
		[4] = 325289,	-- 屠戮箭 (通灵领主)
	},
	["WARRIOR"] = {
		[1] = 307865,	-- 晋升堡垒之矛 (格里恩)
		[2] = 317485,	-- 判罪 (温西尔)
		[3] = 325886,	-- 上古余震 (法夜)
		[4] = 324143,	-- 征服者战旗 (通灵领主)
	},
}
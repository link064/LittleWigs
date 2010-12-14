-- XXX Ulic: Need logs and suggestions

-------------------------------------------------------------------------------
--  Module Declaration

local mod = BigWigs:NewBoss("Beauty", "Blackrock Caverns")
if not mod then return end
mod.partyContent = true
mod:RegisterEnableMob(39700)
mod.toggleOptions = {
	76031, --Magma Spit
	76028, --Terrifying Roar
	"bosskill",
}

-------------------------------------------------------------------------------
--  Localization

LCL = LibStub("AceLocale-3.0"):GetLocale("Little Wigs: Common")

-------------------------------------------------------------------------------
--  Initialization

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "MagmaSpit", 76031)
	self:Log("SPELL_AURA_REMOVED", "MagmaSpitRemoved", 76031)
	self:Log("SPELL_CAST_SUCCESS", "Roar", 76028, 93586)
	self:Death("Win", 39700)
end

-------------------------------------------------------------------------------
--  Event Handlers

function mod:MagmaSpit(player, spellId, _, _, spellName)
	self:Message(76031, spellName..": "..player, "Urgent", spellId)
	self:Bar(76031, spellName..": "..player, 9, spellId)
end

function mod:MagmaSpitRemoved(player, _, _, _, spellName)
	self:SendMessage("BigWigs_StopBar", self, spellName..": "..player)
end

function mod:Roar(_, spellId, _, _, spellName)
	self:Bar(76028, spellName, 30, spellId)
	self:Message(76028, spellName, "Info", spellId)
end

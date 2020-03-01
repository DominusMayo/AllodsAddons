function spellCheck()
  local spellbook = avatar.GetSpellBook()
  for k,v in pairs(spellbook) do
    local spell = spellLib.GetDescription(v)
    if userMods.FromWString(spell.name) == RAISEBANNER_SPELLNAME then
      if spellLib.GetState(v).isActive then
        mainForm:Show(false)
      else
        mainForm:Show(true)
        break
      end
    else
      mainForm:Show(false)
    end
  end
end




function init()
  common.RegisterEventHandler(spellCheck, 'EVENT_SECOND_TIMER')
end

if avatar.IsExist() then
  init()
else
  common.RegisterEventHandler(init, 'EVENT_AVATAR_CREATED')
end
run(function()
    local damageboost = nil
    local damageboostduration = nil
    local damageboostmultiplier = nil
    damageboost = vape.Categories.Blatant:CreateModule({
        Name = 'Damage Boost',
        Tooltip = 'Makes you go faster whenever you take knockback.',
        Function = function(callback)
            if callback then
                damageboost:Clean(vapeEvents.EntityDamageEvent.Event:Connect(function(damageTable)
                    local player = damageTable.entityInstance and playersService:GetPlayerFromCharacter(damageTable.entityInstance)
                    if player and player == lplr and (damageTable.knockbackMultiplier and damageTable.knockbackMultiplier.horizontal and damageTable.knockbackMultiplier.horizontal > 0 or playersService:GetPlayerFromCharacter(damageTable.fromEntity) ~= nil) and not vape.Modules['Long Jump'].Enabled then
                        damagedata.Multi = damageboostmultiplier.Value --+ (damageTable.knockbackMultiplier.horizontal / 2)
                        damagedata.lastHit = tick() + damageboostduration.Value
                    end
                end))
            end
        end
    })
    damageboostduration = damageboost:CreateSlider({
        Name = 'Duration',
        Min = 0,
        Max = 2,
        Decimal = 20,
        Default = 0.4,
    })
    damageboostmultiplier = damageboost:CreateSlider({
        Name = 'Multiplier',
        Min = 0,
        Max = 2,
        Decimal = 20,
        Default = 1.4,
    })
end)

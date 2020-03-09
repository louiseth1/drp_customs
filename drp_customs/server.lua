RegisterServerEvent("customs:check")
AddEventHandler("customs:check",function(title, data, cost, value)
    local source = tonumber(source)
    local dataUser = exports["drp_id"]:GetCharacterData(source)
    TriggerEvent("DRP_Bank:GetCharacterMoney", dataUser.charid, function(characterMoney)
        local userMoney = characterMoney.data[1].bank
        local newBankBalance =  userMoney - cost
        if userMoney >= cost then
            print(newBankBalance)
            TriggerClientEvent("customs:receive", source, title, data, value, back)
            exports["externalsql"]:DBAsyncQuery({
                string = "UPDATE `characters` SET `bank` = :bank WHERE `id` = :charid",
                data = {
                    bank = newBankBalance,
                    charid = dataUser.charid
                }
            }, function(results)
            TriggerClientEvent("DRP_Core:Success", source, "Purchase", tostring("An amount of $"..cost.." has been removed to your Bank Account"), 2500, false, "leftCenter")
            end)
            else
                if userMoney <= cost then
            TriggerClientEvent("DRP_Core:Error", source, "Purchase", tostring("You succesfuly teleported to waypoint"), 2500, false, "leftCenter")
                end
            end
    end)
end)
 
 
RegisterServerEvent("customs:check2")
AddEventHandler("customs:check2",function(title, data, cost, value, back)
    local source = tonumber(source)
    local dataUser = exports["drp_id"]:GetCharacterData(source)
    TriggerEvent("DRP_Bank:GetCharacterMoney", dataUser.charid, function(characterMoney)
        local userMoney = characterMoney.data[1].bank
        local newBankBalance =  userMoney - cost
        if userMoney >= cost then
            print(newBankBalance)
            TriggerClientEvent("customs:receive2", source, title, data, value, back)
            exports["externalsql"]:DBAsyncQuery({
                string = "UPDATE `characters` SET `bank` = :bank WHERE `id` = :charid",
                data = {
                    bank = newBankBalance,
                    charid = dataUser.charid
                }
            }, function(results)
            TriggerClientEvent("DRP_Core:Success", source, "Purchase", tostring("An amount of $"..cost.." has been removed to your Bank Account"), 2500, false, "leftCenter")
            end)
            else
                if userMoney <= cost then
            TriggerClientEvent("DRP_Core:Error", source, "Purchase", tostring("You succesfuly teleported to waypoint"), 2500, false, "leftCenter")
                end
            end
    end)
end)
 
 
RegisterServerEvent("customs:check3")
AddEventHandler("customs:check3",function(title, data, cost, mod, back, name, wtype)
    local source = tonumber(source)
    local dataUser = exports["drp_id"]:GetCharacterData(source)
    TriggerEvent("DRP_Bank:GetCharacterMoney", dataUser.charid, function(characterMoney)
        local userMoney = characterMoney.data[1].bank
        local newBankBalance =  userMoney - cost
        if userMoney >= cost then
            print(newBankBalance)
            TriggerClientEvent("customs:receive3", source, title, data, mod, back, name, wtype)
            exports["externalsql"]:DBAsyncQuery({
                string = "UPDATE `characters` SET `bank` = :bank WHERE `id` = :charid",
                data = {
                    bank = newBankBalance,
                    charid = dataUser.charid
                }
            }, function(results)
            TriggerClientEvent("DRP_Core:Success", source, "Purchase", tostring("An amount of $"..cost.." has been removed to your Bank Account"), 2500, false, "leftCenter")
            end)
            else
                if userMoney <= cost then
            TriggerClientEvent("DRP_Core:Error", source, "Purchase", tostring("You succesfuly teleported to waypoint"), 2500, false, "leftCenter")
                end
            end
    end)
end)
   
 
 
 
local tbl = {
[1] = {locked = false},
[2] = {locked = false},
[3] = {locked = false},
[4] = {locked = false},
[5] = {locked = false},
}
 
local ingarage = false
local currentgarage = nil
RegisterServerEvent('customs:lock')
AddEventHandler('customs:lock', function(b,garage)
    ingarage = b
    currentgarage = garage
    tbl[tonumber(garage)].locked = b
    TriggerClientEvent('customs:lock',-1,tbl)
    print("LS Customs status: "..json.encode(tbl))
end)
RegisterServerEvent('customs:getgarageinfos')
AddEventHandler('customs:getgarageinfos', function()
TriggerClientEvent('customs:lock',-1,tbl)
print("LS Customs status: "..json.encode(tbl))
end)
 
AddEventHandler('playerDropped', function()
    if ingarage == true then
        tbl[tonumber(currentgarage)].locked = false
        TriggerClientEvent('customs:lock',-1,tbl)
        print("LS Customs status: "..json.encode(tbl))
    end
end)
--[[
    SERVER SIZE SISTEM DROGE PRESENTA BRASILIANODEV.
--]]
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)  --- DA QUI POTRAI MODIFICARE IL TRIGGER IN BASE AL SERVER 

--- RACCOLTA MARIJUANA --- 
RegisterServerEvent('BrasilianoWeed:raccolta') 
AddEventHandler('BrasilianoMarijuana:raccolta', function()

    local xPlayer = ESX.GetPlayerFromId(source)
    
        xPlayer.addInventoryItem('weed', 1) --- iserire nome item
       
        
end)

---PROCESSO MARIJUANA---
RegisterServerEvent('BrasilianoProcessoWeed:processo')
AddEventHandler('BrasilianoProcessoWeed:processo', function()

    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem = xPlayer.getInventoryItem('weed')

        if xItem.count >=10 then


        xPlayer.removeInventoryItem('weed', 10) --- item raccolta ---
        Citizen.Wait(1000)	                            --- Ciclo processo ---
        xPlayer.addInventoryItem('weed4g', 5)   --- weed processata ---

    else
        TriggerClientEvent('esx:showNotification', source, 'Non hai Cimette')
    

    end
        
end)


--- RACOLTA METH ---
RegisterServerEvent('BrasilianoMeth:raccolta')
AddEventHandler('BrasilianoMeth:raccolta', function()

    local xPlayer = ESX.GetPlayerFromId(source)
    
    xPlayer.addInventoryItem('meth', 1)  --- item raccolta ---
        
end)

RegisterServerEvent('BrasilianoMeth:processo')
AddEventHandler('BrasilianoMeth:processo', function()

    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem = xPlayer.getInventoryItem('meth') 

        if xItem.count >=10 then -- ITEM COUNTER 


        xPlayer.removeInventoryItem('meth', 10)
        Citizen.Wait(1000)	
        xPlayer.addInventoryItem('meth1g', 5)

    else
	
        TriggerClientEvent('esx:showNotification', source, 'Non hai dell\'meth da processare')

    
    end
        
end)
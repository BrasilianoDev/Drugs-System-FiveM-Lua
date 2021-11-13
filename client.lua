--[[
SERVER CLIENT PENSATO DA BRASILIANODEV 
--]]
local ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) --- CLIENT TRIGGER, HO PENSATO DI METTERE DUE TRIGGER PER POI CRIPTARE E NON SARA POSSIBILE AVVIARLO IN NESSUN MODO.
		Citizen.Wait(0)
	end
end)
 
function playAnim(animDict, animName, duration)  --- ANIMAZIONE DURATA, NOME ANIMAZIONE. DOVRAI PER FORZA AVERE UN MENU EMOTE PER OTTERE L'ANIMAZIONE.
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do Citizen.Wait(0) end
    TaskPlayAnim(PlayerPedId(), animDict, animName, 1.0, -1.0, duration, 20, 1, false, false, false)
    RemoveAnimDict(animDict)
end

function DrawText3D(x, y, z, text)
    SetTextScale(0.38, 0.38)
    SetTextFont(7)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0 + 0.0125, 0.070 + factor, 0.03, 0, 0, 0, 64)
    ClearDrawOrigin()
end

--RACOLTA MARIA--


Config.BrasilianoRaccoltaMaria = {
	{['x'] = 2221.99, ['y'] = 5577.26, ['z'] = 53.84}
}
for i = 1, #Config.BrasilianoRaccoltaMaria, 1 do
	TriggerEvent('gridsystem:registerMarker', {
		name = 'BrasilianoRaccoltaMaria_', Config.BrasilianoRaccoltaMaria[i].x,
		pos = vector3(Config.BrasilianoRaccoltaMaria[i].x,Config.BrasilianoRaccoltaMaria[i].y,Config.BrasilianoRaccoltaMaria[i].z), -- Insert Cordinate x,y,z
		scale = vector3(0.7, 0.7, 0.7),
		msg = 'Premi ~b~[E]~w~ Per raccogliere la cannabis', 
		show3D = 0.2, 
		control = 'E', 
		action = function()
            playAnim('anim@amb@business@coc@coc_unpack_cut_left@', 'coke_cut_v1_coccutter', 4000)
			exports["taskbar"]:taskBar(4000, "Raccogliendo marijuana")
			FreezeEntityPosition(PlayerPedId(), true)
			Citizen.Wait(1000)
			TriggerServerEvent('Brasiliano_marijuana:raccolta')
			exports['okokTextUI']:Open('Hai raccolto Marijuana', 'lightgreen', 'left')
			FreezeEntityPosition(PlayerPedId(), false)
			Citizen.Wait(3000)
			exports['okokTextUI']:Close()
		end,
		onExit = function()
			ESX.UI.Menu.CloseAll()
		end
	})
end

--MARIA PROCESSO--
Config.BrasilianoProcessoMaria = {
	{['x'] = 2328.982, ['y'] = 2571.31, ['z'] = 46.68}
}
for i = 1, #Config.BrasilianoProcessoMaria, 1 do
	TriggerEvent('gridsystem:registerMarker', {
		name = 'SonoLucaMariaProcesso_', Config.BrasilianoProcessoMaria[i].x,
		pos = vector3(Config.BrasilianoProcessoMaria[i].x,Config.BrasilianoProcessoMaria[i].y,Config.BrasilianoProcessoMaria[i].z), -- Insert Cordinate x,y,z
		scale = vector3(0.7, 0.7, 0.7),
		msg = 'Premi ~b~[E]~w~ Per processare la cannabis', 
		show3D = 0.2, 
		control = 'E', 
		action = function()
			playAnim('anim@amb@business@coc@coc_unpack_cut_left@', 'coke_cut_v1_coccutter', 4000) 				
			exports["taskbar"]:taskBar(4000, "Processando Marijuana")
			FreezeEntityPosition(PlayerPedId(), true)
			Citizen.Wait(1000)
			TriggerServerEvent('Brasiliano_marijuana:processo')
			exports['okokTextUI']:Open('Hai processato Marijuana', 'lightgreen', 'left')
			FreezeEntityPosition(PlayerPedId(), false)
			Citizen.Wait(3000)
			exports['okokTextUI']:Close()
		end,
		onExit = function()
			ESX.UI.Menu.CloseAll()
		end
	})
end

--RACOLTA METH--

Config.BrasilianoRaccoltaMeth = { 
    {['x'] = 2712.58, ['y'] = 1540.26, ['z'] = 20.82}
}
for i = 1, #Config.BrasilianoRaccoltaMeth, 1 do
	TriggerEvent('gridsystem:registerMarker', {
		name = 'RaccoltaMeth_', Config.BrasilianoRaccoltaMeth[i].x,
		pos = vector3(Config.BrasilianoRaccoltaMeth[i].x,Config.BrasilianoRaccoltaMeth[i].y,Config.BrasilianoRaccoltaMeth[i].z), -- Insert Cordinate x,y,z
		scale = vector3(0.5, 0.5, 0.5),
		msg = 'Premi ~b~[E]~w~ Per raccogliere l\'meth', 
		show3D = 0.2,
		control = 'E', 
		action = function()
			playAnim('anim@amb@business@coc@coc_unpack_cut_left@', 'coke_cut_v1_coccutter', 4000) 				
			exports["taskbar"]:taskBar(4000, "Raccogliendo meth")
			FreezeEntityPosition(PlayerPedId(), true)
			Citizen.Wait(1000)
			TriggerServerEvent('Brasiliano_meth:raccolta')
			exports['okokTextUI']:Open('Hai raccolto meth', 'lightred', 'left')
			FreezeEntityPosition(PlayerPedId(), false)
			Citizen.Wait(3000)
			exports['okokTextUI']:Close()		
		end,
		onExit = function()
			ESX.UI.Menu.CloseAll()
		end
	})
end
-- PROCESSO METH --

Config.BrasilianoProcessoMeth = {
	{['x'] = 1390.7, ['y'] = 3606.93, ['z'] = 38.94}
}
for i = 1, #Config.BrasilianoProcessoMeth, 1 do
	TriggerEvent('gridsystem:registerMarker', {
		name = 'MethProcesso_', Config.BrasilianoProcessoMeth[i].x,
		pos = vector3(Config.BrasilianoProcessoMeth[i].x,Config.BrasilianoProcessoMeth[i].y,Config.BrasilianoProcessoMeth[i].z), -- inserisci cordinate x,y,z
		scale = vector3(0.7, 0.7, 0.7),
		msg = 'Premi ~b~[E]~w~ Per processare l\'meth', 
		show3D = 0.2, 
		control = 'E', 
		action = function()
			playAnim('anim@amb@business@coc@coc_unpack_cut_left@', 'coke_cut_v1_coccutter', 4000) 				
			exports["taskbar"]:taskBar(4000, "Processando meth")
			FreezeEntityPosition(PlayerPedId(), true)
			Citizen.Wait(1000)
			TriggerServerEvent('Brasiliano_meth:processo')			
			exports['okokTextUI']:Open('Hai processato meth', 'lightred', 'left')
			FreezeEntityPosition(PlayerPedId(), false)
			Citizen.Wait(3000)
			exports['okokTextUI']:Close()			
		end,
		onExit = function()
			ESX.UI.Menu.CloseAll()
		end
	})
end

--RACCOLTA PAPAVERO--

Config.BrasilianoConfigPapavero = {
	{['x'] = 5388.17, ['y'] = -5263.84, ['z'] = 34.78}
}
for i = 1, #Config.BrasilianoConfigPapavero, 1 do
	TriggerEvent('gridsystem:registerMarker', {
		name = 'BrasilianoPapavero_', Config.BrasilianoConfigPapavero[i].x,
		pos = vector3(Config.BrasilianoConfigPapavero[i].x,Config.BrasilianoConfigPapavero[i].y,Config.BrasilianoConfigPapavero[i].z), -- Insert Cordinate x,y,z
		scale = vector3(0.7, 0.7, 0.7),
		msg = 'Premi ~b~[E] ~w~per raccogliere il papavero', 
		control = 'E', 
		action = function()
			playAnim('anim@amb@business@coc@coc_unpack_cut_left@', 'coke_cut_v1_coccutter', 4000) 				
			exports["taskbar"]:taskBar(4000, "Raccogliendo Papavero")
			FreezeEntityPosition(PlayerPedId(), true)
			Citizen.Wait(1000)
			TriggerServerEvent('Brasiliano_tabbacco:raccolta')
			FreezeEntityPosition(PlayerPedId(), false)
			exports['okokTextUI']:Open('Hai raccolto Papavero', 'lightblue', 'left')
			FreezeEntityPosition(PlayerPedId(), false)
			Citizen.Wait(3000)
			exports['okokTextUI']:Close()	
		end,
		onExit = function()
			ESX.UI.Menu.CloseAll()
		end
	})
end


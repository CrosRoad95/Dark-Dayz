    local objects = {
    [1] = {
        statek = {827.63494873047,455.97930908203,6,0,0,132},
        kontenery = {
            {813.37908935547,480.88458251953,6.1328125,42},
            {819.93865966797,474.43145751953,6.1328125, 42},
            {833.54022216797,459.27716064453,6.1328125, 42},
            {827.33807373047,466.18438720703,6.1328125,42},
            {805.47479248047,471.67462158203,6.1328125, 130},
            {813.10760498047,463.06231689453,6.1328125, 130},
            {821.35662841797,453.72052001953,6.1328125, 130},
            {830.59783935547,443.49200439453,6.1328125, 130},
        }
    },
    [2] = {
        statek = {-436.20001220703,1094.0999755859,7.0999999046326,0,0,150},
        kontenery = {
            {-432.29998779297,1099.8000488281,7.5999999046326, 240},
            {-457.89999389648,1114.5999755859,7.5999999046326, 240},
            {-448.89999389648,1109.5999755859,7.5999999046326, 240},
            {-441.39999389648,1105.1999511719,7.5999999046326,240},
            {-450.10000610352,1095.5,7.5999999046326, 150},
            {-437.39999389648,1087.5,7.5999999046326, 150},
            {-462.39999389648,1103,7.5999999046326, 150},
            {-425.82501220703,1081.2640380859,7.232812404632, 150},
 
 
        }
 
    },
    [3] = {
        statek = {-2329.8000488281,2508.8999023438,4.1999998092651,0,0,0},
        kontenery = {
            {-2336.6999511719,2513,4.8000001907349, 90},
            {-2306.1000976563,2512.6999511719,4.8000001907349, 90},
            {-2317.3999023438,2512.6999511719,4.8000001907349, 90},
            {-2327.8999023438,2512.6999511719,4.8000001907349,90},
            {-2317.6000976563,2500.8999023438,4.8000001907349, 0},
            {-2304.6000976563,2501,4.8000001907349, 0},
            {-2329.8999023438,2501.1000976563,4.8000001907349, 0},
            {-2342.6125488281,2501.2504882812,4.8000001907349, 0},
 
 
        }
 
    },

    [4] = {
        statek = {2127.88,-136.28,1.0,0,0,260},
	kontenery = {
	    {2117.50,-160.66,1.13,170},
	    {2119.40,-149.93,1.13,170},
	    {2121.30,-139.20,1.13,170},
	    {2123.20,-128.47,1.13,170},
	    {2129.67,-162.88,1.13,80},
	    {2132.05,-149.95,1.13,80},
	    {2134.39,-138.06,1.13,80},
	    {2136.69,-124.85,1.13,80},
	}
    },

    [5] = {
        statek = {-2698.70,-2790.12,1.57,0,0,270},
	kontenery = {
	    {-2705.45,-2816.08,1.70,180},
	    {-2705.45,-2805.08,1.70,180},
	    {-2705.45,-2794.08,1.70,180},
	    {-2705.45,-2783.08,1.70,180},
	    {-2692.33,-2815.91,1.70,90},
	    {-2692.33,-2804.91,1.70,90},
	    {-2692.33,-2793.91,1.70,90},
	    {-2692.33,-2782.91,1.70,90},
	}
    },

 
}
 
 
 
 
local zamkniete_kontenery = {}
local kontenery = {}
 
local times = {
    kontener = nil,
    boatcrash = nil,
    car = nil,
}
 
 
local kontener_have_car = nil
 
local loots = {
    ['kontenery'] = {
        ['zwykle'] = {
            {"Bandage",1,20,50},
            {"M4A1-S",2,20,35},
            {"AK-47 Mag",3,20,25},
            {"PDW",5,10,35},
            {"PDW Mag",5,30,35},
            {"Shovel",1,10,35},
            {"Golf Club",5,10,35},
            {"Baseball Bat",5,10,35},
            {"Parachute",1,6.5,35},
            {"W1200",2,10,35},
            {"AK47",2,20,35},
            {"AWP",2,10,35},
            {"XM1014",2,10,35},
            {"LSAT",2,10,35},
            {"M60",2,10,35},
            {"M40A5",2,10,35},
            {"UMP45",2,10,35},
            {"UMP45 Mag",3,10,35},
            {"LSAT Belt Mag",3,10,35},
            {"M60 Belt Mag",3,10,35},
            {"M4A1-S Mag",3,20,25},
            {"W1200 Slug",3,10,35},
            {"AR15 Mag",3,10,35},
            {"AWP Mag",3,15,35},

            {"ACR",2,10,35},
            {"ACR Mag",3,10,35},
            {"AS50",2,10,35},
            {"AS50 Mag",2,6.5,35},
            {"Lee Enfield",5,10,35},
            {"Lee Enfield Mag",5,20,35},
            {"AR15",5,10,35},
            {"MP5A5 Mag",5,10,35},
            {"Milk",5,10,35},
            {"Cooked Meat",5,10,35},
            {"Soda Bottle",5,10,35},
            {"Burger",5,10,35},
            {"Coca Cola",5,10,35},
            {"Kebab",5,10,35},
            {"Beans Can",5,10,35},
            {"Water Bottle",5,10,35},
            {"Winchester 1866",5,10,35},
            {"SPAZ-12 Combat Shotgun",5,10,35},
            {"Sawn-Off Shotgun",5,10,35},
            {"2Rnd. Slug",5,25,35},
            {"1866 Slug",5,25,35},
            {"Wood Pile",5,10,35},
            {"Bandage",5,10,35},
            {"Full Gas Canister",5,10,35},
            {"Medic Kit",2,10,35},
            {"First Aid Kit",5,10,35},
            {"Medic Bag",1,10,35},
            {"Heat Pack",5,10,35},
            {"Painkiller",5,10,35},
            {"Morphine",5,10,35},
            {"Blood Bag",5,10,35},
            {"Wire Fence",1,2,35},
            {"Tire",2,10,25},
            {"Tank Parts",2,10,35},
            {"Engine",1,10,35},
            {"Tent",1,2,35},
            {"Medium Tent",1,2,35},
            {"Coyote Backpack",5,10,35},
            {"Mountain Backpack",5,10,35},
            {"Ghillie Backpack",5,10,35},
            {"British Assault Pack",5,10,35},
            {"Ghillie Suit White",5,10,35},
            {"Woman Clothing",5,10,35},
            {"Assault Pack (ACU)",1,10,35},
            {"Medic Backpack",1,10,35},
            {"Alice Pack",1,10,35},
            {"Medium Backpack",1,10,35},
            {"Big Backpack",1,10,35},
            {"Military Backpack",1,10,35},
            {"Night Vision Goggles",1,10,100},
            {"Infrared Goggles",1,10,80},
            {"Toolbox",1,10,35},
            {"GPS",5,10,35},
            {"Map",5,10,},

 
        },
        ['zamkniete'] = {
            {"Bandage",1,20,50},
            {"M4A1-S",1,20,25},
            {"M4A1-S Mag",1,20,25},
            {"AK-47",1,20,35},
            {"AK-47 Mag",1,20,25},
            {"PDW",1,10,35},
            {"PDW Mag",1,30,40},
            {"Shovel",1,10,35},
            {"Golf Club",1,10,35},
            {"Baseball Bat",1,10,35},
            {"Parachute",1,6.5,35},
            {"W1200",1,10,35},
            {"AK47",1,10,20},
            {"AWP",1,10,35},
            {"W1200 Slug",1,40,35},
            {"AR15 Mag",1,40,35},
            {"AWP Mag",1,15,35},

            {"ACR",1,10,35},
            {"ACR Mag",1,10,35},
            {"AS50",1,10,35},
            {"AS50 Mag",1,6.5,35},
            {"Lee Enfield",1,10,35},
            {"Lee Enfield Mag",1,10,35},
            {"AR15",1,10,35},
            {"MP5A5 Mag",1,40,35},
            {"Milk",1,10,35},
            {"Cooked Meat",1,10,35},
            {"Soda Bottle",1,10,35},
            {"Burger",1,10,35},
            {"Coca Cola",1,10,35},
            {"Kebab",1,10,35},
            {"Beans Can",1,10,35},
            {"Water Bottle",1,10,35},
            {"Dark Card",1,1,20},
            {"SPAZ-12 Combat Shotgun",1,10,35},
            {"Sawn-Off Shotgun",1,10,35},
            {"2Rnd. Slug",1,60,35},
            {"1866 Slug",1,60,35},
            {"Wood Pile",1,10,35},
            {"Bandage",1,10,35},
            {"Full Gas Canister",1,10,35},
            {"Medic Kit",1,10,35},
            {"First Aid Kit",1,10,35},
            {"Medic Bag",1,10,35},
            {"Heat Pack",1,10,35},
            {"Painkiller",1,10,35},
            {"Morphine",1,10,35},
            {"Blood Bag",1,10,35},
            {"Wire Fence",1,2,35},
            {"Tire",1,10,25},
            {"Tank Parts",1,10,35},
            {"Engine",1,10,35},
            {"Tent",1,2,35},
            {"Medium Tent",1,2,35},
            {"Coyote Backpack",1,10,35},
            {"Mountain Backpack",1,10,35},
            {"Ghillie Backpack",1,10,35},
            {"British Assault Pack",1,10,35},
            {"Ghillie Suit White",1,10,35},
            {"Woman Clothing",1,10,35},
            {"Assault Pack (ACU)",1,10,35},
            {"Medic Backpack",1,10,35},
            {"Alice Pack",1,10,35},
            {"Medium Backpack",1,10,35},
            {"Big Backpack",1,10,35},
            {"Military Backpack",1,10,35},
            {"Night Vision Goggles",1,10,35},
            {"Infrared Goggles",1,10,35},
            {"Toolbox",1,10,35},
            {"GPS",1,10,35},
            {"Map",1,10,35},
        },
    },
}
 
 
function math.percentChance(percent, repeatTime,addAmount)
    local hits = 0;
    for i = 1, repeatTime do
        local number = math.random(0, 500)/2
        if (number <= (percent or 0) ) then hits = hits + addAmount; end
    end
    return hits;
end
 
local samochod_zrespiony
 
function createDayZLoot(object,loot_type)
    local x,y,z = getElementPosition(object)
    local col = createColSphere(x,y,z,4)
    setElementData(col,'parent',object)
    setElementData(object,'parent',col)
    setElementData(col, 'itemloot', true)
    setElementData(col, 'ItemDoLutowania', true)
	setElementData(col,"lootname","Kontener")
    setElementData(col,'MAX_Slots',0)
    for i,v in pairs(loots['kontenery'][loot_type]) do
        local szansa = math.percentChance(v[4],v[3],v[2])
        setElementData(col,v[1],szansa)
    end
end
 
local statek
-- 3600000*8
 
local ticking = nil
local konteners_ticking ={}
 
 
function spawnBoatCrash()
	triggerClientEvent( root, "dxPickupsText", root, "Statek się rozbił miejsce zostało oznaczone na mapie!", 255,255,255 )
    times.boatcrash = getTickCount() + 3600000*6
	konteners_ticking = {}
    local los = math.random(#objects)
    statek = createObject(10230,objects[los].statek[1],objects[los].statek[2],objects[los].statek[3],objects[los].statek[4],objects[los].statek[5],objects[los].statek[6])
    setElementParent(statek,createBlip(objects[los].statek[1],objects[los].statek[2],objects[los].statek[3],9))
    ticking = getTickCount()
    setElementData(resourceRoot,'Konteners',ticking)
    for i,v in pairs(objects[los].kontenery) do
        local object = createObject(3570,v[1],v[2],v[3],0,0,v[4])
        if i>=5 then
            if i==5 then
                times.car = getTickCount() + 7200000
                kontener_have_car = object
            end
            zamkniete_kontenery[object] = true
            times.kontener = getTickCount() + 3600000
            kontenery[object] = true
        else
            kontenery[object] = true
            createDayZLoot(object,'zwykle')
        end
    end
    for _,v in pairs(getElementsByType('player')) do
        local l = 1
        for i,_ in pairs(zamkniete_kontenery) do
            local x,y,z = getElementPosition(i)
            if x and y and z then
             triggerClientEvent(v, 'boat_addKontener', resourceRoot, x, y, z, i, ticking + 3600000*l)
			 setElementData(i,'xXx',l)
			 konteners_ticking[l] = ticking + 3600000*l
            l = l + 1
            end
        end
    end
end
 
 
setTimer(function()
	spawnBoatCrash()
end,500,1)
 
function deleteBoatCrash()
    destroyElement(getElementParent(statek))
   -- destroyElement(statek)
    for i,v in pairs(kontenery) do
        if isElement(i) and isElement(getElementData(i,'parent')) then
            destroyElement(getElementData(i,'parent'))
  --  destroyElement(statek,9)
        end
        if isElement(i) then
            destroyElement(i)
        end
    end
    kontenery = {}
    zamkniete_kontenery = {}
    kontener_have_car = nil
    samochod_zrespiony = nil
end
 
addCommandHandler("delboat",function()
	deleteBoatCrash()
end)


 
local cars_name = {
    {"Sandking",0,0,1}, -- nazwa caru, kola, silnik, brzuch twojego starego
    {"Sultan",0,0,1}, -- nazwa caru, kola, silnik, brzuch twojego starego
    {"Patriot",0,0,1}, -- nazwa caru, kola, silnik, brzuch twojego starego
    {"Blista Compact",0,0,1}, -- nazwa caru, kola, silnik, brzuch twojego starego
    {"Super GT",0,0,1}, -- nazwa caru, kola, silnik, brzuch twojego starego
}
 
 
function spawn_car(x,y,z)
    local klucz = cars_name[math.random(#cars_name)]
    samochod_zrespiony = createVehicle(getVehicleModelFromName(klucz[1]),x,y,z)
    local col = createColSphere(x,y,z,3)
   
    attachElements(col,samochod_zrespiony)
    setElementData(col,'parent',samochod_zrespiony)
    setElementData(samochod_zrespiony,'parent',col)
    setElementData(col,'vehicle',true)
    setElementData(samochod_zrespiony,'dayzvehicle',0)
    setElementData(col,'MAX_Slots',30)
    setElementData(col,'Tire_inVehicle',klucz[2])
    setElementData(col,'Engine_inVehicle',klucz[3])
    setElementData(col,'Parts_inVehicle',klucz[4])
    setElementData(col, "fuel",20);	
end
 
setTimer(function()
  -- if #getElementsByType('player') < 5 then return end
    if times.boatcrash and getTickCount()-times.boatcrash>1 then
        deleteBoatCrash()
        spawnBoatCrash()
        return
    end
    if times.car and getTickCount()-times.car>1 then
        if not kontener_have_car then return end
        times.car = nil
        local x,y,z = getElementPosition(kontener_have_car)
        spawn_car(x,y,z)
        kontenery[kontener_have_car] = nil
        if isElement(kontener_have_car) and isElement(getElementData(kontener_have_car,'parent')) then
            destroyElement(getElementData(kontener_have_car,'parent'))
        end
        if isElement(kontener_have_car) then
            destroyElement(kontener_have_car)
        end
        kontener_have_car = nil
        return
    end
    setElementData(resourceRoot,'Konteners',getTickCount())
    if times.kontener and getTickCount()-times.kontener>1 then
        for i,v in pairs(zamkniete_kontenery) do
           
            times.kontener = getTickCount() + 3600000
            createDayZLoot(i,'zamkniete')
			triggerClientEvent( root, "dxPickupsText", root, "[STATEK] Nowy kontener otworzył się!", 255,255,255 )
            for _,gracz in pairs(getElementsByType('player')) do
                triggerClientEvent(gracz, 'deleteKontener', resourceRoot, i)
            end
            zamkniete_kontenery[i] = nil
            break
        end
    end
end, 60000, 0)
 
 
local db = dbConnect('sqlite','auta.db')
dbExec(db,'CREATE TABLE IF NOT EXISTS Auta(x,y,z,montaz,friz,itemy,model)')
 
 
addEventHandler('onPlayerLogin',root,function()
    local l = 1
    for i,v in pairs(zamkniete_kontenery) do
        local x,y,z = getElementPosition(v)
        triggerClientEvent(source,'boat_addKontener',resourceRoot,x,y,z,v,konteners_ticking[getElementData(v,'xXx')])
        l = l + 1
    end
end)
 

if db then
    local handler = dbQuery(db,'SELECT * From Auta')
    local paul = dbPoll(handler,-1)
    dbFree(handler)
    for i,v in pairs(paul) do
        local x,y,z = v['x'],v['y'],v['z']
        local car = createVehicle(tonumber(v['model']),x,y,z)
        local col = createColSphere(x,y,z,3)
       
        attachElements(col,car)
        setElementData(col,'vehicle',true)
        setElementData(col,'dayzvehicle',0)
        setElementData(col,'parent',car)
        setElementData(car,'parent',col)
        local itemy = fromJSON(v['itemy'])
        local montaz = fromJSON(v['montaz'])
        for i,v in pairs(montaz) do
            setElementData(col,v[1],v[2])
        end
        for i,v in pairs(itemy) do
            setElementData(col,v[1],v[2])
        end
        local friz = v['friz']
        if friz=='true' then
            setElementFrozen(car,true)
        end
    end
end
 
local backup_items = {
    {"Bandage"},
    {"Medic Kit"},
}
 
 
function backup()
    dbExec(db,'DELETE From Auta')
    local cars = 0
    for i,v in pairs(getElementsByType('vehicle',resourceRoot)) do
        local col = getElementData(v,'parent')
        if not (isElementInWater(v) or isVehicleBlown(v)) and col then
            local itemy = {}
            cars = cars + 1
            for _,item in pairs(backup_items) do
                table.insert(itemy,{item[1],(getElementData(col,item[1]) or 0)})
            end
            local friz = 'false'
            if isElementFrozen(v) then
                friz = 'true'
            end
            local x,y,z = getElementPosition(v)
            local kola = getElementData(col,'Tire_inVehicle') or 0
            local tanks = getElementData(col, "Parts_inVehicle") or 0
            local engine = getElementData(col, "Engine_inVehicle") or 0
            local fuel = getElementData(col, "fuel") or 0
            local oil = getElementData(col, "oil") or 0

            local slots = getElementData(col, "MAX_Slots") or 20
            local montaz = {}
            table.insert(montaz,{'Tire_inVehicle',kola})
            table.insert(montaz,{'Parts_inVehicle',tanks})
            table.insert(montaz,{'Engine_inVehicle',engine})
            table.insert(montaz,{'fuel',fuel})
            table.insert(montaz,{'MAX_Slots',slots})
            dbExec(db,'INSERT INTO `Auta` VALUES(?,?,?,?,?,?,?)',x,y,z,toJSON(montaz),friz,toJSON(itemy),getElementModel(v))
        end
        if isElementInWater(v) or isVehicleBlown(v) then
            destroyElement(getElementData(v,'parent'))
            destroyElement(v)
        end
    end
    print(cars)
end
 
setTimer(function()
    backup()
end,360000/2,0)
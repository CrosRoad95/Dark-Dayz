

local zasoby = {
"0s-lv",
"AAblokada-autostrady-lv-prawa",
"blokada-autostrady-lv-prawa",
"BUDOWA-AUUU-LV",
"farma-obok-montchilliad-fzldk",
"Gowno-w-tunelu",
"Hospital-lv",
"Jakie-gowno-kolo-atomufek",
"Jakies-gowno-kolo-wymiany-lvl-01",
"Jakies-gowno-kolo-wymiany-lvl-02",
"Lv-Kolo-emeralda",
"Most-bajsajd",
"Most-zablokowany-lv",
"obok-angelpine-blokada-fzldk",
"Rozjebane-gowno-by-TheToxic",
"Rozjebane-samoloty-lv",
"sf-autostrada",
"whetstone-jakies-blokada-obok-drogiej-bazy",
"Wrak-Samolotu-LV",
"Wyspa",
}

local ilosc = 0

for i,v in pairs(zasoby) do
	local zasob = getResourceFromName(v)
	if getResourceState(zasob) ~= "running" then
		startResource(zasob)
		ilosc = ilosc + 1
	end
end
print("* Uruchomiono: "..ilosc.." zasobów")
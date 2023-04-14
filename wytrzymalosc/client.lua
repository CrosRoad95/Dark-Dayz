local dmg_table = {
-- model,	  id
	[422]=10, --Bobcat
	[470]=3, --Patriot
	[468]=10, --Sanchez
	[433]=2, --Barrack
	[437]=10, --Coach
	[509]=0,  --Bike
	[487]=6, --Maverick
	[497]=6, --PoliceMaverick
	[453]=6, --Reffer
	[411]=9, --Infernus
	[415]=9, --Cheetah
	[541]=9, --Bullet
	[429]=9, --Bannshe
	[480]=3,--Comet
	[402]=9, --Buffalo
	[495]=4, --SandKing
	[560]=9, --Sultan
	[579]=9, --Huntley
	[562]=9, --Elegy
	[482]=9, --Burrito
	[496]=9,--BlistaCompact
	[475]=9, --Sabre
	[507]=9, --Elegant
	[551]=9, --Merit
	[522]=9, --NRG500
	[461]=9, --PCJ600
	[420]=9, --Taxi
	[416]=9, --Karetka
	[417]=2,  --Leviatan
	[511]=2,  --Beagle
	[593]=5,  --Dodo
	[471]=9,  --Quad
	[500]=9,  --Mesa
	[542]=9,  --Clover
	[447]=9,  --SeaSparrow
	[494]=9,  --HotringRacer
	[550]=9,  --Sunrise
	[445]=9,  --Admiral
	[525]=9,  --TowTruck
	[601]=0.3, --Swat
	[469]=9,  --Sparrow
	[506]=9,  --Supergt
	[400]=2,  --LandStarker
	[528]=2,  --FBI truck
	[483]=9,  --Camper
	[565]=9,  --Flash
	[578]=9,  --DFT-30
	[451]=2,  --Turismo
	[596]=9,  --PoliceLS
	[416]=9,  --Ambulans
	[502]=9,  --PoliceLS
	[503]=9,  --PoliceLS
	[515]=9,  --rdt
}
--Krowy
local weapon_table = {
-- model,	  id
["PKP Pecheneg"] = {
	[422]=10, --Bobcat
	[470]=1, --Patriot
	[515]=9,  --rdt
	[468]=10, --Sanchez
	[433]=1, --Barrack
	[437]=10, --Coach
	[509]=0,  --Bike
	[487]=6, --Maverick
	[497]=6, --PoliceMaverick
	[453]=6, --Reffer
	[411]=5, --Infernus
	[415]=5, --Cheetah
	[541]=5, --Bullet
	[429]=5, --Bannshe
	[480]=4,--Comet
	[402]=9, --Buffalo
	[495]=4, --SandKing
	[560]=5, --Sultan
	[579]=5, --Huntley
	[562]=6, --Elegy
	[482]=9, --Burrito
	[496]=9,--BlistaCompact
	[475]=9, --Sabre
	[507]=9, --Elegant
	[551]=9, --Merit
	[522]=9, --NRG500
	[461]=9, --PCJ600
	[420]=9, --Taxi
	[416]=9, --Karetka
	[417]=2,  --Leviatan
	[511]=2,  --Beagle
	[593]=10,  --Dodo
	[471]=9,  --Quad
	[500]=9,  --Mesa
	[542]=9,  --Clover
	[447]=9,  --SeaSparrow
	[494]=6,  --HotringRacer
	[550]=9,  --Sunrise
	[445]=9,  --Admiral
	[525]=9,  --TowTruck
	[601]=0.3, --Swat
	[469]=9,  --Sparrow
	[506]=9,  --Supergt
	[400]=1,  --LandStarker
	[528]=1,  --FBI truck
	[483]=6,  --Camper
	[565]=9,  --Flash
	[578]=9,  --DFT-30
	[451]=2,  --Turismo
	[596]=2,  --PoliceLS
	[416]=5,  --Ambulans
	[502]=3,  --PoliceLS
	[503]=3,  --PoliceLS
},
["MG-34"] = {
	[422]=10, --Bobcat
	[470]=3, --Patriot
	[468]=10, --Sanchez
	[433]=1, --Barrack
	[437]=10, --Coach
	[509]=0,  --Bike
	[487]=6, --Maverick
	[515]=9,  --rdt
	[497]=6, --PoliceMaverick
	[453]=6, --Reffer
	[411]=15, --Infernus
	[415]=15, --Cheetah
	[541]=15, --Bullet
	[429]=15, --Bannshe
	[480]=18,--Comet
	[402]=9, --Buffalo
	[495]=18, --SandKing
	[560]=15, --Sultan
	[579]=15, --Huntley
	[562]=6, --Elegy
	[482]=9, --Burrito
	[496]=9,--BlistaCompact
	[475]=9, --Sabre
	[507]=9, --Elegant
	[551]=9, --Merit
	[522]=19, --NRG500
	[461]=19, --PCJ600
	[420]=9, --Taxi
	[416]=9, --Karetka
	[417]=2,  --Leviatan
	[511]=4,  --Beagle
	[593]=10,  --Dodo
	[471]=19,  --Quad
	[500]=19,  --Mesa
	[542]=9,  --Clover
	[447]=9,  --SeaSparrow
	[494]=16,  --HotringRacer
	[550]=9,  --Sunrise
	[445]=19,  --Admiral
	[525]=9,  --TowTruck
	[601]=7, --Swat
	[469]=9,  --Sparrow
	[506]=9,  --Supergt
	[400]=4,  --LandStarker
	[528]=4,  --FBI truck
	[483]=6,  --Camper
	[565]=9,  --Flash
	[578]=9,  --DFT-30
	[451]=15,  --Turismo
	[596]=15,  --PoliceLS
	[416]=15,  --Ambulans
	[502]=15,  --PoliceLS
	[503]=15,  --PoliceLS
},
--AK M4 G36C
["M4A1-S"] = {  
	[422]=10, --Bobcat
	[470]=1, --Patriot
	[468]=10, --Sanchez
	[433]=1, --Barrack
	[437]=10, --Coach
	[509]=0,  --Bike
	[487]=6, --Maverick
	[497]=6, --PoliceMaverick
	[453]=6, --Reffer
	[411]=5, --Infernus
	[415]=5, --Cheetah
	[541]=5, --Bullet
	[429]=5, --Bannshe
	[480]=6,--Comet
	[402]=9, --Buffalo
	[495]=4, --SandKing
	[515]=9,  --rdt
	[560]=5, --Sultan
	[579]=5, --Huntley
	[562]=6, --Elegy
	[482]=9, --Burrito
	[496]=9,--BlistaCompact
	[475]=9, --Sabre
	[507]=9, --Elegant
	[551]=9, --Merit
	[522]=9, --NRG500
	[461]=9, --PCJ600
	[420]=9, --Taxi
	[416]=9, --Karetka
	[417]=2,  --Leviatan
	[511]=2,  --Beagle
	[593]=9,  --Dodo
	[471]=9,  --Quad
	[500]=9,  --Mesa
	[542]=9,  --Clover
	[447]=9,  --SeaSparrow
	[494]=6,  --HotringRacer
	[550]=9,  --Sunrise
	[445]=9,  --Admiral
	[525]=9,  --TowTruck
	[601]=0.3, --Swat
	[469]=9,  --Sparrow
	[506]=9,  --Supergt
	[400]=1,  --LandStarker
	[528]=1,  --FBI truck
	[483]=6,  --Camper
	[565]=9,  --Flash
	[578]=9,  --DFT-30
	[451]=2,  --Turismo
	[596]=2,  --PoliceLS
	[416]=5,  --Ambulans
	[502]=4,  --PoliceLS
	[503]=4,  --PoliceLS
},
["M4A1"] = {  
	[422]=10, --Bobcat
	[470]=1, --Patriot
	[468]=10, --Sanchez
	[433]=1, --Barrack
	[437]=10, --Coach
	[509]=0,  --Bike
	[487]=6, --Maverick
	[497]=6, --PoliceMaverick
	[453]=6, --Reffer
	[411]=5, --Infernus
	[415]=5, --Cheetah
	[541]=5, --Bullet
	[429]=5, --Bannshe
	[480]=6,--Comet
	[402]=9, --Buffalo
	[495]=4, --SandKing
	[515]=9,  --rdt
	[560]=5, --Sultan
	[579]=5, --Huntley
	[562]=6, --Elegy
	[482]=9, --Burrito
	[496]=9,--BlistaCompact
	[475]=9, --Sabre
	[507]=9, --Elegant
	[551]=9, --Merit
	[522]=9, --NRG500
	[461]=9, --PCJ600
	[420]=9, --Taxi
	[416]=9, --Karetka
	[417]=2,  --Leviatan
	[511]=2,  --Beagle
	[593]=9,  --Dodo
	[471]=9,  --Quad
	[500]=9,  --Mesa
	[542]=9,  --Clover
	[447]=9,  --SeaSparrow
	[494]=6,  --HotringRacer
	[550]=9,  --Sunrise
	[445]=9,  --Admiral
	[525]=9,  --TowTruck
	[601]=0.3, --Swat
	[469]=9,  --Sparrow
	[506]=9,  --Supergt
	[400]=1,  --LandStarker
	[528]=1,  --FBI truck
	[483]=6,  --Camper
	[565]=9,  --Flash
	[578]=9,  --DFT-30
	[451]=2,  --Turismo
	[596]=2,  --PoliceLS
	[416]=5,  --Ambulans
	[502]=4,  --PoliceLS
	[503]=4,  --PoliceLS
},
["G36C"] = {  
	[422]=10, --Bobcat
	[470]=1, --Patriot
	[468]=10, --Sanchez
	[433]=1, --Barrack
	[437]=10, --Coach
	[509]=0,  --Bike
	[487]=6, --Maverick
	[497]=6, --PoliceMaverick
	[453]=6, --Reffer
	[411]=5, --Infernus
	[415]=5, --Cheetah
	[541]=5, --Bullet
	[429]=5, --Bannshe
	[480]=6,--Comet
	[515]=9,  --rdt
	[402]=9, --Buffalo
	[495]=4, --SandKing
	[560]=5, --Sultan
	[579]=5, --Huntley
	[562]=6, --Elegy
	[482]=9, --Burrito
	[496]=9,--BlistaCompact
	[475]=9, --Sabre
	[507]=9, --Elegant
	[551]=9, --Merit
	[522]=9, --NRG500
	[461]=9, --PCJ600
	[420]=9, --Taxi
	[416]=9, --Karetka
	[417]=2,  --Leviatan
	[511]=2,  --Beagle
	[593]=9,  --Dodo
	[471]=9,  --Quad
	[500]=9,  --Mesa
	[542]=9,  --Clover
	[447]=9,  --SeaSparrow
	[494]=6,  --HotringRacer
	[550]=9,  --Sunrise
	[445]=9,  --Admiral
	[525]=9,  --TowTruck
	[601]=0.3, --Swat
	[469]=9,  --Sparrow
	[506]=9,  --Supergt
	[400]=1,  --LandStarker
	[528]=1,  --FBI truck
	[483]=6,  --Camper
	[565]=9,  --Flash
	[578]=9,  --DFT-30
	[451]=2,  --Turismo
	[596]=2,  --PoliceLS
	[416]=5,  --Ambulans
	[502]=3,  --PoliceLS
	[503]=4,  --PoliceLS
},
["AK-47"] = {  
	[422]=10, --Bobcat
	[470]=1, --Patriot
	[468]=10, --Sanchez
	[433]=1, --Barrack
	[437]=10, --Coach
	[509]=0,  --Bike
	[487]=6, --Maverick
	[497]=6, --PoliceMaverick
	[515]=9,  --rdt
	[453]=6, --Reffer
	[411]=5, --Infernus
	[415]=5, --Cheetah
	[541]=5, --Bullet
	[429]=5, --Bannshe
	[480]=6,--Comet
	[402]=9, --Buffalo
	[495]=4, --SandKing
	[560]=5, --Sultan
	[579]=5, --Huntley
	[562]=6, --Elegy
	[482]=9, --Burrito
	[496]=9,--BlistaCompact
	[475]=9, --Sabre
	[507]=9, --Elegant
	[551]=9, --Merit
	[522]=9, --NRG500
	[461]=9, --PCJ600
	[420]=9, --Taxi
	[416]=9, --Karetka
	[417]=2,  --Leviatan
	[511]=2,  --Beagle
	[593]=9,  --Dodo
	[471]=9,  --Quad
	[500]=9,  --Mesa
	[542]=9,  --Clover
	[447]=9,  --SeaSparrow
	[494]=6,  --HotringRacer
	[550]=9,  --Sunrise
	[445]=9,  --Admiral
	[525]=9,  --TowTruck
	[601]=0.3, --Swat
	[469]=9,  --Sparrow
	[506]=9,  --Supergt
	[400]=1,  --LandStarker
	[528]=1,  --FBI truck
	[483]=6,  --Camper
	[565]=9,  --Flash
	[578]=9,  --DFT-30
	[451]=2,  --Turismo
	[596]=2,  --PoliceLS
	[416]=5,  --Ambulans
	[502]=4,  --PoliceLS
	[503]=4,  --PoliceLS
},
--Sniperki
["AWP"] = {
	[422]=10, --Bobcat
	[470]=2, --Patriot
	[468]=10, --Sanchez
	[433]=2, --Barrack
	[437]=10, --Coach
	[509]=0,  --Bike
	[487]=6, --Maverick
	[497]=6, --PoliceMaverick
	[453]=6, --Reffer
	[411]=4, --Infernus
	[415]=5, --Cheetah
	[541]=5, --Bullet
	[515]=9,  --rdt
	[429]=5, --Bannshe
	[480]=1,--Comet
	[402]=9, --Buffalo
	[495]=4, --SandKing
	[560]=5, --Sultan
	[579]=5, --Huntley
	[562]=6, --Elegy
	[482]=9, --Burrito
	[496]=9,--BlistaCompact
	[475]=9, --Sabre
	[507]=9, --Elegant
	[551]=9, --Merit
	[522]=9, --NRG500
	[461]=9, --PCJ600
	[420]=9, --Taxi
	[416]=9, --Karetka
	[417]=2,  --Leviatan
	[511]=2,  --Beagle
	[593]=10,  --Dodo
	[471]=9,  --Quad
	[500]=9,  --Mesa
	[542]=9,  --Clover
	[447]=9,  --SeaSparrow
	[494]=6,  --HotringRacer
	[550]=9,  --Sunrise
	[445]=9,  --Admiral
	[525]=9,  --TowTruck
	[601]=0.3, --Swat
	[469]=9,  --Sparrow
	[506]=9,  --Supergt
	[400]=2,  --LandStarker
	[528]=2,  --FBI truck
	[483]=6,  --Camper
	[565]=9,  --Flash
	[578]=9,  --DFT-30
	[451]=2,  --Turismo
	[596]=2,  --PoliceLS
	[416]=5,  --Ambulans
	[502]=3,  --PoliceLS
	[503]=3,  --PoliceLS
},
["SVD Dragunov"] = {
	[422]=10, --Bobcat
	[470]=2, --Patriot
	[468]=10, --Sanchez
	[433]=2, --Barrack
	[437]=10, --Coach
	[509]=0,  --Bike
	[487]=6, --Maverick
	[497]=6, --PoliceMaverick
	[453]=6, --Reffer
	[411]=4, --Infernus
	[515]=9,  --rdt
	[415]=5, --Cheetah
	[541]=5, --Bullet
	[429]=5, --Bannshe
	[480]=1,--Comet
	[402]=9, --Buffalo
	[495]=4, --SandKing
	[560]=5, --Sultan
	[579]=5, --Huntley
	[562]=6, --Elegy
	[482]=9, --Burrito
	[496]=9,--BlistaCompact
	[475]=9, --Sabre
	[507]=9, --Elegant
	[551]=9, --Merit
	[522]=9, --NRG500
	[461]=9, --PCJ600
	[420]=9, --Taxi
	[416]=9, --Karetka
	[417]=2,  --Leviatan
	[511]=2,  --Beagle
	[593]=20,  --Dodo
	[471]=9,  --Quad
	[500]=9,  --Mesa
	[542]=9,  --Clover
	[447]=9,  --SeaSparrow
	[494]=6,  --HotringRacer
	[550]=9,  --Sunrise
	[445]=9,  --Admiral
	[525]=9,  --TowTruck
	[601]=0.3, --Swat
	[469]=9,  --Sparrow
	[506]=9,  --Supergt
	[400]=2,  --LandStarker
	[528]=2,  --FBI truck
	[483]=6,  --Camper
	[565]=9,  --Flash
	[578]=9,  --DFT-30
	[451]=2,  --Turismo
	[596]=2,  --PoliceLS
	[416]=5,  --Ambulans
	[502]=3,  --PoliceLS
	[503]=3,  --PoliceLS
},
["Barrett M107"] = {
	[422]=150, --Bobcat
	[470]=30, --Patriot
	[468]=150, --Sanchez
	[433]=150, --Barrack
	[437]=150, --Coach
	[509]=0,  --Bike
	[487]=150, --Maverick
	[497]=150, --PoliceMaverick
	[453]=150, --Reffer
	[411]=200, --Infernus
	[415]=150, --Cheetah
	[541]=150, --Bullet
	[429]=150, --Bannshe
	[480]=150,--Comet
	[402]=150, --Buffalo
	[495]=150, --SandKing
	[560]=150, --Sultan
	[579]=150, --Huntley
	[562]=150, --Elegy
	[482]=150, --Burrito
	[496]=150,--BlistaCompact
	[515]=50,  --rdt
	[475]=150, --Sabre
	[507]=150, --Elegant
	[551]=150, --Merit
	[522]=150, --NRG500
	[461]=150, --PCJ600
	[420]=150, --Taxi
	[416]=150, --Karetka
	[417]=60,  --Leviatan
	[511]=150,  --Beagle
	[593]=80,  --Dodo
	[471]=150,  --Quad
	[500]=150,  --Mesa
	[542]=150,  --Clover
	[447]=150,  --SeaSparrow
	[494]=150,  --HotringRacer
	[550]=150,  --Sunrise
	[445]=150,  --Admiral
	[525]=150,  --TowTruck
	[601]=90, --Swat
	[469]=150,  --Sparrow
	[506]=150,  --Supergt
	[400]=150,  --LandStarker
	[528]=150,  --FBI truck
	[483]=150,  --Camper
	[565]=150,  --Flash
	[578]=150,  --DFT-30
	[451]=150,  --Turismo
	[596]=150,  --PoliceLS
	[416]=150,  --Ambulans
	[502]=150,  --PoliceLS
	[503]=150,  --PoliceLS
},
["M1911"] = {
	[422]=10, --Bobcat
	[470]=2, --Patriot
	[468]=10, --Sanchez
	[433]=2, --Barrack
	[437]=10, --Coach
	[509]=0,  --Bike
	[487]=6, --Maverick
	[497]=6, --PoliceMaverick
	[453]=6, --Reffer
	[411]=4, --Infernus
	[415]=5, --Cheetah
	[515]=9,  --rdt
	[541]=5, --Bullet
	[429]=5, --Bannshe
	[480]=1,--Comet
	[402]=9, --Buffalo
	[495]=4, --SandKing
	[560]=5, --Sultan
	[579]=5, --Huntley
	[562]=6, --Elegy
	[482]=9, --Burrito
	[496]=9,--BlistaCompact
	[475]=9, --Sabre
	[507]=9, --Elegant
	[551]=9, --Merit
	[522]=9, --NRG500
	[461]=9, --PCJ600
	[420]=9, --Taxi
	[416]=9, --Karetka
	[417]=2,  --Leviatan
	[511]=2,  --Beagle
	[593]=5,  --Dodo
	[471]=9,  --Quad
	[500]=9,  --Mesa
	[542]=9,  --Clover
	[447]=9,  --SeaSparrow
	[494]=6,  --HotringRacer
	[550]=9,  --Sunrise
	[445]=9,  --Admiral
	[525]=9,  --TowTruck
	[601]=0.3, --Swat
	[469]=9,  --Sparrow
	[506]=9,  --Supergt
	[400]=2,  --LandStarker
	[528]=2,  --FBI truck
	[483]=6,  --Camper
	[565]=9,  --Flash
	[578]=9,  --DFT-30
	[451]=1,  --Turismo
	[596]=2,  --PoliceLS
	[416]=5,  --Ambulans
	[502]=4,  --PoliceLS
	[503]=4,  --PoliceLS
},
["M9 SD"] = {
	[422]=10, --Bobcat
	[470]=2, --Patriot
	[468]=10, --Sanchez
	[433]=2, --Barrack
	[437]=10, --Coach
	[509]=0,  --Bike
	[487]=6, --Maverick
	[497]=6, --PoliceMaverick
	[453]=6, --Reffer
	[411]=4, --Infernus
	[415]=5, --Cheetah
	[515]=9,  --rdt
	[541]=5, --Bullet
	[429]=5, --Bannshe
	[480]=1,--Comet
	[402]=9, --Buffalo
	[495]=4, --SandKing
	[560]=5, --Sultan
	[579]=5, --Huntley
	[562]=6, --Elegy
	[482]=9, --Burrito
	[496]=9,--BlistaCompact
	[475]=9, --Sabre
	[507]=9, --Elegant
	[551]=9, --Merit
	[522]=9, --NRG500
	[461]=9, --PCJ600
	[420]=9, --Taxi
	[416]=9, --Karetka
	[417]=2,  --Leviatan
	[511]=2,  --Beagle
	[593]=5,  --Dodo
	[471]=9,  --Quad
	[500]=9,  --Mesa
	[542]=9,  --Clover
	[447]=9,  --SeaSparrow
	[494]=6,  --HotringRacer
	[550]=9,  --Sunrise
	[445]=9,  --Admiral
	[525]=9,  --TowTruck
	[601]=0.3, --Swat
	[469]=9,  --Sparrow
	[506]=9,  --Supergt
	[400]=2,  --LandStarker
	[528]=2,  --FBI truck
	[483]=6,  --Camper
	[565]=9,  --Flash
	[578]=9,  --DFT-30
	[451]=2,  --Turismo
	[596]=2,  --PoliceLS
	[416]=5,  --Ambulans
	[502]=9,  --PoliceLS
	[503]=9,  --PoliceLS
},
["Desert Eagle"] = {
	[422]=10, --Bobcat
	[470]=3, --Patriot
	[468]=10, --Sanchez
	[433]=2, --Barrack
	[437]=10, --Coach
	[509]=0,  --Bike
	[487]=6, --Maverick
	[497]=6, --PoliceMaverick
	[453]=6, --Reffer
	[411]=9, --Infernus
	[415]=9, --Cheetah
	[541]=9, --Bullet
	[429]=9, --Bannshe
	[480]=4,--Comet
	[402]=9, --Buffalo
	[495]=4, --SandKing
	[560]=9, --Sultan
	[579]=9, --Huntley
	[515]=9,  --rdt
	[562]=9, --Elegy
	[482]=9, --Burrito
	[496]=9,--BlistaCompact
	[475]=9, --Sabre
	[507]=9, --Elegant
	[551]=9, --Merit
	[522]=9, --NRG500
	[461]=9, --PCJ600
	[420]=9, --Taxi
	[416]=9, --Karetka
	[417]=2,  --Leviatan
	[511]=2,  --Beagle
	[593]=9,  --Dodo
	[471]=9,  --Quad
	[500]=9,  --Mesa
	[542]=9,  --Clover
	[447]=9,  --SeaSparrow
	[494]=9,  --HotringRacer
	[550]=9,  --Sunrise
	[445]=9,  --Admiral
	[525]=9,  --TowTruck
	[601]=0.3, --Swat
	[469]=9,  --Sparrow
	[506]=9,  --Supergt
	[400]=2,  --LandStarker
	[528]=2,  --FBI truck
	[483]=9,  --Camper
	[565]=9,  --Flash
	[578]=9,  --DFT-30
	[451]=9,  --Turismo
	[596]=9,  --PoliceLS
	[502]=9,  --PoliceLS
	[503]=9,  --PoliceLS
},
["PDW"] = {
	[422]=10, --Bobcat
	[470]=3, --Patriot
	[468]=10, --Sanchez
	[433]=2, --Barrack
	[437]=10, --Coach
	[509]=0,  --Bike
	[487]=6, --Maverick
	[497]=6, --PoliceMaverick
	[453]=6, --Reffer
	[515]=9,  --rdt
	[411]=9, --Infernus
	[415]=9, --Cheetah
	[541]=9, --Bullet
	[429]=9, --Bannshe
	[480]=4,--Comet
	[402]=9, --Buffalo
	[495]=4, --SandKing
	[560]=9, --Sultan
	[579]=9, --Huntley
	[562]=9, --Elegy
	[482]=9, --Burrito
	[496]=9,--BlistaCompact
	[475]=9, --Sabre
	[507]=9, --Elegant
	[551]=9, --Merit
	[522]=9, --NRG500
	[461]=9, --PCJ600
	[420]=9, --Taxi
	[416]=9, --Karetka
	[417]=2,  --Leviatan
	[511]=2,  --Beagle
	[593]=9,  --Dodo
	[471]=9,  --Quad
	[500]=9,  --Mesa
	[542]=9,  --Clover
	[447]=9,  --SeaSparrow
	[494]=9,  --HotringRacer
	[550]=9,  --Sunrise
	[445]=9,  --Admiral
	[525]=9,  --TowTruck
	[601]=0.3, --Swat
	[469]=9,  --Sparrow
	[506]=9,  --Supergt
	[400]=2,  --LandStarker
	[528]=2,  --FBI truck
	[483]=9,  --Camper
	[565]=9,  --Flash
	[578]=9,  --DFT-30
	[451]=9,  --Turismo
	[596]=9,  --PoliceLS
	[502]=9,  --PoliceLS
	[503]=9,  --PoliceLS
},
["MP5A5"] = {
	[422]=10, --Bobcat
	[470]=3, --Patriot
	[468]=10, --Sanchez
	[433]=2, --Barrack
	[437]=10, --Coach
	[509]=0,  --Bike
	[487]=6, --Maverick
	[497]=6, --PoliceMaverick
	[453]=6, --Reffer
	[411]=9, --Infernus
	[415]=9, --Cheetah
	[541]=9, --Bullet
	[429]=9, --Bannshe
	[480]=4,--Comet
	[402]=9, --Buffalo
	[495]=4, --SandKing
	[560]=9, --Sultan
	[579]=9, --Huntley
	[562]=9, --Elegy
	[515]=9,  --rdt
	[482]=9, --Burrito
	[496]=9,--BlistaCompact
	[475]=9, --Sabre
	[507]=9, --Elegant
	[551]=9, --Merit
	[522]=9, --NRG500
	[461]=9, --PCJ600
	[420]=9, --Taxi
	[416]=9, --Karetka
	[417]=2,  --Leviatan
	[511]=2,  --Beagle
	[593]=9,  --Dodo
	[471]=9,  --Quad
	[500]=9,  --Mesa
	[542]=9,  --Clover
	[447]=9,  --SeaSparrow
	[494]=9,  --HotringRacer
	[550]=9,  --Sunrise
	[445]=9,  --Admiral
	[525]=9,  --TowTruck
	[601]=0.3, --Swat
	[469]=9,  --Sparrow
	[506]=9,  --Supergt
	[400]=2,  --LandStarker
	[528]=2,  --FBI truck
	[483]=9,  --Camper
	[565]=9,  --Flash
	[578]=9,  --DFT-30
	[451]=9,  --Turismo
	[596]=9,  --PoliceLS
	[502]=9,  --PoliceLS
	[503]=9,  --PoliceLS
},
["Winchester 1866"] = {
	[422]=10, --Bobcat
	[470]=3, --Patriot
	[468]=10, --Sanchez
	[433]=2, --Barrack
	[437]=10, --Coach
	[509]=0,  --Bike
	[487]=6, --Maverick
	[497]=6, --PoliceMaverick
	[453]=6, --Reffer
	[411]=9, --Infernus
	[515]=9,  --rdt
	[415]=9, --Cheetah
	[541]=9, --Bullet
	[429]=9, --Bannshe
	[480]=4,--Comet
	[402]=9, --Buffalo
	[495]=4, --SandKing
	[560]=9, --Sultan
	[579]=9, --Huntley
	[562]=9, --Elegy
	[482]=9, --Burrito
	[496]=9,--BlistaCompact
	[475]=9, --Sabre
	[507]=9, --Elegant
	[551]=9, --Merit
	[522]=9, --NRG500
	[461]=9, --PCJ600
	[420]=9, --Taxi
	[416]=9, --Karetka
	[417]=2,  --Leviatan
	[511]=2,  --Beagle
	[593]=9,  --Dodo
	[471]=9,  --Quad
	[500]=9,  --Mesa
	[542]=9,  --Clover
	[447]=9,  --SeaSparrow
	[494]=9,  --HotringRacer
	[550]=9,  --Sunrise
	[445]=9,  --Admiral
	[525]=9,  --TowTruck
	[601]=0.3, --Swat
	[469]=9,  --Sparrow
	[506]=9,  --Supergt
	[400]=2,  --LandStarker
	[528]=2,  --FBI truck
	[483]=9,  --Camper
	[565]=9,  --Flash
	[578]=9,  --DFT-30
	[451]=9,  --Turismo
	[596]=9,  --PoliceLS
	[502]=9,  --PoliceLS
	[503]=9,  --PoliceLS
},
["Sawn-Off Shotgun"] = {
	[422]=10, --Bobcat
	[470]=3, --Patriot
	[468]=10, --Sanchez
	[433]=2, --Barrack
	[437]=10, --Coach
	[509]=0,  --Bike
	[487]=6, --Maverick
	[497]=6, --PoliceMaverick
	[453]=6, --Reffer
	[411]=9, --Infernus
	[415]=9, --Cheetah
	[541]=9, --Bullet
	[429]=9, --Bannshe
	[480]=4,--Comet
	[402]=9, --Buffalo
	[495]=4, --SandKing
	[560]=9, --Sultan
	[579]=9, --Huntley
	[562]=9, --Elegy
	[482]=9, --Burrito
	[515]=9,  --rdt
	[496]=9,--BlistaCompact
	[475]=9, --Sabre
	[507]=9, --Elegant
	[551]=9, --Merit
	[522]=9, --NRG500
	[461]=9, --PCJ600
	[420]=9, --Taxi
	[416]=9, --Karetka
	[417]=2,  --Leviatan
	[511]=2,  --Beagle
	[593]=9,  --Dodo
	[471]=9,  --Quad
	[500]=9,  --Mesa
	[542]=9,  --Clover
	[447]=9,  --SeaSparrow
	[494]=9,  --HotringRacer
	[550]=9,  --Sunrise
	[445]=9,  --Admiral
	[525]=9,  --TowTruck
	[601]=0.3, --Swat
	[469]=9,  --Sparrow
	[506]=9,  --Supergt
	[400]=2,  --LandStarker
	[528]=2,  --FBI truck
	[483]=9,  --Camper
	[565]=9,  --Flash
	[578]=9,  --DFT-30
	[451]=9,  --Turismo
	[596]=9,  --PoliceLS
	[502]=9,  --PoliceLS
	[503]=9,  --PoliceLS
},
["SPAZ-12 Combat Shotgun"] = {
	[422]=10, --Bobcat
	[470]=3, --Patriot
	[468]=10, --Sanchez
	[433]=2, --Barrack
	[437]=10, --Coach
	[509]=0,  --Bike
	[487]=6, --Maverick
	[497]=6, --PoliceMaverick
	[453]=6, --Reffer
	[411]=9, --Infernus
	[415]=9, --Cheetah
	[541]=9, --Bullet
	[429]=9, --Bannshe
	[480]=4,--Comet
	[402]=9, --Buffalo
	[515]=9,  --rdt
	[495]=4, --SandKing
	[560]=9, --Sultan
	[579]=9, --Huntley
	[562]=9, --Elegy
	[482]=9, --Burrito
	[496]=9,--BlistaCompact
	[475]=9, --Sabre
	[507]=9, --Elegant
	[551]=9, --Merit
	[522]=9, --NRG500
	[461]=9, --PCJ600
	[420]=9, --Taxi
	[416]=9, --Karetka
	[417]=2,  --Leviatan
	[511]=2,  --Beagle
	[593]=9,  --Dodo
	[471]=9,  --Quad
	[500]=9,  --Mesa
	[542]=9,  --Clover
	[447]=9,  --SeaSparrow
	[494]=9,  --HotringRacer
	[550]=9,  --Sunrise
	[445]=9,  --Admiral
	[525]=9,  --TowTruck
	[601]=0.3, --Swat
	[469]=9,  --Sparrow
	[506]=9,  --Supergt
	[400]=2,  --LandStarker
	[528]=2,  --FBI truck
	[483]=9,  --Camper
	[565]=9,  --Flash
	[578]=9,  --DFT-30
	[451]=9,  --Turismo
	[596]=9,  --PoliceLS
	[502]=9,  --PoliceLS
	[503]=9,  --PoliceLS
},
["Lee Enfield"] = {
	[422]=10, --Bobcat
	[470]=3, --Patriot
	[468]=10, --Sanchez
	[433]=2, --Barrack
	[437]=10, --Coach
	[509]=0,  --Bike
	[487]=6, --Maverick
	[497]=6, --PoliceMaverick
	[453]=6, --Reffer
	[411]=9, --Infernus
	[415]=9, --Cheetah
	[541]=9, --Bullet
	[429]=9, --Bannshe
	[480]=4,--Comet
	[402]=9, --Buffalo
	[495]=4, --SandKing
	[560]=9, --Sultan
	[515]=9,  --rdt
	[579]=9, --Huntley
	[562]=9, --Elegy
	[482]=9, --Burrito
	[496]=9,--BlistaCompact
	[475]=9, --Sabre
	[507]=9, --Elegant
	[551]=9, --Merit
	[522]=9, --NRG500
	[461]=9, --PCJ600
	[420]=9, --Taxi
	[416]=9, --Karetka
	[417]=2,  --Leviatan
	[511]=2,  --Beagle
	[593]=9,  --Dodo
	[471]=9,  --Quad
	[500]=9,  --Mesa
	[542]=9,  --Clover
	[447]=9,  --SeaSparrow
	[494]=9,  --HotringRacer
	[550]=9,  --Sunrise
	[445]=9,  --Admiral
	[525]=9,  --TowTruck
	[601]=0.3, --Swat
	[469]=9,  --Sparrow
	[506]=9,  --Supergt
	[400]=2,  --LandStarker
	[528]=2,  --FBI truck
	[483]=9,  --Camper
	[565]=9,  --Flash
	[578]=9,  --DFT-30
	[451]=9,  --Turismo
	[596]=9,  --PoliceLS
	[502]=9,  --PoliceLS
	[503]=9,  --PoliceLS
},
}

function getElementSpeed(theElement, unit)
    -- Check arguments for errors
    assert(isElement(theElement), "Bad argument 1 @ getElementSpeed (element expected, got " .. type(theElement) .. ")")
    local elementType = getElementType(theElement)
    assert(elementType == "player" or elementType == "ped" or elementType == "object" or elementType == "vehicle" or elementType == "projectile", "Invalid element type @ getElementSpeed (player/ped/object/vehicle/projectile expected, got " .. elementType .. ")")
    assert((unit == nil or type(unit) == "string" or type(unit) == "number") and (unit == nil or (tonumber(unit) and (tonumber(unit) == 0 or tonumber(unit) == 1 or tonumber(unit) == 2)) or unit == "m/s" or unit == "km/h" or unit == "mph"), "Bad argument 2 @ getElementSpeed (invalid speed unit)")
    -- Default to m/s if no unit specified and 'ignore' argument type if the string contains a number
    unit = unit == nil and 0 or ((not tonumber(unit)) and unit or tonumber(unit))
    -- Setup our multiplier to convert the velocity to the specified unit
    local mult = (unit == 0 or unit == "m/s") and 50 or ((unit == 1 or unit == "km/h") and 180 or 111.84681456)
    -- Return the speed by calculating the length of the velocity vector, after converting the velocity to the specified unit
    return (Vector3(getElementVelocity(theElement)) * mult).length
end
--[[
local timer = {}

function checkSomething(car)
	timer[car] = nil
	local rx,ry = getElementRotation ( car ) 
	if rx > 90 and rx < 270 or ry > 90 and ry < 270 then  
		setElementHealth ( car, 1000 )
		timer[car] = setTimer(checkSomething,1000,1,car)
	end
end

addEventHandler ( "onClientVehicleCollision", root, function ( ) 
      -- If you want it to take damage, but not explode -- 
      -- if getElementHealth ( source ) < 300 then         -- dunno if 300 is good, test it 
            local rx,ry = getElementRotation ( source ) 
		--	outputChatBox("rx: "..rx)
		--	outputChatBox("ry: "..ry)
            if rx > 90 and rx < 270 or ry > 90 and ry < 270 then  
                  cancelEvent() 
                  -- If it was burning before -- 
                  if getElementHealth ( source ) < 300 then 
                        setElementHealth ( source, 300 )       -- dunno if 300 is good, test it 
						if not timer[source] then
							timer[source] = setTimer(checkSomething,1000,1,source)
						end
                  end 
            end    
      --end 
end ) ]]

local weaponslots = {
	[25] = 1, [26] = 1, [27] = 1,
	[30] = 1, [31] = 1, [33] = 1,
	[34] = 1, [2]  = 2, [4]  = 2,
	[5]  = 2, [6]  = 2, [8]  = 2,
	[22] = 2, [23] = 2, [24] = 2,
	[29] = 2, [16] = 3, [17] = 3,
	[46] = 3, [43] = 3, [39] = 3
};

function getWeapon()
	if weaponslots[getPedWeapon(localPlayer)] then
		local bron = getElementData(localPlayer,"currentweapon_"..weaponslots[getPedWeapon(localPlayer)])
		return bron
	end
	return false
end

addEventHandler("onClientVehicleDamage",root,function(attacker,weapon,loss,dmgx,dmgy,dmgz,tireid)
	if tireid then return end
	if isVehicleDamageProof(source) then cancelEvent() return end
	if attacker and getElementType(attacker) == "player" then
		if weapon and getWeapon() and weapon_table[getWeapon()][getElementModel(source)] then
			cancelEvent()
			if attacker == localPlayer then
				--setElementHealth(source,getElementHealth(source)-weapon_table[getWeapon()][getElementModel(source)])
				triggerServerEvent("setCarHealth",resourceRoot,source,weapon_table[getWeapon()][getElementModel(source)])
			end
		end
		--[[elseif getElementData(source, "lista-metalu") == true then
		local hp = getElementHealth(source)
			setElementHealth(source, hp - 5)
		else
		local hp = getElementHealth(source)
			setElementHealth(source, hp - 40)
			]]
	end
end)


---------------------------------------Eagle7---------------------------------------
most_state55 = 0
most_obiekt55 = createObject(8378,1312.1999511719,9.6000003814697,42.299999237061,0,0,180)

addCommandHandler("ESod1do10jdjp3s", function (p, c)
if not getElementData(p, "Grupa").nazwa == "Eagle7" then return end
	if most_state55 == 0 then	
		moveObject(most_obiekt55,3000, 1312.1999511719,9.6000003814697,20.299999237061)
		outputChatBox("#d63838[!] #8A8A8AObecny status bramy: #5aad5aOtwarta", p,0,230,30, true)
		most_state55 = 1
	else
		moveObject(most_obiekt55,3000, 1312.1999511719,9.6000003814697,42.299999237061)
		outputChatBox("#d63838[!] #8A8A8AObecny status bramy: #a63a3aZamknięta", p,0,230,30, true)
		most_state55 = 0
	end
end)

most_state66 = 0
most_obiekt66 = createObject(5706,1311.0999755859,64.400001525879,28.799999237061,0,0,0)

addCommandHandler("si3m43loct351", function (p, c)
if not getElementData(p, "Grupa").nazwa == "Eagle7" then return end
	if most_state66 == 0 then
		moveObject(most_obiekt66,3000, 1311.0999755859,64.400001525879,21.799999237061)
		outputChatBox("#d63838[!] #8A8A8AObecny status windy: #5aad5aOtwarta", p,0,230,30, true)
		most_state66 = 1
	else
		moveObject(most_obiekt66,3000, 1311.0999755859,64.400001525879,28.799999237061)
		outputChatBox("#d63838[!] #8A8A8AObecny status windy: #a63a3aZamknięta", p,0,230,30, true)
		most_state66 = 0
	end
end)

---------------------------------------PlayHardy---------------------------------------

most_state = 0
most_obiekt = createObject(10828,-321.60000610352,1536.4000244141,99.699996948242,0,0,0)

addCommandHandler("dach", function (p, c)
if not getElementData(p, "Grupa").nazwa == "PlayHard" then return end
	if most_state == 0 then	
		moveObject(most_obiekt,3000, -321.60000610352,1536.4000244141,110.90000152588)
                outputChatBox("#d63838[!] #8A8A8AObecny status bramy: #5aad5aOtwarta", p,0,230,30, true)
		most_state = 1
	else
		moveObject(most_obiekt,3000, -321.60000610352,1536.4000244141,99.699996948242)
                outputChatBox("#d63838[!] #8A8A8AObecny status bramy: #a63a3aZamknięta", p,0,230,30, true)
		most_state = 0
	end
end)

most_state1 = 0
most_obiekt1 = createObject(16501,-280.29998779297,1529.3000488281,78.5,0,0,0)

addCommandHandler("Jokerr", function (p, c)
if not getElementData(p, "Grupa").nazwa == "PlayHard" then return end
	if most_state1 == 0 then
		moveObject(most_obiekt1,3000, -280.29998779297,1529.3000488281,74.099998474121)
                outputChatBox("#d63838[!] #8A8A8AObecny status szopy: #5aad5aOtwarta", p,0,230,30, true)
		most_state1 = 1
	else
		moveObject(most_obiekt1,3000, -280.29998779297,1529.3000488281,78.5,0,0,0)
                outputChatBox("#d63838[!] #8A8A8AObecny status szopy: #a63a3aZamknięta", p,0,230,30, true)
		most_state1 = 0
	end
end)

most_state2 = 0
most_obiekt2 = createObject(16501,-280.29998779297,1515.5999755859,78.5,0,0,0)

addCommandHandler("szopa2", function (p, c)
if not getElementData(p, "Grupa").nazwa == "PlayHard" then return end
	if most_state2 == 0 then
		moveObject(most_obiekt2,3000, -280.29998779297,1515.5999755859,74.099998474121)
                outputChatBox("#d63838[!] #8A8A8AObecny status szopy: #5aad5aOtwarta", p,0,230,30, true)
		most_state2 = 1
	else
		moveObject(most_obiekt2,3000, -280.29998779297,1515.5999755859,78.5)
                outputChatBox("#d63838[!] #8A8A8AObecny status szopy: #a63a3aZamknięta", p,0,230,30, true)
		most_state2 = 0
	end
end)
most_state3 = 0
most_obiekt3 = createObject(16501,-352.39999389648,1514.8000488281,78.5,0,0,0)

addCommandHandler("szopa3", function (p, c)
if not getElementData(p, "Grupa").nazwa == "PlayHard" then return end
	if most_state3 == 0 then
		moveObject(most_obiekt3,3000, -352.39999389648,1514.8000488281,74.099998474121)
                outputChatBox("#d63838[!] #8A8A8AObecny status szopy: #5aad5aOtwarta", p,0,230,30, true)
		most_state3 = 1
	else
		moveObject(most_obiekt3,3000, -352.39999389648,1514.8000488281,78.5)
                outputChatBox("#d63838[!] #8A8A8AObecny status szopy: #a63a3aZamknięta", p,0,230,30, true)
		most_state3 = 0
	end
end)
most_state4 = 0
most_obiekt4 = createObject(16501,-352.39999389648,1528.5,78.5,0,0,0)

addCommandHandler("szopa4", function (p, c)
if not getElementData(p, "Grupa").nazwa == "PlayHard" then return end
	if most_state4 == 0 then
		moveObject(most_obiekt4,3000, -352.39999389648,1528.5,74.099998474121)
                outputChatBox("#d63838[!] #8A8A8AObecny status szopy: #5aad5aOtwarta", p,0,230,30, true)
		most_state4 = 1
	else
		moveObject(most_obiekt4,3000, -352.39999389648,1528.5,78.5)
                outputChatBox("#d63838[!] #8A8A8AObecny status szopy: #a63a3aZamknięta", p,0,230,30, true)
		most_state4 = 0
	end
end)

---------------------------------------FamilyContent---------------------------------------

most_state10 = 0
most_obiekt10 = createObject(10828,184.19999694824,1370.5,32.700000762939,90,0,0)

addCommandHandler("stp4H2", function (p, c)
if not getElementData(p, "Grupa").nazwa == "familycontent" then return end
	if most_state10 == 0 then	
		moveObject(most_obiekt10,3000, 214.19999694824,1370.5,32.730000762939)
                outputChatBox("#d63838[!] #8A8A8AObecny status bramy: #5aad5aOtwarta", p,0,230,30, true)
		most_state10 = 1
	else
		moveObject(most_obiekt10,3000, 184.19999694824,1370.5,32.700000762939)
                outputChatBox("#d63838[!] #8A8A8AObecny status bramy: #a63a3aZamknięta", p,0,230,30, true)
		most_state10 = 0
	end
end)

most_state11 = 0
most_obiekt11 = createObject(10828,141.5,1351,33.299999237061,0,0,90)

addCommandHandler("KS4s1D", function (p, c)
if not getElementData(p, "Grupa").nazwa == "familycontent" then return end
	if most_state11 == 0 then	
		moveObject(most_obiekt11,3000, 141.5,1351,21.5)
                outputChatBox("#d63838[!] #8A8A8AObecny status bramy: #5aad5aOtwarta", p,0,230,30, true)
		most_state11 = 1
	else
		moveObject(most_obiekt11,3000, 141.5,1351,33.299999237061)
                outputChatBox("#d63838[!] #8A8A8AObecny status bramy: #a63a3aZamknięta", p,0,230,30, true)
		most_state11 = 0
	end
end)

most_state12 = 0
most_obiekt12 = createObject(10828,140.60000610352,1440.0999755859,21.5,0,0,90)

addCommandHandler("P5fS7a", function (p, c)
if not getElementData(p, "Grupa").nazwa == "familycontent" then return end
	if most_state12 == 0 then	
		moveObject(most_obiekt12,3000, 140.60000610352,1440.0999755859,8.8000001907349)
                outputChatBox("#d63838[!] #8A8A8AObecny status bramy: #5aad5aOtwarta", p,0,230,30, true)
		most_state12 = 1
	else
		moveObject(most_obiekt12,3000, 140.60000610352,1440.0999755859,21.5)
                outputChatBox("#d63838[!] #8A8A8AObecny status bramy: #a63a3aZamknięta", p,0,230,30, true)
		most_state12 = 0
	end
end)

most_state13 = 0
most_obiekt13 = createObject(10828,140.5,1470,33.299999237061,0,0,90)

addCommandHandler("Jd8s2H", function (p, c)
if not getElementData(p, "Grupa").nazwa == "familycontent" then return end
	if most_state13 == 0 then	
		moveObject(most_obiekt13,3000, 140.5,1470,21.5)
                outputChatBox("#d63838[!] #8A8A8AObecny status bramy: #5aad5aOtwarta", p,0,230,30, true)
		most_state13 = 1
	else
		moveObject(most_obiekt13,3000, 140.5,1470,33.299999237061)
                outputChatBox("#d63838[!] #8A8A8AObecny status bramy: #a63a3aZamknięta", p,0,230,30, true)
		most_state13 = 0
	end
end)

most_state14 = 0
most_obiekt14 = createObject(10828,139,1408.8000488281,45.099998474121,0,0,90)

addCommandHandler("P4H1TK", function (p, c)
if not getElementData(p, "Grupa").nazwa == "familycontent" then return end
	if most_state14 == 0 then	
		moveObject(most_obiekt14,3000, 139.10000610352,1408.8000488281,56.700000762939)
                outputChatBox("#d63838[!] #8A8A8AObecny status bramy: #5aad5aOtwarta", p,0,230,30, true)
		most_state14 = 1
	else
		moveObject(most_obiekt14,3000, 139,1408.8000488281,45.099998474121)
                outputChatBox("#d63838[!] #8A8A8AObecny status bramy: #a63a3aZamknięta", p,0,230,30, true)
		most_state14 = 0
	end
end)
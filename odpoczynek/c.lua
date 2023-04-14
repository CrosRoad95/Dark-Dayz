
function Class(tbl)
	setmetatable(tbl,{
		__call = function(cls, ...)
			local self = {}
			
			setmetatable(self,{
				__index = cls
			})
			self:constructor(...)
			return self
		end
	})
	return tbl
end

function getItemRealSlot(name)
	return sloty[name] or 1;
end

DayZ_table = Class({
	constructor = function(self, name, slot)
		self.setItemName(self, name)
		self.setItemSlot(self, slot)
	end;
	
	setItemName = function(self, name)
		
		self.name = name
	end;
	
	getItemSlot = function(self)
		return self.slot
	end;
	
	setItemSlot = function(self)
		self.slot = getItemRealSlot(self.name)
	end;
})


--[[
	Name: Minecraft
	Filename: ModelHandlerC.lua
	Authors: Sam@ke
--]]


ModelHandlerC = {}

function ModelHandlerC:constructor(parent)
	mainOutput("ModelHandlerC was loaded.")
	
	self.mainClass = parent
	self.lodDistance = 300
	
	self.texturePack = engineLoadTXD("res/models/minecraft.txd")
	self.blockCol = engineLoadCOL("res/models/blockCol.col")
	
	-- // terrain // --
	self.terrainID = 15049
	self.terrainModel = engineLoadDFF("res/models/terrainPlane.dff", self.terrainID)
	self.terrainCol = engineLoadCOL("res/models/terrainCol.col")
		
	engineImportTXD(self.texturePack, self.terrainID)
	engineReplaceModel(self.terrainModel, self.terrainID)
	engineReplaceCOL(self.terrainCol, self.terrainID)
	
	-- // blocks // --
	-- ids 1851 - 1882
	
	self.blockStoneID = 1851
	self.blockStoneModel = engineLoadDFF("res/models/stoneBlock.dff", self.terrainID)
		
	engineImportTXD(self.texturePack, self.blockStoneID)
	engineReplaceModel(self.blockStoneModel, self.blockStoneID)
	engineReplaceCOL(self.blockCol, self.blockStoneID)
	
	self.blockDirtID = 1852
	self.blockDirtModel = engineLoadDFF("res/models/dirtBlock.dff", self.terrainID)
		
	engineImportTXD(self.texturePack, self.blockDirtID)
	engineReplaceModel(self.blockDirtModel, self.blockDirtID)
	engineReplaceCOL(self.blockCol, self.blockDirtID)
	
	
	self.blockGrassID = 1853
	self.blockGrassModel = engineLoadDFF("res/models/grassBlock.dff", self.terrainID)
		
	engineImportTXD(self.texturePack, self.blockGrassID)
	engineReplaceModel(self.blockGrassModel, self.blockGrassID)
	engineReplaceCOL(self.blockCol, self.blockGrassID)
	
	self.grassPlantID = 1854
	self.grassPlantModel = engineLoadDFF("res/models/grassPlant.dff", self.terrainID)
		
	engineImportTXD(self.texturePack, self.grassPlantID)
	engineReplaceModel(self.grassPlantModel, self.grassPlantID)
	
	self.blockSandID = 1855
	self.blockSandModel = engineLoadDFF("res/models/sandBlock.dff", self.terrainID)
		
	engineImportTXD(self.texturePack, self.blockSandID)
	engineReplaceModel(self.blockSandModel, self.blockSandID)
	engineReplaceCOL(self.blockCol, self.blockSandID)

	self:setLodDistance()
end


function ModelHandlerC:setLodDistance()
	for index, object in ipairs(getElementsByType("object")) do
		if isElement(object) and (object:isLowLOD()) then
			local modelID = object:getModel()
			engineSetModelLODDistance(modelID, self.lodDistance)
		end
		
		object:setDoubleSided(true)
	end
end


function ModelHandlerC:destructor()
	
	mainOutput("ModelHandlerC was deleted.")
end
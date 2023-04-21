# CraftTweaker_API_1.19.2
 API for CraftTweaker


 -IInventoryHelper-
 
 getPlayerInventorySize(player as Player) as void
 getItem(player as Player, item as IItemStack) as void
 clearInventory(player as Player) as void 
 setCruios(player as Player, item as IItemStack, index as int, type as string) as void
 removeCurios(player as Player, index as int, type as string) as void
 setSaveInventory(player as Player) as void
 setSaveInventoryItem(player as Player, index as int) as void
 getSaveInvenortItem(index as int) as IItemStack
 giveInventoryItem(player as Player, index as int) as void
 clearVariables() as void


 -IPlayer-
 
 setPropertyP(player as Player, type as int, UUID as string) as void
 setPropertyE(player as Entity, type as int, UUID as string) as void
 getPlayer() as Player
 isEmpty(player as Player, index as int) as bool
 addData(player as Player, data as MapData, stage as string[]) as void
 giveData(player as Player) as void
 saveData(player as Player) as void
 DestroyZone(player as Player, level as Level, x1 as int, y1 as int, z1 as int) as bool
 CheckBlock(block as BlockState, blocks as IItemStack[]) as bool


 -PlayerEventBlock-

 setPlayer(player as Player) as void
 setTransBlock(block as Block, block2 as BlockState) as void
 savePlayerBlock(player as Player, Block as BlockState, BlockPos as BlockPos) as void
 saveBlockPos(block as BlockState, bPos as BlockPos) as void
 setOreData(block as BlockState, bPos as BlockPos) as void
 setRandomBlock (block as BlockState[]) as void
 setOreReplace(block as BlockState, block2 as Block) as void

 getPlayer(player as Player) as Player
 getTransBlock() as BlockState[Block]
 getUUID(player as Player) as string
 setBlackListTBlock(block as Block[]) as void
 getBlackListTBlock() as Block[]
 getPlayerBlock(player as Player) as BlockState
 getBlockPos(player as Player) as BlockPos
 getSaveBlockPos() as BlockState[BlockPos]
 getRandomBlock() as BlockState[]
 getOreData() as BlockState[BlockPos]
 getOreReplace() as BlockState[Block]
 c() as void

 isEmpty(index as int) as bool

 BackTransmutateBlock(level as Level) as void
 ReplaceOre(mainBlockPos as BlockPos, num as int, level as Level, ran as int) as void
 TransmutateBlock(mainBlockPos as BlockPos, num as int, level as Level, ran as int) as void
 BlockIsAir(block as BlockState) as bool
 isBlackListBlock(block as BlockState) as bool
 BlockTransmutate(block as BlockState) as BlockState
 RandomBlockTransmutate(block as BlockState, level as Level) as BlockState
 oreRep(block as BlockState, type as int) as BlockState
 isOre(b as BlockState) as bool
 transBlock(level as Level) as bool
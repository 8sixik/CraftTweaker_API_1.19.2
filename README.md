# CraftTweaker_API_1.19.2
 API for CraftTweaker/n


 -IInventoryHelper-/n

 getPlayerInventorySize(player as Player) as void/n
 getItem(player as Player, item as IItemStack) as void/n
 clearInventory(player as Player) as void /n
 setCruios(player as Player, item as IItemStack, index as int, type as string) as void/n
 removeCurios(player as Player, index as int, type as string) as void/n
 setSaveInventory(player as Player) as void/n
 setSaveInventoryItem(player as Player, index as int) as void/n
 getSaveInvenortItem(index as int) as IItemStack/n
 giveInventoryItem(player as Player, index as int) as void/n
 clearVariables() as void


 -IPlayer-/n
 
 setPropertyP(player as Player, type as int, UUID as string) as void/n
 setPropertyE(player as Entity, type as int, UUID as string) as void/n
 getPlayer() as Player/n
 isEmpty(player as Player, index as int) as bool/n
 addData(player as Player, data as MapData, stage as string[]) as void/n
 giveData(player as Player) as void/n
 saveData(player as Player) as void/n
 DestroyZone(player as Player, level as Level, x1 as int, y1 as int, z1 as int) as bool/n
 CheckBlock(block as BlockState, blocks as IItemStack[]) as bool/n


 -PlayerEventBlock-/n

 setPlayer(player as Player) as void/n
 setTransBlock(block as Block, block2 as BlockState) as void/n
 savePlayerBlock(player as Player, Block as BlockState, BlockPos as BlockPos) as void/n
 saveBlockPos(block as BlockState, bPos as BlockPos) as void/n
 setOreData(block as BlockState, bPos as BlockPos) as void/n
 setRandomBlock (block as BlockState[]) as void/n
 setOreReplace(block as BlockState, block2 as Block) as void/n

 getPlayer(player as Player) as Player/n
 getTransBlock() as BlockState[Block]/n
 getUUID(player as Player) as string/n
 setBlackListTBlock(block as Block[]) as void/n
 getBlackListTBlock() as Block[]/n
 getPlayerBlock(player as Player) as BlockState/n
 getBlockPos(player as Player) as BlockPos/n
 getSaveBlockPos() as BlockState[BlockPos]/n
 getRandomBlock() as BlockState[]/n
 getOreData() as BlockState[BlockPos]/n
 getOreReplace() as BlockState[Block]/n
 c() as void/n

 isEmpty(index as int) as bool/n

 BackTransmutateBlock(level as Level) as void/n
 ReplaceOre(mainBlockPos as BlockPos, num as int, level as Level, ran as int) as void/n
 TransmutateBlock(mainBlockPos as BlockPos, num as int, level as Level, ran as int) as void/n
 BlockIsAir(block as BlockState) as bool/n
 isBlackListBlock(block as BlockState) as bool/n
 BlockTransmutate(block as BlockState) as BlockState/n
 RandomBlockTransmutate(block as BlockState, level as Level) as BlockState/n
 oreRep(block as BlockState, type as int) as BlockState/n
 isOre(b as BlockState) as bool/n
 transBlock(level as Level) as bool/n
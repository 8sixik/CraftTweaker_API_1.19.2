import crafttweaker.api.events.CTEventManager;
import crafttweaker.api.entity.Entity;
import crafttweaker.api.entity.EntityType;
import crafttweaker.api.entity.type.player.Player;
import crafttweaker.api.block.BlockState;
import crafttweaker.api.world.ServerLevel;
import crafttweaker.api.util.math.BlockPos;
import crafttweaker.api.world.Level;
import crafttweaker.api.block.Block;
import crafttweaker.api.util.math.RandomSource;

public class PlayerEventBlock {
    private static var playerList = {} as Player[string];
    private static var playerPlaceBlock = {} as BlockState[Player];
    private static var playerPlaceBlockPos = {} as BlockPos[Player];
    private static var playerListUUID = {} as string[Player];

    private static var blockData = {} as BlockState[BlockPos];
    private static var blockOreData = {} as BlockState[BlockPos];

    private static var oreReplace = {} as BlockState[Block];
    private static var randomBlock = [] as BlockState[];
    private static var transmutateBlock = {} as BlockState[Block];
    private static var blackListTBlock = [] as Block[];

    public static setPlayer(player as Player) as void {
        this.playerList[player.getStringUUID()] = player;
        this.playerListUUID[player] = player.getStringUUID();
    }
    public static setTransBlock(block as Block, block2 as BlockState) as void {
        this.transmutateBlock[block] = block2;
    }

    public static savePlayerBlock(player as Player, Block as BlockState, BlockPos as BlockPos) as void{
        this.playerPlaceBlock[player] = Block;
        this.playerPlaceBlockPos[player] = BlockPos;
    }
    public static saveBlockPos(block as BlockState, bPos as BlockPos) as void{
        this.blockData[bPos] = block;
    }
    public static setOreData(block as BlockState, bPos as BlockPos) as void{
        this.blockOreData[bPos] = block;
    }
    public static setRandomBlock (block as BlockState[]) as void {
        this.randomBlock = block;
    }
    public static setOreReplace(block as BlockState, block2 as Block) as void{
        this.oreReplace[block2] = block;
    }



    public static getPlayer(player as Player) as Player{
        return playerList[player.getStringUUID()];
    }
    public static getTransBlock() as BlockState[Block] {
        return transmutateBlock;
    }
    public static getUUID(player as Player) as string{
        return playerListUUID[player];
    }
    public static setBlackListTBlock(block as Block[]) as void {
        this.blackListTBlock = block;
    }
    public static getBlackListTBlock() as Block[]{
        return blackListTBlock;
    }
    public static getPlayerBlock(player as Player) as BlockState{
        return playerPlaceBlock[player];
    }
    public static getBlockPos(player as Player) as BlockPos {
        return playerPlaceBlockPos[player];
    }
    public static getSaveBlockPos() as BlockState[BlockPos]{
        return blockData;
    }
    public static getRandomBlock() as BlockState[] {
        return randomBlock;
    }
    public static getOreData() as BlockState[BlockPos] {
        return blockOreData;
    }
    public static getOreReplace() as BlockState[Block]{
        return oreReplace;
    }


    public static c() as void{
        this.blockData = {};
    }
    
    public static isEmpty(i as int) as bool {
        switch(i){
            case 1: 
                if(playerList.isEmpty) {return true;}
                else return false;
            case 2:
                if(playerPlaceBlock.isEmpty) {return true;}
                else return false;
            case 3:
                if(playerPlaceBlockPos.isEmpty) {return true;}
                else return false;
            case 4:
                if(playerListUUID.isEmpty) {return true;}
                else return false;
            case 5:
                if(blockData.isEmpty) {return true;}
                else return false;
            case 6:
                if(transmutateBlock.isEmpty) {return true;}
                else return false;
            case 7:
                if(blackListTBlock.isEmpty) {return true;}
                else return false;
            case 8:
                if(randomBlock.isEmpty) {return true;}
                else return false;
            case 9:
                if(oreReplace.isEmpty) {return true;}
                else return false;
            case 10:
                if(blockOreData.isEmpty) {return true;}
                else return false;
            default:
                return false;
        }
    }

    public static BackTransmutateBlock(level as Level) as void{
        for i in blockData{
            level.setBlockAndUpdate(i, blockData[i]);
        }
    }

    public static BackOre(level as Level) as void{
        for i in blockOreData{
            level.setBlockAndUpdate(i, blockOreData[i]);
        }
    }

    public static TransmutateBlock(mainBlockPos as BlockPos, num as int, level as Level, ran as int) as void{
        var x1 = mainBlockPos.x - num;
        var y1 = mainBlockPos.y - num;
        var z1 = (mainBlockPos.z - num) - 1;
        var x2 = (mainBlockPos.x + num);
        var y2 = (mainBlockPos.y + num);
        var z2 = (mainBlockPos.z + num) - 1;
        var x = x1;
        var y = y1;
        var z = z1;
        while(x <= x2){
            while(y <= y2){
                while(z <= z2){
                    z++;
                    switch(ran) {
                        case 1:
                            if(BlockIsAir(level.getBlockState(new BlockPos(x, y, z)))){
                                if(transBlock(level)){
                                    level.setBlockAndUpdate(new BlockPos(x, y, z), BlockTransmutate(level.getBlockState(new BlockPos(x, y, z))));
                                }
                            }
                            break;
                        case 2:
                            if(BlockIsAir(level.getBlockState(new BlockPos(x, y, z)))){
                                if(transBlock(level)){
                                    level.setBlockAndUpdate(new BlockPos(x, y, z), RandomBlockTransmutate(level.getBlockState(new BlockPos(x, y, z)), level));
                                }
                            }
                            break;
                        case 3:
                            if(isBlackListBlock(level.getBlockState(new BlockPos(x, y, z)))){
                                blockData[new BlockPos(x, y, z)] = level.getBlockState(new BlockPos(x, y, z));
                            }
                            break;
                    }
                }
                y++;
                z = z1; 
            }
            x++;
            y = y1;
        }
    }

    public static BlockIsAir(block as BlockState) as bool{
        if(block.block == <block:minecraft:air>){
            return false;
        }
        if!(isEmpty(6)){
            for b in transmutateBlock {
                if (b == block){
                    return true;
                }
            }
        }
        if!(isEmpty(7)){
            for i in blackListTBlock{
                if (block.block == i){
                    return false;
                }
                else{
                    return true;
                }
            }
        }
        else{
            return true;
        }
        return false;
    }

    public static isBlackListBlock(block as BlockState) as bool{
        if!(isEmpty(7)){
            for i in blackListTBlock {
                if block.block == i {
                    println(i as string);
                    return true;
                }
            }
        }
        else{
            return false;
        }
        return true;
    }

    // public static oreRep(block as BlockState)

    public static BlockTransmutate(block as BlockState) as BlockState{
        var bState = block;
        var b = block.block;
        for i in transmutateBlock{
            if(i == b){
                return transmutateBlock[b];
            }
            else{
                return <blockstate:minecraft:air>;
            }
        }
        return <blockstate:minecraft:air>;
    }

    public static RandomBlockTransmutate(block as BlockState, level as Level) as BlockState{
        var bState = block;
        if!(isEmpty(8)){
            var t as int = randomBlock.length;
            var tt = level.random.nextInt(0, t);
            return randomBlock[tt];
        }
        else{
            return <blockstate:minecraft:air>;
        }
        return <blockstate:minecraft:air>;
    }

    public static isOre(b as BlockState) as bool{
        var blockS = b;
        var block = b.block;
        if(<tag:blocks:forge:ores>.contains(block)){
            return true;
        }
        else{
            return false;
        }
        return false;
    }

    public static transBlock(level as Level) as bool {
        var randomB = level.random.nextBoolean();
        if(randomB){
            return true;
        }
        else{
            return false;
        }
    }

    public static oreRep(block as BlockState, type as int) as BlockState{
        var bState = block;
        var b = block.block;
        switch (type) {
            case 1:
                for i in blockOreData{
                    if(i == b){
                        return oreReplace[b];
                    }
                    else{
                        return <blockstate:minecraft:air>;
                    }
                }
                break;
            case 2:
                return <blockstate:minecraft:stone>;
                break;
            default:
                return <blockstate:minecraft:air>;
                break;
        }
        return <blockstate:minecraft:air>;
    }

    
    public static ReplaceOre(mainBlockPos as BlockPos, num as int, level as Level, ran as int) as void{
        var x1 = mainBlockPos.x - num;
        var y1 = mainBlockPos.y - num;
        var z1 = (mainBlockPos.z - num) - 1;
        var x2 = (mainBlockPos.x + num);
        var y2 = (mainBlockPos.y + num);
        var z2 = (mainBlockPos.z + num) - 1;
        var x = x1;
        var y = y1;
        var z = z1;
        while(x <= x2){
            while(y <= y2){
                while(z <= z2){
                    z++;
                    switch (ran) {
                        case 1:
                            if(isOre(level.getBlockState(new BlockPos(x, y, z)))){
                                println('da');
                                blockOreData[new BlockPos(x, y, z)] = level.getBlockState(new BlockPos(x, y, z));
                            }
                            break;
                        case 2:
                            if(isOre(level.getBlockState(new BlockPos(x, y, z)))){
                                level.setBlockAndUpdate(new BlockPos(x, y, z), oreRep(level.getBlockState(new BlockPos(x, y, z)), 2));
                            }
                            break;
                        default:
                            return;
                    }
                }
                y++;
                z = z1; 
            }
            x++;
            y = y1;
        }    
    }
}
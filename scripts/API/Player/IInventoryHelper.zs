import crafttweaker.api.entity.type.player.Player;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.world.ServerLevel;

public class IInventoryHelper {

    private static var inventory as IItemStack[int] = {};

    public static getPlayerInventorySize(player as Player) as int{
        return player.inventory.getContainerSize();
    }

    public static getItem(player as Player, item as IItemStack) as int {
        return player.inventory.findSlotMatchingItem(item);
    }

    public static clearInventory(player as Player) as void {
        for i in 0 .. player.inventory.getContainerSize() {
            player.inventory.setItem(i, <item:minecraft:air>);
        }
    }

    
    

    public static setCruios(player as Player, item as IItemStack, index as int, type as string) as void {
        if(player.level.isClientSide()) return;
        var server = player.level as ServerLevel;
        server.server.executeCommand("curios replace " + type + " " + index + " " + player.name.getString() + " with " + item.registryName, true);
    }

    public static removeCurios(player as Player, index as int, type as string) as void{
        if(player.level.isClientSide()) return;
        var server = player.level as ServerLevel;
        server.server.executeCommand("curios replace " + type + " " + index + " " + player.name.getString() + " with minecraft:air", true);
    }



    public static setSaveInventory(player as Player) as void {
        for i in 0 .. player.inventory.getContainerSize(){
            this.inventory[i] = player.inventory.getItem(i).asIItemStack();
        }
    }

    public static setSaveInventoryItem(player as Player, i as int) as void{
        this.inventory[i] = player.inventory.getItem(i).asIItemStack();
    }

    public static getSaveInvenortItem(i as int) as IItemStack {
        return inventory[i];
    }

    public static giveInventoryItem(player as Player, i as int) as void{
        player.inventory.setItem(i,inventory[i]);
    }



    public static clearVariables() as void {
        this.inventory = {};
    }

    

}
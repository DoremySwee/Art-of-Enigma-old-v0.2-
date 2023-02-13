#priority 1
import crafttweaker.item.IItemStack;
import crafttweaker.mods.IMod;
import crafttweaker.mods.ILoadedMods;
//Mythical Arg Ban
val MA=loadedMods["mysticalagriculture"] as IMod;
if(true){
    var d as IItemStack[]=[
        <mysticalagriculture:infusion_crystal>,
        <mysticalagriculture:master_infusion_crystal>,
        <mysticalagriculture:inferium_furnace>,
        <mysticalagriculture:prudentium_furnace>,
        <mysticalagriculture:intermedium_furnace>,
        <mysticalagriculture:superium_furnace>,
        <mysticalagriculture:supremium_furnace>,
        <mysticalagriculture:ultimate_furnace>,
        <mysticalagriculture:mystical_fertilizer>,
        <mysticalagriculture:inferium_apple>,
        <mysticalagriculture:prudentium_apple>,
        <mysticalagriculture:intermedium_apple>,
        <mysticalagriculture:superium_apple>,
        <mysticalagriculture:supremium_apple>
    ]as IItemStack[];
    for i in 1 to 39{
        d+=<mysticalagriculture:crafting>.definition.makeStack(i);
    }
    for i in 48 to 55{
        d+=<mysticalagriculture:crafting>.definition.makeStack(i);
    }
    for i in 0 to 4{
        d+=<mysticalagriculture:chunk>.definition.makeStack(i);
        furnace.remove(<mysticalagriculture:chunk>.definition.makeStack(i));
    }
    for i in 0 to 5{
        d+=<mysticalagriculture:coal>.definition.makeStack(i);
        d+=<mysticalagriculture:coal_block>.definition.makeStack(i);
    }
    for i in 0 to 6{
        d+=<mysticalagriculture:storage>.definition.makeStack(i);
        d+=<mysticalagriculture:ingot_storage>.definition.makeStack(i);
    }
    for i in MA.items{
        if(i.definition.id.contains("_seeds")){
            d+=i;
        }
    }
    for i in d{
        recipes.remove(i);
    }
}
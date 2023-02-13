import mods.tconstruct.Casting;
import crafttweaker.item.IItemStack;
import mods.botaniatweaks.Agglomeration;
//Ember Machine Ban
if(true){
    var d as IItemStack[]=[
        <embers:vacuum>,
        <embers:dawnstone_anvil>,
        <embers:alchemy_pedestal>,
        <embers:alchemy_tablet>,
        <embers:beam_cannon>,
        <embers:ember_bore>,
        <embers:stamper_base>,
        <embers:stamper>,
        <embers:auto_hammer>,
        <embers:ember_injector>,
        <embers:boiler>,
        <embers:reactor>,
        <embers:combustor>,
        <embers:catalyzer>,
        <embers:field_chart>,
        <embers:ember_pulser>,
        <embers:inferno_forge>,
        <embers:mechanical_pump>,
        <embers:catalytic_plug>,
        <embers:mini_boiler>,
        <embers:reaction_chamber>,
        <embers:fluid_transfer>,
        <embers:ember_siphon>,
        <embers:stirling>,
        <embers:geo_separator>,
        <embers:explosion_pedestal>,
        <embers:pipe>,
        <embers:pump>,
        <embers:item_pipe>,
        <embers:item_pump>,
        <embers:item_dropper>,
        <embers:fluid_dropper>,
        <embers:cinder_plinth>,
        <embers:item_transfer>,
        <embers:archaic_light>
    ]as IItemStack[];
    for i in d{
        recipes.remove(i);
    }
}

/*#############################
#############################*/

//1a
var Brick  = <embers:brick_caminite>;
var Blend  = <embers:blend_caminite>;
var Plate  = <embers:plate_caminite>;
var DMith  = <thermalfoundation:material:72>;
var IMith  = <thermalfoundation:material:136>;
var LGlass = <liquid:glass>;
var IDS    = <ore:ingotDarkSteel>;
var Pry    = <liquid:pyrotheum>;
var Cry    = <embers:crystal_ember>;
var IIron  = <minecraft:iron_ingot>;
var BLapis = <minecraft:lapis_block>;

Casting.addTableRecipe(Blend,DMith,<liquid:dirt>,144,true,144);
Casting.addTableRecipe(Brick,Blend,LGlass,144,true,144);
mods.appliedenergistics2.Inscriber.addRecipe(<embers:plate_caminite_raw>,Blend,false,IIron,IIron);
Casting.addTableRecipe(Plate,<embers:plate_caminite_raw>,LGlass,144,true,144);
recipes.remove(Blend);
recipes.remove(<embers:plate_caminite_raw>);
furnace.remove(Brick);
furnace.remove(Plate);
mods.tconstruct.Casting.addTableRecipe(Cry,<tconstruct:cast_custom:1>,Pry,16,false,72);

var GMith = <thermalfoundation:glass:8>;
var manaBucket= <forge:bucketfilled>.withTag({FluidName: "mana", Amount: 1000});
recipes.remove(GMith);
Agglomeration.addRecipe(<extrautils2:opinium>,[manaBucket],1000000,0xCCCCFF,0x7799FF,
    BLapis,<thermalfoundation:glass:2>,<thermalfoundation:ore:8>,
    <liquid:mana>,GMith,<thermalfoundation:ore:2>);

recipes.remove(<embers:tinker_hammer>);
recipes.addShaped(<embers:tinker_hammer>,[
    [IDS,Brick,IDS],
    [IDS,<ore:stickTreatedWood>,IDS],
    [null,<ore:stickTreatedWood>,null]]);


//1b
var GrSteel=<ore:gearSteel>;
var Fluix=<ore:crystalFluix>;
var Pool=<botania:pool>;
var RFConverter=<botania:rfgenerator>;

recipes.addShaped(<thermalfoundation:upgrade>,[
    [null,IMith,null],
    [IMith,GrSteel,IMith],
    [Fluix,IMith,Fluix]]);
recipes.addShaped(<thermalexpansion:machine>,[
    [IMith,Pool,IMith],
    [Cry,<minecraft:furnace>,Cry],
    [IMith,RFConverter,IMith]]);
recipes.addShaped(<thermalexpansion:machine:1>,[
    [IMith,Pool,IMith],
    [Cry,<enderio:block_simple_sag_mill>,Cry],
    [IMith,RFConverter,IMith]]);
recipes.addShaped(<thermalexpansion:machine>,[
    [IMith,Pool,IMith],
    [<botania:manasteelaxe>,GrSteel,<minecraft:diamond_axe>],
    [IMith,RFConverter,IMith]]);

recipes.addShaped(<thermalfoundation:material:512>,[
    [Fluix,GrSteel,IMith],
    [IMith,Cry,<minecraft:redstone>]]);
recipes.addShaped(<thermalexpansion:frame:64>,[
    [IMith,GMith,IMith],
    [GMith,GrSteel,GMith],
    [IMith,GMith,IMith]]);

var Adh=<embers:adhesive>;
Casting.addTableRecipe(Adh,<minecraft:slime_ball>,<liquid:sap>,34,false,72);

//2a
var FeAlloy=<enderio:item_alloy_ingot:9>;
var BSteel=<thermalfoundation:storage_alloy>;
var PryBucket=<forge:bucketfilled>.withTag({FluidName: "pyrotheum", Amount: 1000});
recipes.addShaped(<embers:block_furnace>,[
    [Brick,Adh,Brick],
    [Brick,<enderio:block_simple_alloy_smelter>,Brick],
    [BSteel,PryBucket,BSteel]
]);
recipes.addShaped(<embers:stamper_base>,[
    [FeAlloy,null,FeAlloy],
    [Blend,BSteel,Blend],
    [Blend,Adh,Blend]]);
recipes.addShaped(<embers:stamper>,[
    [Blend,Adh,Blend],
    [BSteel,<minecraft:sticky_piston>,FeAlloy],
    [Blend,<enderio:block_dark_steel_anvil>,Blend]]);

var GrMith=<thermalfoundation:material:264>;
mods.embers.Stamper.add(GrMith,<liquid:mana>,<immersiveengineering:mold:1>,IMith);
mods.embers.Melter.add(<liquid:silver>*144, IMith, <liquid:mana>);
IMith.addTooltip(game.localize("info.crt.Mith.meltForMana"));

recipes.addShaped(<embers:mixer>,[
    [Brick,Cry,Brick],
    [Fluix,GrMith,Fluix],
    [BSteel,Brick,BSteel]]);

Agglomeration.addRecipe(<mysticalagriculture:crafting:5>,[<appliedenergistics2:material:47>],1000000,0xCCCCFF,0x7799FF,
    <embers:block_tank>,<embers:wall_caminite_brick>,<immersiveengineering:storage:8>,
    <embers:geo_separator>,<minecraft:iron_bars>,<immersiveengineering:sheetmetal:8>);


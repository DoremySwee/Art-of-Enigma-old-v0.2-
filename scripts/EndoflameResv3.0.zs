#loader crafttweaker reloadableevents
#norun
import crafttweaker.world.IWorld;
import crafttweaker.block.IBlock;
import crafttweaker.world.IBlockPos;
import crafttweaker.data.IData;

import crafttweaker.server.IServer;
import crafttweaker.command.ICommandSender;

import crafttweaker.events.IEventManager;
import crafttweaker.event.BlockNeighborNotifyEvent;

import mods.zenutils.ICatenationBuilder;

events.onBlockNeighborNotify(function (event as BlockNeighborNotifyEvent){
    var world0 as IWorld=event.world;
    var pos as IBlockPos=event.position;
    var block0 as IBlock=world0.getBlock(pos);
    var worldData0 as IData=world0.getCustomChunkData(pos);
    if(!world0.remote && !isNull(block0.data)){
        if(block0.data has "subTileName"){
            world0.catenation().run(function(world, context){
                    //server.commandManager.executeCommand(server,"say t1");

                var block as IBlock=world.getBlock(pos);
                var worldData as IData=world.getCustomChunkData(pos);
                if(block.data.subTileName.asString() == ""){
                    server.commandManager.executeCommand(server,"say Error: endofalmeRes 1. Report this bug to the author of the modpack.");
                    world.setBlockState(<blockstate:minecraft:air>, pos);
                }
                if(block.data.subTileName.asString() == "endoflame"){
                        //server.commandManager.executeCommand(server,"say "+"aaaa");
                    if(!(worldData has "endoflameInfov2")){
                        var x as int[]=[pos.getX()];
                        var y as int[]=[pos.getY()];
                        var z as int[]=[pos.getZ()];
                        var dat as IData = {"endoflameInfov2": {"num":1 as int, "x":x, "y":y, "z":z}};
                        world.setCustomChunkData(dat,pos);
                    }
                    else{
                        //check the existing endoflames
                        var x as int[]=worldData.endoflameInfov2.x as int[];
                        var y as int[]=worldData.endoflameInfov2.y as int[];
                        var z as int[]=worldData.endoflameInfov2.z as int[];
                        var x_ as int[]=[] as int[];
                        var y_ as int[]=[] as int[];
                        var z_ as int[]=[] as int[];
                        var n as int=0 as int;
                        var flag0 as int=0 as int;
                        for i in 0 to worldData.endoflameInfov2.num{
                            //server.commandManager.executeCommand(server,"say "+(i as string)+"info:"+(x[i] as string)+","+(y[i] as string)+","+(z[i] as string));
                            var bl=world.getBlock(crafttweaker.util.Position3f.create(x[i]*1.0,y[i]*1.0,z[i]*1.0) as IBlockPos);
                            if(isNull(bl))continue;
                            if(isNull(bl.data))continue;
                            if(!(bl.data has "subTileName"))continue;
                            if(bl.data.subTileName!="endoflame")continue;
                            var t=0;
                            if(i>0){
                                for j in 0 to i{
                                    if(x[i]==x[j]&&y[i]==y[j]&&z[i]==z[j])t=1;
                                }
                            }
                            if(t==1)continue;
                            if(x[i]==pos.getX()&&y[i]==pos.getY()&&z[i]==pos.getZ())flag0=1;
                            x_+=x[i];
                            y_+=y[i];
                            z_+=z[i];
                            n=n+1;
                        }
                        if(n-flag0>=8){
                            server.commandManager.executeCommand(server,"say number of endoflame has exceeded maximum(8) in this chunk.");
                            world.setBlockState(<blockstate:minecraft:air>, pos);
                            world.spawnEntity(<botania:specialflower>.withTag({type: "endoflame"}).createEntityItem(world,pos.getX(),pos.getY()+1,pos.getZ()));
                            //world.createExplosion(null, pos.getX(), pos.getY(), pos.getZ(), 1, false, true);
                        }
                        else{
                            if(flag0==0){
                                n=n+1;
                                x_+=pos.getX();
                                y_+=pos.getY();
                                z_+=pos.getZ();
                            }
                        }
                        var dat as IData = {"endoflameInfov2": {"num":n, "x":x_, "y":y_, "z":z_}};
                        world.updateCustomChunkData(dat, pos);
                    }
                }
            }).start();
        }
    }
});
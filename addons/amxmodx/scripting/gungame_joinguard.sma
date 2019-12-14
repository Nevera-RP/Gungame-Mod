#include <amxmodx>
#include <amxmisc>

#define PLUGIN "GunGame JoinGuard"
#define VERSION "1.0"
#define AUTHOR "aSior & Ogen Dogen"

new playerTeam[33];
new teamPlayers[2];

public plugin_init()
{
    register_plugin(PLUGIN, VERSION, AUTHOR);
    register_message(get_user_msgid("ShowMenu"), "messageShowMenu");
    register_message(get_user_msgid("VGUIMenu"), "messageVGUIMenu");
    
    teamPlayers[0] = 0;
    teamPlayers[1] = 0;
}

public client_connect(id)
{
    playerTeam[id] = -1;
}

public client_disconnected(id)
{
    teamPlayers[get_user_team(id)]--;
}

public messageShowMenu(msgid, dest, id)
{
    if (isAutoJoin(id))
    {
        // main logic goes here...
        return PLUGIN_HANDLED;
    }
    
    return PLUGIN_CONTINUE;
}

public messageVGUIMenu(msgid, dest, id)
{

}

public forceTeamJoin(id, team)
{
    client_cmd(id, "jointeam %d", team);
}

stock bool:isAutoJoin(id)
{
    return !access(id, ADMIN_IMMUNITY);
}
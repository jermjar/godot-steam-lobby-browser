# godot-steam-lobby-browser
This is a proof of concept template with GodotSteam GDExtension for a Source style lobby browser.
I wanted this to be as minimal as possible to purely showcase the networking functionality.
There are comments above some functions, but most are self-explanatory in their name once you start to understand the code.
You can also read the in-engine documentation for `Steam` signals to learn more about those.
This uses Steam as a relay server, so no port forwarding or self-hosting needed!

<h1>Levels</h1>
<h3>main_menu.tscn</h3>
This scene visualizes everything and has four main sub-menus that get their visibility toggled depending on what the player is doing.
<h3>test_level.tscn</h3>
This scene is purely to showcase switching scenes after establishing a connection to a lobby


<h1>Scenes</h1>
The only scenes that I have created are `lobby_player.tscn` and `lobby_server.tscn`.
Both of these scenes contain a generic outline for data to dynamically fill them.
<h3>lobby_player.tscn</h3>
This scene is used in the LobbyContainer in the MainMenu.
It's referenced in the `main_menu.gd` script and used to visualize the players in the lobby.
<h3>lobby_server.tscn</h3>
This scene is used in the JoinLobbyContainer in the MainMenu.
It's referenced in the `main_menu.gd` script and used to visualize the servers available.


<h1>Scripts</h1>
There are three main scripts that contain all of the code related to the lobby system
<h3>steam_initialization.gd</h3>
This global scripts main purpose is to do anything related to Steam initialization like setting the Application ID, checking if Steam is running, checking if the player owns the game, etc.
Majority of the script was created using the GodotSteam API documenation
<h3>networking.gd</h3>
This global scripts main purpose is to connect to all of the signals we care about when it comes to multiplayer.
GodotSteam integrates with ENet's functionality, so we can use the `multiplayer` signals along with `Steam` signals.
<h3>main_menu.gd</h3>
This scripts main purpose is to connect to more signals that we only care about when creating/finding lobbies and control visibility of things dynamically based on player input and what lobbies are available.

SquareSoft UI Suite - Installer v2.0

HOW THE DISTRIBUTION WORKS
==========================

Keep ALL files in one folder.

The only plugin the recipient manually adds in MUSHclient is:

    SquareSoft_UI_Installer.xml

The installer loads the rest in dependency order.

LAYOUT FILE
===========

To distribute your exact window arrangement, include the file:

    SquareSoft_UI_Layout.txt

in this same folder.

That is the file produced by the SquareSoft Plugin Controller's:

    layout save

command.

After the installer loads all of the plugins, it waits about one second and
calls the Plugin Controller to load SquareSoft_UI_Layout.txt. Therefore the
recipient gets the arranged X/Y positions and width/height values immediately.

The UI Layout Controller is a DIFFERENT plugin. It controls the MUSHclient
left/right gutters and text rectangle. It is included as UI_Layout_Controller.xml.

CONTROLLERS
===========

UI_Theme_Controller.xml
    Shared themes. default = green, classic = old gray/default, amber = amber.

UI_Layout_Controller.xml
    Gutters / reserved text area / gutter backgrounds.

SquareSoft_Plugin_Controller.xml
    Suite/window manager. Owns layout save/load of plugin miniwindow geometry.

SquareSoft_UI_Installer.xml
    Bootstrap installer. Loads the complete suite and then applies
    SquareSoft_UI_Layout.txt.

COMMANDS
========

suite install
    Reinstall/update every bundled SquareSoft plugin from this folder.

suite layout
    Re-apply SquareSoft_UI_Layout.txt.

suite status
    Show whether every bundled plugin and the layout file are present.

suite path
    Show the folder and expected layout-file path.

PORTABLE TRIGGERS (v2.0)
========================

This distribution now owns the SquareSoft trigger rules that previously had to
live in a specific MUSHclient world file. A fresh world therefore does not need
hand-created status/chat/automation triggers for the bundled behaviors.

SquareSoft_Core_Triggers.xml
    * HP current-value green->red gradient
    * MP current/max cyan->light-purple->red gradient
    * OVERALL CONDITION HP/SP gradients
    * red Mob / light-green Exp / green << >> markers
    * six-line magenta Chakra-ready notice

SquareSoft_Chat_Router.xml
    * PartyTell, announce, newbie, gossip, death, auction, PlayerAuction
    * You say / You tell
    * incoming "tells you" lines
    * preserves original MUD style runs when forwarding to Generic Chat

The chat router is loaded AFTER Generic_Chat_Miniwindow so routed lines always
have a destination during normal suite installation. Its triggers are grouped as
SS_CHAT_ROUTER; core triggers are grouped as SS_CORE.

MIGRATING AN EXISTING WORLD
===========================

If v2.0 detects that this installer is upgrading an existing v1.x suite, it
loads the new Core Triggers and Chat Router DISABLED. This prevents your old
world triggers from double-firing during migration.

After disabling/deleting the old hand-made world trigger copies, type:

    suite portable on

Fresh installs enable the portable trigger plugins automatically. Useful controls:

    suite portable status
    suite portable on
    suite portable off

BUNDLED GUTTER ALERT ART
========================

This package now includes all ten WARNING gutter images and all ten RED/ALERT
gutter images expected by UI_Layout_Controller.xml:

    UILayout_Gutter_Left_Warning_1.png ... _5.png
    UILayout_Gutter_Right_Warning_1.png ... _5.png
    UILayout_Gutter_Left_Red_1.png ... _5.png
    UILayout_Gutter_Right_Red_1.png ... _5.png

They are kept in the gutters\ subfolder beside UI_Layout_Controller.xml, and
the layout controller resolves that relative folder automatically. No installer
code is needed for the PNG files themselves.

COMPLETE GUTTER ART SET
=======================

This package now includes the full gutter-art set expected by
UI_Layout_Controller.xml under the gutters\ subfolder:

Static themes:
    UILayout_Gutter_Left_Green.png
    UILayout_Gutter_Right_Green.png
    UILayout_Gutter_Left_Grey.png
    UILayout_Gutter_Right_Grey.png
    UILayout_Gutter_Left_Amber.png
    UILayout_Gutter_Right_Amber.png

Animated health states:
    5 left + 5 right WARNING images
    5 left + 5 right RED/ALERT images

Theme semantics:
    default = green
    classic = grey
    amber   = amber

BUNDLED LAYOUT PRESET
=====================

This package now includes the user's actual saved layout as:

    SquareSoft_UI_Layout.txt

The preset was captured from a MUSHclient output area of:

    1899 x 968

The installer automatically applies it after loading the plugin suite and uses
that exact arrangement as the reference geometry for monitor-based scaling.

MONITOR-BASED REFERENCE SCALING (v2.2)
======================================

The bundled SquareSoft_UI_Layout.txt is the canonical layout supplied by the
suite author. Its window coordinates were captured from a MUSHclient output
canvas of 1899 x 968 on a 1920 x 1080 source monitor.

On install, the Plugin Controller now uses the Windows PRIMARY MONITOR
resolution (GetSystemMetrics 0/1) instead of the size of the MUSHclient window.
This means installing while MUSHclient is restored/windowed no longer produces
a smaller layout just because the client happened not to be maximized.

The controller:
  * reads # output_width / # output_height as the canonical coordinate canvas
  * reads # monitor_width / # monitor_height as the source monitor resolution
  * gets the recipient's primary-monitor resolution
  * chooses one UNIFORM geometry scale from the monitor-resolution ratio
  * predicts the target MUSHclient canvas from the reference canvas/monitor
    proportions, independently of the current MUSHclient window size
  * scales width/height without distorting windows
  * preserves left/right/top/bottom/center anchoring; ultrawide monitors can use
    their extra horizontal extent without stretching individual panels
  * scales the saved 390 px / 850 px gutter reservations by the same geometry
    factor
  * applies a gentler sqrt-based typography scale to conventional UI panels
  * leaves the Enemy Tracker's responsive typography in charge
  * leaves Automapper map-label sizing/zoom logic in charge
  * leaves World Map cell metrics in charge

Useful commands:

    layout scale
        Shows source/current monitor dimensions, reference/target canvas, the
        actual current MUSHclient output size, and chosen scale factors.

    layout load
        Monitor-scaled restore (normal/default).

    layout load exact
        Raw reference pixels, for debugging only.

Old layout files without monitor metadata still load; they fall back to the
older output-window-based scaling method. Newly saved layouts record both their
MUSHclient canvas size and monitor resolution.

CORRECTED RESIZABLE DISTRIBUTION (v1.6)
=======================================

This build fixes two packaging problems:

1. Generic_Chat_Miniwindow.xml is now INCLUDED and installed automatically.
   It is the COMMUNICATION window and is resizable from the bottom-right corner.

2. The current World_Map_Window kept later map/speedwalk fixes but had lost the
   resizable-window code from the resizable baseline. v2.21 restores resizing
   and dynamically fits the 9x9 map font to the chosen dimensions.

Chakra and Autobuff remain intentionally excluded.

The other user-facing windows are the resizable branches:
  HP / MP Gauges
  Status Effect Tracker
  Exit Compass
  Travel Shortcuts
  XP / AP / Gold Rates
  Enemy Bestiary Tracker
  World Map Window
  SquareSoft Automapper
  Communication / Generic Chat

INSTALLER UPGRADE FIX
=====================

Older installer builds stored only a one-time 'suite installed' flag. Installing
a newer installer XML with the same plugin ID could therefore leave the OLD
plugin files loaded unless `suite install` was run manually.

v1.6 stores the installed BUNDLE VERSION. Installing a newer bundle now
automatically unloads/reloads the bundled plugins once, so the actual files in
the new distribution become active.

The canonical map seed database is also bundled again for clean installs.

REAL GENERIC CHAT PLUGIN (v1.7)
===============================

The invented chat replacement from v1.6 has been removed.

The distribution now uses the actual supplied Generic_Chat_Miniwindow v2.8
codebase (integrated as v2.7 only for theme/layout support).

Important: the real Generic_Chat_Miniwindow still does NOT define MUD chat
capture triggers itself. In v2.0 that responsibility belongs to the separate
SquareSoft_Chat_Router.xml plugin, which calls:

    CallPlugin("10778718503f0c91106745f5", "display", serialized_style_runs)

This preserves the Generic Chat codebase while making the SquareSoft routing
rules portable with the rest of the suite.

The real chat window retains:
  * resize handle
  * title-bar dragging
  * mousewheel scrolling
  * original MUD colours
  * timestamp/echo controls
  * modular theme support

Suite integration adds:
  * default = green / classic = old grey / amber = amber
  * explicit managed layout restore
  * adaptive font scaling

DEFERRED BOOTSTRAP / RESIZE DIAGNOSTIC (v1.8)
==============================================

Previous installer builds called LoadPlugin() for every child plugin directly
from the installer's own OnPluginInstall callback.

v1.8 no longer nests child-plugin installs inside the bootstrap plugin's own
installation callback. The installer returns first, waits 0.5 seconds, and only
then loads the suite.

Diagnostic:
    suite install bare

This installs the same resizable plugins but deliberately does NOT apply the
saved layout. Test the lower-right resize handles immediately.

Then:
    suite layout

If resizing works before `suite layout` and fails after it, the fault is in the
layout restore. If it already fails after the bare install, the problem is in
plugin loading/initialization rather than layout restore.

LAYOUT RESTORE / RESIZE-HANDLE FIX (v1.9)
=========================================

The installer itself was not disabling MUSHclient drag handlers.

The exact bug was in the managed layout restore API:

Several plugins accepted the saved width/height and updated their Lua
WINDOW_WIDTH / WINDOW_HEIGHT values, but did not call WindowResize() on the
actual MUSHclient miniwindow before redrawing.

Example:
  HP default physical window: 140 x 155
  Saved HP layout:            157 x 166

The plugin then installed the resize hotspot at the logical 157x166 lower-right
corner even though the real MUSHclient window was still only 140x155. The
hotspot and its visible diagonal grip were therefore outside the miniwindow.

v1.9 physically resizes each miniwindow before its normal redraw for:
  HP / MP Gauges
  Status Effect Tracker
  Travel Shortcuts
  Exit Compass
  XP / AP / Gold Rates
  Enemy Bestiary Tracker
  World Map
  Automapper

Generic Chat already physically resizes inside its own init(false) path.

AUTOMAPPER POSITION PERSISTENCE
===============================

The Automapper now also writes the settled dragged position to movewindow state
and SaveState(), in addition to its mapper database metadata. Layout restore
synchronizes movewindow state as well. This prevents the map from reverting to
an older saved position on the next MUSHclient session.

PORTABILITY ARCHITECTURE (v2.0)
===============================

Rule going forward: gameplay/UI behavior shipped as part of the SquareSoft suite
must be owned by a plugin XML, not by invisible setup in one developer's world.
Plugin triggers use stable names/groups so future versions can replace behavior
cleanly without accumulating anonymous trigger copies.

Current stable trigger groups:
    SS_CORE         SquareSoft_Core_Triggers.xml
    SS_CHAT_ROUTER  SquareSoft_Chat_Router.xml

Existing specialized plugins continue to own their own room/map/combat/status
triggers; those rules were already portable and are not duplicated here.

WORLD OUTPUT FONT
-----------------
The installer standardizes the MUSHclient world output font to Consolas 11 pt.
It applies this before restoring gutters/layout so text-width calculations are
consistent across machines. The command-entry/input font is left unchanged.


AUTOMAPPER RIGHT-COLUMN FIX (v2.3)
----------------------------------
The canonical reference layout now places the 850px Automapper at x=1049, y=0,
which is the top-right column of the 1899px reference canvas.  The prior
canonical file incorrectly contained x=0 for this window, causing first-install
restores to put the Automapper at top-left.  Adaptive monitor scaling then keeps
the corrected window anchored to the right edge on other display sizes.


MAP-BACKED TRAVEL ALIASES (v2.5)
--------------------------------
In any room already known to the Automapper, type:

  speedwalk <alias>

Example: `speedwalk midgar` bookmarks the room you are standing in. Later,
typing `midgar` uses the Automapper's current navigation graph to route back
from wherever you are. These aliases are persistent Automapper-owned MUSHclient
alias objects tagged `travel`, and they appear automatically in Travel Shortcuts
alongside any existing world-level `travel` aliases.


V2.5 LAYOUT NOTE
----------------
The bundled SquareSoft_UI_Layout.txt is the supplied 2026-09-14 02:55:56 layout.
World Map first-render placement is guarded so a hidden placeholder cannot reset it to the top-left.

WORLD MAP MEMORY (v2.6)
-----------------------
The World Map now learns literal overworld presentation cell-by-cell in the
Automapper SQLite database. Previously-seen world territory is reconstructed
locally, including the MUD's foreground/background colours and text style, so
walking back through learned territory does not require a fresh `map` command.
The live player marker is stored separately as an overlay and is tagged to its
exact world coordinate, preventing old player markers from becoming terrain.

If the current 9x9 view contains any static cell that has not been memorized,
the known cells are drawn immediately and the plugin requests one authoritative
MUD map to fill the missing cells. Normal manual movement sends that necessary
probe immediately; active Automapper walks retain the queue-safe debounce.

`mapwin refresh` forces a live MUD map capture for the current location and
relearns the current 9x9. The World Map miniwindow itself is also retained and
repainted between moves instead of being recreated for every frame.


CHAT ROUTING OUTPUT (v2.7)
--------------------------
SquareSoft_Chat_Router now routes matched chat/tell lines through Generic Chat's
dedicated `display_noecho()` API. The router triggers already omit the original
server line, and Generic Chat no longer re-echoes routed lines into the main
output even if `chats echo on` is set.

The legacy `display()` API and `chats echo on/off` option are preserved for any
other/manual Generic Chat callers. Router forwarding remains fail-open: if the
chat plugin is missing or forwarding fails, the original styled line is restored
to the main output and routing disables itself instead of losing the message.

v2.8 persistence note:
The installer now saves the current MUSHclient world after applying the bundled
Consolas 11 output font and layout, so those world-level settings survive a
restart. If the world has never been saved as an .mcl file, save it once first.


v2.9 font persistence: the installer now synchronizes MUSHclient output_font_name, output_font_height, and output_font_weight with live Consolas 11 before saving the world, and performs one delayed startup reassertion.


v2.10 font fix: output_font_height is persisted as 11 (point size), not the rendered GetInfo(212) pixel height. This prevents Consolas 11 from reopening as roughly 18 point.


v2.12 enemy-name browser:
The Automapper SEARCH panel's ENEMY NAME tab is now browsable with an empty query.
It lists every learned enemy species alphabetically (A-Z), shows the number of mapped
rooms containing each species, and supports pagination. Clicking an enemy name runs
the existing enemy-room search for that exact name. CLEAR returns to the A-Z index.


v2.13 single-floor automapper rendering:
- Multi-storey canonical/Mudlet areas render one Z-level at a time instead of flattening every floor onto one canvas.
- Normal movement automatically follows the player's current floor.
- Explicit search/view results show the searched room's floor.
- Known exits to other floors are represented by compact up/down chevrons at their source room; one-way vertical exits retain the one-way accent marker.
- Imported Z coordinates remain intact for topology and routing.
- The footer reports the active room's authored Z value.


v2.16: Removed the portable barrier-fade -> ag automation from SquareSoft_Core_Triggers. This behavior can now be restored as an ordinary user-managed MUSHclient trigger if desired.

AUTOBUFF WORLD ALIASES (v2.17)
==============================

The autobuff controls rely on three ordinary WORLD triggers with labels:

    ag
    b
    end

The six matching world aliases are supplied in:

    SquareSoft_Autobuff_World_Aliases.xml

Import that file into the MUSHclient world once. It restores:

    agon / agoff    -> Auto-Aegis [ENABLED/DISABLED]
    bon / boff      -> Auto-BuildUp [ENABLED/DISABLED]
    endon / endoff  -> Auto-Endurance [ENABLED/DISABLED]

These are intentionally world aliases rather than plugin aliases so they can
enable/disable the user's world trigger labels ag, b, and end.

SPEEDWALK FAST PATH (v2.18)
===========================

Automapper autowalk now plans the route once and advances through that cached
route as each room header confirms arrival. The next movement command is sent
immediately after confirmation instead of waiting for a full mapper redraw and a
fresh whole-graph route search on every room.

During active autowalk, expensive full mapper rendering is throttled to at most
once every 0.50 seconds, with an exact final redraw on arrival/cancel/failure.
Unexpected destinations discard the cached route and safely replan from the
confirmed room; movement rejection still stops the walk.

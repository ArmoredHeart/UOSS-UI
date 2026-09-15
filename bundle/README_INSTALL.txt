UOSS / SquareSoft MUSHclient UI Suite
Release v2.21

INSTALL
=======

Keep every file and subfolder in this bundle together.

In MUSHclient, manually install only:

    SquareSoft_UI_Installer.xml

The installer loads the remaining plugins in dependency order, applies the
bundled layout, and standardizes the world output font to Consolas 11.

Do not move or delete:

    SquareSoft_CanonicalMap_seed.sqlite
    SquareSoft_UI_Layout.txt
    gutters\

The Automapper uses the canonical seed for clean installs and creates its
writable learned database separately.

CORE COMMANDS
=============

    suite install
        Reinstall/update all bundled plugins and apply the layout.

    suite install bare
        Reinstall/update plugins without applying the layout.

    suite layout
        Reapply SquareSoft_UI_Layout.txt.

    suite status
        Show bundled plugin/file status.

    suite portable on
    suite portable off
    suite portable status
        Control the portable Core Triggers and Chat Router groups.

    suite path
        Show the suite folder.

THEMES AND HP ALERTS
====================

    theme default
    theme classic
    theme amber

    alert warning <percent>
    alert alert <percent>
    alert critical <percent>
    alert on
    alert off
    alert status

Default warning threshold: 40% HP.
Default red/critical threshold: 20% HP.

HP / MP CALIBRATION
===================

Different characters may display HP/MP differently.

    gauges setup

Paste the output of the game's hp command, then select the HP field and MP
field when prompted. The plugin stores the original sample and selection
locations so newer parser logic can rebuild the calibration later.

    gauges setup status
    gauges setup reset

Learned parsing and gradient colouring are gated by the stored status-line
shape so unrelated text containing numbers is not recoloured accidentally.

COMMUNICATION WINDOW
====================

    chats show
    chats hide
    chats timestamps
    chats echo

Mouse controls:

- Drag across chat text to select it. Releasing the mouse copies the selected
  text to the Windows clipboard.
- Plain left-click copies the entire logical chat message.
- Right-click offers Copy Selection / Copy All and other chat options.
- Mouse wheel scrolls the chat history.
- Drag the title bar to move the window.
- Drag the lower-right grip to resize it.

OPTIONAL PLUGINS
================

Autobuff Tracker and Chakra Cooldown are included but disabled by default in
this production build. Enable either from MUSHclient's Plugins dialog.

SquareSoft_Autobuff_World_Aliases.xml is an optional one-time WORLD import for:

    agon / agoff
    bon  / boff
    endon / endoff

These aliases control world triggers named ag, b, and end.

FAULT CONTAINMENT
=================

The plugins intentionally integrate with one another, but the release is
designed to contain failures. If one optional plugin is missing, disabled, or
rejects a cross-plugin call, unrelated plugins should continue operating where
practical. The installer continues processing healthy plugins after an
individual plugin load/unload failure and reports partial failures instead of
aborting the whole suite.

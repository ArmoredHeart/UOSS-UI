# UOSS UI

Portable MUSHclient UI suite for UOSSMUD.

Current release: **v2.21**

## Install

1. Download or clone this repository.
2. Keep the entire `bundle/` directory together.
3. In MUSHclient, install:
   `bundle/SquareSoft_UI_Installer.xml`
4. Let the installer load the suite and apply the bundled layout.

The installer scales the reference layout for the primary monitor, sets the world output font to Consolas 11, and loads the managed plugins in dependency order.

## Important files

Do not separate these from the rest of `bundle/`:

- `SquareSoft_CanonicalMap_seed.sqlite` — canonical Automapper seed used for clean installs.
- `SquareSoft_UI_Layout.txt` — bundled reference layout.
- `gutters/` — theme and HP-warning gutter artwork.
- All bundled XML files — several features integrate across plugins by stable plugin ID.

The Automapper creates its writable learned/runtime database separately. User-specific learned map state is not included in this repository.

## Optional plugins

Autobuff Tracker and Chakra Cooldown are included but **disabled by default** in the production installer. Enable them from MUSHclient's Plugins dialog if wanted.

`SquareSoft_Autobuff_World_Aliases.xml` is an optional one-time world import for the `agon/agoff`, `bon/boff`, and `endon/endoff` aliases. Those aliases control world triggers named `ag`, `b`, and `end`.

## Useful commands

- `suite install` — reinstall/update the bundled suite.
- `suite install bare` — reinstall without applying the layout.
- `suite layout` — reapply the bundled layout.
- `suite status` — report bundled plugin/file status.
- `theme default|classic|amber` — choose the base UI theme.
- `alert status` — show HP warning/alert configuration.
- `gauges setup` — calibrate HP/MP parsing for your character's status format.
- `chats show` / `chats hide` — show or hide the Communication window.

In the Communication miniwindow, drag across text to select it; releasing the mouse copies the selection to the Windows clipboard. A plain left-click copies the whole logical message.

## Portability

This repository is the distributable build. It intentionally excludes development history, internal audits, build scripts, and maintainer-only tooling.

The suite may integrate across plugins, but cross-plugin failures are contained where practical: a missing or unhealthy optional sibling should disable only the feature that depends on it rather than taking down the rest of the UI.

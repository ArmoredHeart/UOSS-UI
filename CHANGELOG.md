# Changelog

## v2.19 — Optional Cockpit Plugins
- Added Autobuff Tracker v1.2 and Chakra Cooldown v2.4 to both branches and the installer manifest.
- `dev`: both plugins install enabled for testing.
- `main`: both plugins are installed but disabled by production default.
- Bundle validation now requires both plugin files.

## v2.18 — Speedwalk Fast Path
- Cache the autowalk route instead of recomputing shortest path after every room.
- Send the next step immediately after confirmed room arrival.
- Throttle expensive mapper redraws during speedwalk while preserving confirmation/safety.
- Re-route from the actual room if travel diverges from the cached route.

## v2.17 — Autobuff World Aliases
- Restored `agon`, `agoff`, `bon`, `boff`, `endon`, and `endoff` world aliases.
- These toggle world triggers `ag`, `b`, and `end` and print readable state messages.

## v2.16 — Remove Barrier Auto-AG
- Removed the portable-core trigger that automatically sent `ag` when the barrier faded.
- Removed its dead control/state machinery.

## v2.15 — Connector Collision Fix
- Prevent canonical map connectors from passing through unrelated room boxes.
- Detour obstructed connectors; omit a connector rather than drawing a misleading false exit when no safe route exists.

## v2.14 — Attached Floor Ports
- Attach off-floor up/down indicators to their source room instead of drawing detached chevrons.

## v2.13 — Single-Floor Maps
- Render one authored Z level at a time while preserving full canonical vertical topology.
- Show compact cross-floor transition indicators rather than flattening all floors onto one plane.

## v2.12 — Enemy A–Z Browser
- Added alphabetical browsing of known enemy names in mapper search.

## v2.11 — One-Way Exits
- Added graph-based one-way connector indicators and room-detail annotations.

## v2.10 — Consolas 11 Persistence Fix
- Corrected MUSHclient world font persistence semantics so Consolas 11 survives restart.

## v2.7 — Chat Miniwindow Only
- Routed captured chat to the miniwindow without duplicating it in main output.

## v2.6 — World Map Memory
- Added persistent learned world-map cells and faster revisits.

## v2.4 — Map-Backed Speedwalk Aliases
- Added persistent destination aliases backed by automapper room IDs.

## v2.1 — Monitor-Scaled Layout
- Added 1920×1080 reference layout scaling and responsive gutters.

## v2.0 — Portable Trigger Architecture
- Moved core/chat trigger behavior into portable plugins.

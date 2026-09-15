# Changelog

## v2.21 — Portable release hardening
- Added drag-selection and copy-to-clipboard support to the Communication miniwindow.
- Preserved plain-click whole-message copy and added Copy Selection to the right-click menu.
- Hardened suite fault containment so one plugin load/unload failure does not abort installation of healthy plugins.
- Guarded optional Automapper/Travel, layout, chat typography, and speech integrations.
- Preserved production defaults: Autobuff Tracker and Chakra Cooldown install disabled unless the user enables them.

## v2.20 — Gauge calibration release
- Fixed installer versioning so existing installs actually reload the updated gauge/core/theme plugins.
- Added stored HP/MP sample and selection references as the canonical calibration record.
- Learned parsing can rebuild from the stored reference as parser logic improves.
- Added full-line fingerprint gating so HP/MP gradients do not appear in unrelated output.
- Restored warning/red window-theme updates from normalized calibrated HP.

## v2.19 — Portable HP/MP and alert improvements
- Added interactive `gauges setup` calibration for differing character status formats.
- Added learned HP/MP gradient support while preserving original MUD styling.
- Added configurable warning/red HP alert themes and shared effective-theme broadcasts.
- Hardened portable trigger matching against harmless spacing/format changes.
- Included Autobuff Tracker and Chakra Cooldown as optional cockpit plugins.

## v2.18 — Speedwalk fast path
- Cache Automapper routes and advance immediately after confirmed room arrival.
- Throttle expensive redraws during autowalk while retaining divergence recovery.

## v2.17 — Autobuff world aliases
- Added optional world aliases for `agon/agoff`, `bon/boff`, and `endon/endoff`.

## v2.16 — Remove barrier auto-AG
- Removed automatic `ag` sending when the barrier faded.

## v2.15 — Connector collision fix
- Prevented canonical map connectors from passing through unrelated room boxes.

## v2.14 — Attached floor ports
- Attached off-floor up/down indicators to their source rooms.

## v2.13 — Single-floor maps
- Render one authored Z level at a time while preserving vertical topology.

## v2.12 — Enemy A-Z browser
- Added alphabetical browsing of learned enemy names in mapper search.

## v2.11 — One-way exits
- Added one-way connector indicators and room-detail annotations.

## v2.10 — Consolas 11 persistence
- Corrected saved world-font persistence.

## v2.7 — Chat miniwindow routing
- Routed captured chat to the Communication miniwindow without duplicating it in main output.

## v2.6 — World map memory
- Added persistent learned overworld presentation cells.

## v2.4 — Map-backed speedwalk aliases
- Added persistent Automapper destination aliases.

## v2.1 — Monitor-scaled layout
- Added reference-layout scaling and responsive gutters.

## v2.0 — Portable trigger architecture
- Moved core/chat trigger behavior from one developer world into distributable plugins.

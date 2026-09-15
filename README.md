# SquareSoft MUSHclient UI Pack

A portable MUSHclient plugin suite for SquareSoft/UOSSMUD.

## Current baseline

Current baseline: **v2.19 — Optional Cockpit Plugins**.

The `bundle/` directory is the distributable client pack. Keep its files together: several plugins intentionally load sibling XML/assets/data files by relative path.

## Branches

- `main` — production/stable. Autobuff Tracker and Chakra Cooldown are bundled and installed but default to disabled.
- `dev` — active development. Those two plugins are bundled and enabled by default for testing.

The two optional plugins are the supplied Autobuff Tracker v1.2 and Chakra Cooldown v2.4. Autobuff Tracker expects world triggers named `ag`, `b`, and `end` plus the corresponding `agon/agoff`, `bon/boff`, and `endon/endoff` aliases.

## Install

1. Copy or extract `bundle/` to a permanent folder.
2. In MUSHclient, install `bundle/SquareSoft_UI_Installer.xml`.
3. Let the installer load the managed plugin suite.

The canonical automapper seed database (`SquareSoft_CanonicalMap_seed.sqlite`) must remain beside `SquareSoft_Automapper.xml`.

## Repository layout

- `bundle/` — exact files intended to ship to users.
- `tools/` — development/release helpers.
- `CHANGELOG.md` — package-level changes.

## Development rules

- Treat portability as a feature requirement: required behavior should not depend on one developer's MUSHclient world file.
- Preserve plugin IDs across upgrades.
- Do not rename or relocate files in `bundle/` without updating installer/relative-path assumptions.
- Do not commit runtime/learned mapper databases.
- Before packaging, validate XML and ZIP integrity.
- Changes should preserve existing suite behavior unless the change explicitly replaces it.

## Runtime data

The automapper copies the tracked canonical seed into a writable runtime database named `SquareSoft_Automapper_Canonical.sqlite` in MUSHclient's data area. That runtime database contains user-specific learned state and is deliberately not source-controlled.

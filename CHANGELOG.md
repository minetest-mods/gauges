# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed

- [Health and breath bars now adapt to custom maximum values instead of being hardcoded to 20 and 11 respectively.](https://github.com/minetest-mods/gauges/pull/9)

### Fixed

- [The health bar entity is no longer lost when a player teleports.](https://github.com/minetest-mods/gauges/pull/10)
  - A side effect is that health bar entities are no longer saved in map metadata.

## [1.0.4] - 2020-09-27

### Added

- Support for Minetest 5.3 and improved Minetest version definitions.

### Changed

- Gauge entities are now removed when the mod is disabled or when the server switches to creative mode.

## [1.0.3] - 2020-02-15

### Fixed

- Fix an issue with gauges occasionally no longer appearing above a player.

### Changed

- Improved the reliability of the Minetest version check (for compatibility with 0.4.17).

## [1.0.2] - 2020-01-16

### Fixed

- Fix crash when creating an entity if a player leaves the server quickly.

### Changed

- Restore Minetest 0.4.17 support. The version check works only with `minetest_game` with the `player_api` mod added in Minetest 5.0.

## [1.0.1] - 2020-01-01

### Changed

- Improve performance by localizing the `vector.distance()` function.

## 1.0.0 - 2020-01-01

- Initial versioned release.

[Unreleased]: https://github.com/minetest-mods/gauges/compare/v1.0.4...HEAD
[1.0.4]: https://github.com/minetest-mods/gauges/compare/v1.0.3...v1.0.4
[1.0.3]: https://github.com/minetest-mods/gauges/compare/v1.0.2...v1.0.3
[1.0.2]: https://github.com/minetest-mods/gauges/compare/v1.0.1...v1.0.2
[1.0.1]: https://github.com/minetest-mods/gauges/compare/v1.0.0...v1.0.1

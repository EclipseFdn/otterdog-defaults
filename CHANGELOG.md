# Change Log

## [0.2.0] - unreleased

### Added

- Added support for `dependabot_security_updates_enabled` setting for a repository.
- Added support for discussions on organizational and repository level.
- Added organization and repository setting `secrets` and associated template function to model secrets.
- Added repository setting `environments` and associated template function to model environments on repository level.
- Added repository setting `webhooks` to model webhooks on repository level.

### Removed

- Removed organization setting `members_can_create_pages`.
- Removed organization setting `organization_projects_enabled` which encodes the same information as `has_organization_projects`.
- Removed organization setting `team_discussions_allowed` which has been removed from the GitHub Web UI.

### Changed

- Changed organization setting `members_can_change_project_visibility` to `true`.


## [0.1.0] - 2022/06/12

Initial version.

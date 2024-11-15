# Change Log

## [0.9.3] - 2024/11/15

### Added

- Added a post hook when adding repositories to warn users that permissions will be setup by another service.

## [0.9.2] - 2024/10/21

### Added

- Added missing parameter `target` for a ruleset.

## [0.9.1] - 2024/10/07

### Added

- Added support for parameter `do_not_enforce_on_create` for status checks in a ruleset.

### Changed

- Converted status check related configurations of a ruleset to an embedded model.

## [0.9.0] - 2024/09/26

### Changed

- Changed repository ruleset configuration to be aligned with branch protection rule configuration.
- Converted pull request related configurations of a ruleset to an embedded model.

## [0.8.6] - 2024/09/26

### Added

- Added configuration for merge queues in a repository ruleset.

## [0.8.5] - 2024/09/03

### Added

- Added configuration for custom properties.

## [0.8.4] - 2024/06/27

### Added

- Added configuration to disable default code security configurations.

### Changed

- Updated reference to Eclipse Otterdog app as its slug has changed.
- Removed default values for deprecated and obsolete organization settings.

## [0.8.3] - 2024/06/05

### Added

- Added configuration for code scanning default setup of a repository.

## [0.8.2] - 2024/04/04

### Changed

- Changed organization setting `readers_can_create_discussions` to `true`.


## [0.8.1] - 2024/03/28

### Changed

- Changed `dismisses_stale_reviews` to `true` for pull requests in the `.eclipsefdn` repo.


## [0.8.0] - 2024/03/11

### Added

- Added support for repository setting `private_vulnerability_reporting_enabled`.

## [0.7.2] - 2024/01/30

### Changes

- Changed required status checks for pull requests in the `.eclipsefdn` repo.


## [0.7.1] - 2023/12/21

### Changes

- Adjusted branch protection rule settings for `.eclipsefdn` repo.


## [0.7.0] - 2023/12/09

### Changed

- Setting organization setting `plan` to value `enterprise`.


## [0.6.0] - 2023/12/05

### Added

- Added support for creating new repositories as fork.


## [0.5.0] - 2023/12/04

### Added

- Added support for organization and repository variables.


## [0.4.0] - 2023/10/25

### Changed

- Enforce organization setting `billing_email` to value `webmaster@eclipse-foundation.org`.


## [0.3.0] - 2023/10/24

### Added

- Added support for repository rulesets.
- Added support for workflow settings on repository level.

### Changed

- Changed organization setting `default_repository_permission` to `none`.


## [0.2.0] - 2023/09/23

### Added

- Added a pre hook when adding repositories to warn the user in case the project has no github.org field set in the PMI.
- Added support for workflow setting on organization level.
- Added support for GitHub Pages configuration for a repository.
- Added support for `blocks_creations` and `restricts_pushes` settings for a branch protection rule.
- Added validation rules to enforce certain organization settings.
- Added support for `dependabot_security_updates_enabled` setting for a repository.
- Added support for discussions on organizational and repository level.
- Added organization and repository setting `secrets` and associated template function to model secrets.
- Added repository setting `environments` and associated template function to model environments on repository level.
- Added repository setting `webhooks` to model webhooks on repository level.

### Removed

- Removed organization setting `default_workflow_permissions` which is now part of the workflow settings.
- Removed organization setting `members_can_create_pages`.
- Removed organization setting `organization_projects_enabled` which encodes the same information as `has_organization_projects`.
- Removed organization setting `team_discussions_allowed` which has been removed from the GitHub Web UI.

### Changed

- Changed repository setting `delete_branch_on_merge` to `true`.
- Changed repository setting `allow_merge_commit` to `false`.
- Added GitHub Pages configuration for '.eclipsefdn' repo.
- Disallow merge commits for '.eclipsefdn' repo.
- Renamed branch protection rule property `required_approving_reviews` to `requires_pull_request` which is more consistent with its semantics.
- Changed organization setting `members_can_change_project_visibility` to `true`.


## [0.1.0] - 2023/06/12

Initial version.

# Change Log

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

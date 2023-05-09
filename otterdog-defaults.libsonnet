local otterdog = import 'otterdog-functions.libsonnet';

# Function to create a new repository with default settings.
local newRepo(name) = {
  name: name,
  description: null,
  homepage: null,
  private: false,

  has_issues: true,
  has_projects: true,
  has_wiki: true,

  default_branch: "main",

  allow_rebase_merge: true,
  allow_merge_commit: true,
  allow_squash_merge: true,

  allow_auto_merge: false,
  delete_branch_on_merge: false,

  allow_update_branch: true,

  # Can be one of: PR_TITLE, COMMIT_OR_PR_TITLE
  squash_merge_commit_title: "COMMIT_OR_PR_TITLE",
  # Can be one of: PR_BODY, COMMIT_MESSAGES, BLANK
  squash_merge_commit_message: "COMMIT_MESSAGES",
  # Can be one of: PR_TITLE, MERGE_MESSAGE
  merge_commit_title: "MERGE_MESSAGE",
  # Can be one of: PR_BODY, PR_TITLE, BLANK
  merge_commit_message: "PR_TITLE",

  archived: false,

  # about private forks
  allow_forking: true,

  web_commit_signoff_required: true,

  # security analysis
  secret_scanning: "enabled",
  dependabot_alerts_enabled: true,

  branch_protection_rules: []
};

# Function to extend an existing repo with the same name.
local extendRepo(name) = {
   name: name
};

# Function to create a new branch protection rule with default settings.
local newBranchProtectionRule(pattern) = {
  pattern: pattern,
  allowsDeletions: false,
  allowsForcePushes: false,
  bypassForcePushAllowances: [],
  bypassPullRequestAllowances: [],
  dismissesStaleReviews: false,
  isAdminEnforced: false,
  lockAllowsFetchAndMerge: false,
  lockBranch: false,
  pushRestrictions: [],
  requiredStatusChecks: [
    # by default, the eclipse contributor agreement check must pass.
    "eclipse-eca-validation:eclipsefdn/eca",
  ],
  requiredApprovingReviewCount: 2,
  requiresApprovingReviews: true,
  requiresCodeOwnerReviews: false,
  requiresCommitSignatures: false,
  requiresConversationResolution: false,
  requiresLinearHistory: false,
  requiresStatusChecks: true,
  requiresStrictStatusChecks: false,
  restrictsReviewDismissals: false,
  reviewDismissalAllowances: [],
  requireLastPushApproval: false
};

# Function to create a new organization with default settings.
local newOrg(id) = {
  github_id: id,
  settings: {
    name: null,
    plan: "free",
    billing_email: "webmaster@eclipse-foundation.org",
    company: null,
    email: null,
    twitter_username: null,
    location: null,
    description: null,
    blog: null,

    has_organization_projects: true,
    has_repository_projects: true,

    # Base permissions to the organization’s repositories apply to all members and excludes outside collaborators.
    # Since organization members can have permissions from multiple sources, members and collaborators who have been
    # granted a higher level of access than the base permissions will retain their higher permission privileges.
    # Can be one of: read, write, admin, none
    default_repository_permission: "read",

    # Repository creation
    members_can_create_private_repositories: false,
    members_can_create_public_repositories: false,

    # Repository forking
    # Its enabled by default to allow fine-grained control on repo level.
    members_can_fork_private_repositories: true,

    # Repository defaults: Commit signoff
    web_commit_signoff_required: true,

    # GitHub Pages
    members_can_create_pages: true,
    members_can_create_public_pages: true,

    dependabot_alerts_enabled_for_new_repositories: true,
    dependabot_security_updates_enabled_for_new_repositories: true,
    dependency_graph_enabled_for_new_repositories: true,

    ## Admin repository permissions

    # If enabled, members with admin permissions for the repository will be able to change its visibility.
    # If disabled, only organization owners can change repository visibilities.
    members_can_change_repo_visibility: false,

    # If enabled, members with admin permissions for the repository will be able to delete or transfer public
    # and private repositories. If disabled, only organization owners can delete or transfer repositories.
    members_can_delete_repositories: false,

    # If enabled, members with admin permissions for the repository will be able to delete issues.
    # If disabled, only organization owners can delete issues.
    members_can_delete_issues: false,

    # If enabled, all users with read access can create and comment on discussions in repositories of the organization.
    # If disabled, discussion creation is limited to users with at least triage permission.
    # Users with read access can still comment on discussions.
    readers_can_create_discussions: false,

    ## Member team permissions

    # If enabled, any member of the organization will be able to create new teams.
    # If disabled, only organization owners can create new teams.
    members_can_create_teams: false,

    two_factor_requirement: true,

    team_discussions_allowed: true,

    default_branch_name: "main",

    packages_containers_public: true,
    packages_containers_internal: true,

    organization_organization_projects_enabled: true,
    organization_members_can_change_project_visibility: false
  },

  webhooks: [],

  # List of repositories of the organization.
  # Entries here can be extended during template manifestation:
  #  * new repos should be defined using the newRepo template
  #  * extending existing repos inherited from the default config should be defined using the extendRepo template
  _repositories:: [
      newRepo('.eclipsefdn-private') {
        description: "Repository to host configurations related to the Eclipse Foundation.",
        private: true,
        allow_forking: true,
        delete_branch_on_merge: true,
        has_projects: false,
        has_wiki: false
      }
  ],

  # Merges configuration settings for repositories defined in _repositories
  # using the name of the repo as key. The result is unique array of repository
  # configurations.
  repositories: otterdog.mergeByKey(self._repositories, "name"),
};

# Function to create a new organization webhook with default settings.
local newWebhook() = {
  active: true,
  events: [],
  url: null,
  # Can be one of: form, json
  content_type: "form",
  insecure_ssl: "0",
  secret: null,
};

{
  newOrg:: newOrg,
  newWebhook:: newWebhook,
  newRepo:: newRepo,
  extendRepo:: extendRepo,
  newBranchProtectionRule:: newBranchProtectionRule
}

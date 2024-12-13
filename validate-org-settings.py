# some EF specific validation rules for organization settings:

context.property_equals(self, "default_repository_permission", "none")
context.property_equals(self, "billing_email", "webmaster@eclipse-foundation.org")
context.property_equals(self, "members_can_create_public_repositories", False)
context.property_equals(self, "members_can_create_private_repositories", False)
context.property_equals(self, "members_can_change_repo_visibility", False)
context.property_equals(self, "members_can_delete_repositories", False)
context.property_equals(self, "members_can_create_teams", False)
context.property_equals(self, "default_code_security_configurations_disabled", True)
context.property_equals(self, "two_factor_requirement", True)

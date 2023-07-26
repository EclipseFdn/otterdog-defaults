# some EF specific validation rules for organization settings:

context.property_equals(self, "default_repository_permission", "none")
context.property_equals(self, "members_can_create_public_repositories", False)
context.property_equals(self, "members_can_create_private_repositories", False)
context.property_equals(self, "members_can_create_teams", False)

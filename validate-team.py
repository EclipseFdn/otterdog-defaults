#  *******************************************************************************
#  Copyright (c) 2024 Eclipse Foundation and others.
#  This program and the accompanying materials are made available
#  under the terms of the Eclipse Public License 2.0
#  which is available at http://www.eclipse.org/legal/epl-v20.html
#  SPDX-License-Identifier: EPL-2.0
#  *******************************************************************************

# some EF specific validation rules for organization teams:
#
# - do not allow to invite new members to the organization, this shall entirely be handled by the sync script

context.property_equals(self, "skip_non_organization_members", True)

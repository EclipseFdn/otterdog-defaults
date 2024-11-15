#  *******************************************************************************
#  Copyright (c) 2024 Eclipse Foundation and others.
#  This program and the accompanying materials are made available
#  under the terms of the Eclipse Public License 2.0
#  which is available at http://www.eclipse.org/legal/epl-v20.html
#  SPDX-License-Identifier: EPL-2.0
#  *******************************************************************************

# some EF specific hooks when applying changes:

from otterdog.models.repository import Repository

added_repo_names = []
for patch in patches:
    if isinstance(patch.expected_object, Repository):
        added_repo_names.append(patch.expected_object.name)

if len(added_repo_names) > 0:
    message = "The following GitHub repos have been created:\n"
    for repo_name in added_repo_names:
        message += f"- https://github.com/{org_config.github_id}/{repo_name}\n"
    message += "\nCommitters will gain access to it once the sync script runs (~2h)."

    self.printer.print_warn(message)

# some EF specific hooks when applying changes:

import requests
from typing import cast

from otterdog.utils import print_warn
from otterdog.models.repository import Repository

if isinstance(model_object, Repository):
    project_name = org_config.name
    repository = cast(Repository, model_object)

    response = requests.get(f"https://projects.eclipse.org/api/projects/{project_name}")

    has_github_org = False
    if response.status_code == 200:
        projects = response.json()
        for project in projects:
            github = project.get("github", None)
            if github is not None:
                github_org = github.get("org")
                if github_org is not None and len(github_org) > 0:
                    has_github_org = True

        if has_github_org is False:
            print_warn(
                f"Adding repository '{repository.name}' while the project '{project_name}' has no "
                f"GitHub organization configured in the PMI.\n"
                f"Don't forget to add an entry for this repo to the list of GitHub repositories: \n"
                f"  https://github.com/{org_config.github_id}/{repository.name}"
            )
    elif response.status_code == 404:
        print_warn(f"No Eclipse project found for project with name '{project_name}'.")

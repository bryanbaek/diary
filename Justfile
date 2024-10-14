set shell := ["bash", "-cuexa"]

lint:
  #!/bin/bash -e
  files="$(git diff --name-only --merge-base origin/main)"
  echo "$files" | tr '\n' '\0' | xargs -0 poetry run pre-commit run --files
  echo "$files" | tr '\n' '\0' | xargs -0 poetry run pre-commit run pylint --hook-stage manual --fil
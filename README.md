# Django Scaffolding

🚀 Template project to start off Django applications with at least REST API support.

## Helpers

Check where to change files that contain {app_name}:
`find ./ -type f | xargs grep {app_name}`

Copy the project somewhere without git directory:
`rsync -av --progress $(pwd)/ /path/to/project/ --exclude .git/`

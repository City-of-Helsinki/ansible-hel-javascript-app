Javascript application deployer
-------------------------------
A role to install Javascript applications using package.json to specify
build and install steps

Configurable:
- Node version to use
- NPM packages to install
- user name
- service name

Configuration
-------------
All configuration is prefixed by heljs

Setting name | Description
------------ | -----------
heljs_user | system user owning the files and running the (potential) server processes
heljs_name | name for the system user ("gecos")
heljs_nodeversion | Node version that should be installed as understood by NVM
heljs_use_yarn | Use yarn to install packages.json contents instead of NPM
heljs_npm_modules | which npmjs modules to install before package.json
heljs_git.url | git url for the software to install (note the dot)
heljs_git.version | git version to install (note the dot)
heljs_build_environment | environment variables to set during build
heljs_build_commands | commands to run for building the project
heljs_project_conffiles | project specific conffiles (src and dst)
heljs_static_archives | extract these archives (src and dst)
heljs_project_server | whether to use pm2 to run a project server
heljs_webname | virtualhosts to server the stuff out from
heljs_canonical_name | name for the certificate

heljs_build_environment is intended to support build steps that derive their configuration from environment variables. Environment variables are nice for this, as they will not remain
lingering on the server, possibly corrupting future builds.

heljs_build_commands is a list of commands to be run within the node environment (using version specified through heljs_nodeversion).

heljs_project_conffiles is a list (configuration) files with sources on the management system (src) and corresponding filename on the target system (dst)

heljs_static_archives is almost identical to conffiles, expect that the sources are expected to be archives (supported to Ansible archive module). Those archives are then extracted to
as specified by corresponding dst.

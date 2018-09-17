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
heljs.user | system user owning the files and running and server processes
heljs.name | name for the system user ("gecos")
heljs.nodeversion | Node that should be installed as understood by NVM
heljs.use_yarn | Use yarn to install packages.json contents
heljs.npm_modules | which npmjs modules to install before package.json
heljs.git.url | git url for the software to install
heljs.git.version | git version to install
heljs.build_environment | environment variables to set during build
heljs.build_commands | commands to run to build the project
heljs.project_conffiles | project specific conffiles (src and dst)
heljs.static_archives | extract these archives (src and dst)
heljs.project_server | whether to use pm2 to run project server
heljs.webname | virtualhosts to server the stuff out from
heljs.canonical_name | name for the certificate

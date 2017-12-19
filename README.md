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
All configuration is prefixed by hel_js

node_container.user: system user owning the files and running and server processes
node_container.name: name for the system user ("gecos")
node_container.nodeversion: Node that should be installed as understood by NVM
node_container.use_yarn: Use yarn to install packages.json contents
node_container.npm_modules: which npmjs modules to install before package.json
node_container.git.url: git url for the software to install
node_container.git.version: git version to install
node_container.build_environment: environment variables to set during build
node_container.build_commands: commands to run to build the project
node_container.project_conffiles: project specific conffiles (src and dst)
node_container.static_archives: extract these archives (src and dst)
node_container.project_server: whether to use pm2 to run project server
node_container.webname: virtualhosts to server the stuff out from
node_container.canonical_name: name for the certificate

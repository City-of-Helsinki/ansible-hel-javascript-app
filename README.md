Node runtime deployer
----------
A role to install Node-based applications.

This role sets up Nginx as a frontend for the application and to optionally
serve out static files.

Configurable:
- local listening port
- Node version to use
- NPM packages to install
- user name
- service name

Configuration
-------------
All configuration is inside node_container

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

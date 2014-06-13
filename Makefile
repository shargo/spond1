PROJ_ROOT=${PWD}
DEPLOY_DIR=${PROJ_ROOT}/target/deploy
SPOND_REPOS_REF=https://github.com/Spondoolies-Tech

PKG_LIST = $(dir $(wildcard packages/*/))

%:
	for d in ${PKG_LIST}; do make -C $$d $@ PROJ_ROOT="${PROJ_ROOT}" SPOND_REPOS_REF="${SPOND_REPOS_REF}" DEPLOY_DIR=${DEPLOY_DIR}; done

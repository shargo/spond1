PROJ_ROOT=${PWD}
DEPLOY_DIR=${PROJ_ROOT}/target/deploy
SPOND_REPOS_REF=https://github.com/Spondoolies-Tech

PKG_LIST = $(patsubst %/, %, $(dir $(wildcard packages/*/)))

init:
	-make -C packages/kernel init
	-make -C packages/buildroot init
	-for d in $(filter-out %/kernel %/buildroot, ${PKG_LIST}); do echo make -C $$d $@ PROJ_ROOT="${PROJ_ROOT}" SPOND_REPOS_REF="${SPOND_REPOS_REF}" DEPLOY_DIR=${DEPLOY_DIR}; done

%:
	for d in ${PKG_LIST}; do make -C $$d $@ PROJ_ROOT="${PROJ_ROOT}" SPOND_REPOS_REF="${SPOND_REPOS_REF}" DEPLOY_DIR=${DEPLOY_DIR}; done

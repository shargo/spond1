PROJ_ROOT=${PWD}
DEPLOY_DIR=${PROJ_ROOT}/target/deploy
SPOND_REPOS_REF=https://github.com/Spondoolies-Tech
PACKAGES_SUBDIR=packages

PKG_LIST = $(patsubst ${PACKAGES_SUBDIR}/%/, %, $(dir $(wildcard ${PACKAGES_SUBDIR}/*/)))

init:
	for d in kernel buildroot $(filter-out kernel buildroot, ${PKG_LIST}); do echo make -C ${PACKAGES_SUBDIR}/$$d; done

%:
	for d in ${PKG_LIST}; do make -C ${PACKAGES_SUBDIR}/$$d $@ PROJ_ROOT="${PROJ_ROOT}" SPOND_REPOS_REF="${SPOND_REPOS_REF}" DEPLOY_DIR=${DEPLOY_DIR}; done

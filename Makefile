PROJ_ROOT=${PWD}
DEPLOY_DIR=${PROJ_ROOT}/target/deploy
SPOND_REPOS_REF=https://github.com/Spondoolies-Tech
PACKAGES_SUBDIR=packages
GEN_TARGETS=get build

PKG_LIST = $(patsubst ${PACKAGES_SUBDIR}/%/, %, $(dir $(wildcard ${PACKAGES_SUBDIR}/*/)))

image: do_deploy
do_deploy: build deploy

init:
	for d in kernel $(filter-out kernel, ${PKG_LIST}); do echo make -C ${PACKAGES_SUBDIR}/$$d $@; done

deploy:
	echo ${PROJ_ROOT} > packages/buildroot/root-dir
	for d in $(filter-out kernel buildroot, ${PKG_LIST}) buildroot kernel; do echo make -C ${PACKAGES_SUBDIR}/$$d $@ DEPLOY_DIR=${DEPLOY_DIR}; done

$(GEN_TARGETS):
	for d in ${PKG_LIST}; do make -C ${PACKAGES_SUBDIR}/$$d $@ SPOND_REPOS_REF="${SPOND_REPOS_REF}" ; done

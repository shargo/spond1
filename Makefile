PROJ_ROOT=${PWD}
SPOND_REPOS_REF=https://github.com/Spondoolies-Tech

PKG_LIST = $(dir $(wildcard packages/*/))

%:
	for d in ${PKG_LIST}; do rm -rf $$d/src ; make -C $$d $@ PROJ_ROOT="${PROJ_ROOT}" SPOND_REPOS_REF="${SPOND_REPOS_REF}"; done

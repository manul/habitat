pkg_name=click
pkg_distname=${pkg_name}
pkg_version=6.7
pkg_origin=rf_pub
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A simple wrapper around optparse for powerful command line \
utilities."
pkg_upstream_url=http://github.com/mitsuhiko/click
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/c/click/${pkg_dirname}.tar.gz
pkg_shasum=f15516df478d5a56180fbf80e68f206010e6d160fc39fa508b65e035fd75130b
pkg_deps=(

)
pkg_build_deps=(
  rf_pub/python
  rf_pub/pytest
  rf_pub/setuptools
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

pkg_bin_dirs=(bin)
pkg_lib_dirs=(lib)

do_setup_environment() {
  push_runtime_env PYTHONPATH "$(pkg_path_for core/python)/lib/python2.7/site-packages"
  push_runtime_env PYTHONPATH "${pkg_prefix}/lib/python2.7/site-packages"
}

do_prepare() {
  mkdir -p "${pkg_prefix}/lib/python2.7/site-packages"
}

do_build() {
  python setup.py build
}

do_install() {
    python setup.py install --prefix="$pkg_prefix" --optimize=1 --skip-build
}

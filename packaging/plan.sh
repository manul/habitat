pkg_name=packaging
pkg_distname=${pkg_name}
pkg_version=16.8
pkg_origin=rf_pub
pkg_license=('Apache-2.0' 'BSD-2-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Core utilities for Python packages"
pkg_upstream_url=https://github.com/pypa/packaging
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/packaging/${pkg_dirname}.tar.gz
pkg_shasum=5d50835fdf0a7edf0b55e311b7c887786504efea1177abd7e69329a8e5ea619e
pkg_deps=(
  rf_pub/python
  rf_pub/pyparsing
  rf_pub/six
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

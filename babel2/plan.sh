pkg_name=babel2
pkg_distname=Babel
pkg_version=2.4.2
pkg_origin=rf_pub
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Internationalization utilities"
pkg_upstream_url=http://babel.pocoo.org/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/b/babel/${pkg_dirname}.tar.gz
pkg_shasum=8c98f5e5f8f5f088571f2c6bd88d530e331cbbcb95a7311a0db69d3dca7ec563
pkg_deps=(
  rf_pub/python2
  rf_pub/pytz2
  rf_pub/setuptools2
)
pkg_build_deps=(
  rf_pub/pytest
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

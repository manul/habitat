pkg_name=werkzeug
pkg_distname=Werkzeug
pkg_version=0.12.1
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="The Swiss Army knife of Python web development"
pkg_upstream_url=http://werkzeug.pocoo.org/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/w/werkzeug/${pkg_dirname}.tar.gz
pkg_shasum=6716830febe9808bb7521fd26db3b398450cbed0886b2b4bea678b87340f534e
pkg_deps=(
  rf_pub/python
)
pkg_build_deps=(
  rf_pub/pytest
  # circular dep
  # rf_pub/requests
  rf_pub/setuptools
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

pkg_name=pytz
pkg_distname=${pkg_name}
pkg_version=2017.2
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="World timezone definitions, modern and historical"
pkg_upstream_url=http://pythonhosted.org/pytz
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/pytz/${pkg_dirname}.zip
pkg_shasum=f5c056e8f62d45ba8215e5cb8f50dfccb198b4b9fbea8500674f3443e4689589
pkg_deps=(
  rf_pub/python
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

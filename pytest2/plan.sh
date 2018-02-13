pkg_name=pytest2
pkg_distname=${pkg_name}
pkg_version=3.0.7
pkg_origin=rf_pub
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Simple powerful testing with Python"
pkg_upstream_url=http://pytest.org/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/pytest/${pkg_dirname}.tar.gz
pkg_shasum=b70696ebd1a5e6b627e7e3ac1365a4bc60aaf3495e843c1e70448966c5224cab
pkg_deps=(
  rf_pub/python2
  rf_pub/py2
  rf_pub/setuptools2
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)
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

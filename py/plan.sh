pkg_name=py
pkg_distname=${pkg_name}
pkg_version=1.4.33
pkg_origin=rf_pub
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Library with cross-python path, ini-parsing, io, code, log \
facilities."
pkg_upstream_url=http://pylib.readthedocs.org/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/py/${pkg_dirname}.tar.gz
pkg_shasum=1f9a981438f2acc20470b301a07a496375641f902320f70e31916fe3377385a9
pkg_deps=(
  rf_pub/python
  rf_pub/appdirs
  rf_pub/six
  rf_pub/packaging
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

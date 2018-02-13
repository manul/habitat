pkg_name=setuptools
pkg_distname=${pkg_name}
pkg_version=35.0.1
pkg_origin=rf_pub
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Easily download, build, install, upgrade, and uninstall \
Python packages"
pkg_upstream_url=https://github.com/pypa/setuptools
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/s/setuptools/${pkg_dirname}.zip
pkg_shasum=eea7f2ff55d4a810b6bc39be1ad1c60c2702341b78b2365c71306eaa7316beac
pkg_deps=(
  core/python2
  rf_pub/appdirs
  rf_pub/packaging
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

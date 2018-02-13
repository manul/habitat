pkg_name=itsdangerous
pkg_distname=${pkg_name}
pkg_version=0.24
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Various helpers to pass trusted data to untrusted \
environments and back."
pkg_upstream_url=https://github.com/pallets/itsdangerous
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/i/itsdangerous/${pkg_dirname}.tar.gz
pkg_shasum=cbb3fcf8d3e33df861709ecaf89d9e6629cff0a217bc2848f1b41cd30d360519
pkg_deps=(
  rf_pub/python
)
pkg_build_deps=(
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

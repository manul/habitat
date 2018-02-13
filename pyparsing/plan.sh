pkg_name=pyparsing
pkg_distname=${pkg_name}
pkg_version=2.2.0
pkg_origin=rf_pub
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A Python Parsing Module"
pkg_upstream_url=https://pyparsing.wikispaces.com/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/pyparsing/${pkg_dirname}.tar.gz
pkg_shasum=0832bcf47acd283788593e7a0f542407bd9550a55a8a8435214a1960e04bcb04
pkg_deps=(
  rf_pub/python
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

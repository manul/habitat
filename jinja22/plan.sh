pkg_name=jinja22
pkg_distname=Jinja2
pkg_version=2.9.6
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A small but fast and easy to use stand-alone template engine \
written in pure python."
pkg_upstream_url=http://jinja.pocoo.org/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/j/jinja2/${pkg_dirname}.tar.gz
pkg_shasum=ddaa01a212cd6d641401cb01b605f4a4d9f37bfc93043d7f760ec70fb99ff9ff
pkg_deps=(
  rf_pub/python2
  rf_pub/babel2
  rf_pub/markupsafe2
)
pkg_build_deps=(
  rf_pub/setuptools2
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

pkg_name=markupsafe2
pkg_distname=MarkupSafe
pkg_version=1.0
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Implements a XML/HTML/XHTML Markup safe string for Python"
pkg_upstream_url=http://github.com/pallets/markupsafe
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/m/markupsafe/${pkg_dirname}.tar.gz
pkg_shasum=a6be69091dac236ea9c6bc7d012beab42010fa914c459791d627dad4910eb665
pkg_deps=(
  rf_pub/python2
)
pkg_build_deps=(
  core/gcc
  rf_pub/setuptools2
  rf_pub/six2
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

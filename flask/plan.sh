pkg_name=flask
pkg_distname=Flask
pkg_version=0.12.1
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A microframework based on Werkzeug, Jinja2 and good intentions"
pkg_upstream_url=http://github.com/pallets/flask/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/f/flask/${pkg_dirname}.tar.gz
pkg_shasum=9dce4b6bfbb5b062181d3f7da8f727ff70c1156cbb4024351eafd426deb5fb88
pkg_deps=(
  rf_pub/python
  rf_pub/click
  rf_pub/itsdangerous
  rf_pub/jinja2
  rf_pub/setuptools
  rf_pub/werkzeug
)
pkg_build_deps=(
  rf_pub/pytest
)


do_check() {
  export PYTHONPATH="$PWD/build/lib:$PWD/examples/flaskr:$PWD/examples/minitwit:$PYTHONPATH"
  pytest

  # Remove bytecode files
  find . -type f -name '*.py[co]' -delete
}

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

pkg_name=python2
pkg_distname=Python
pkg_version=2.7.14
pkg_origin=rf_pub
pkg_license=('Python-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Python is a programming language that lets you work quickly \
and integrate systems more effectively."
pkg_upstream_url=https://www.python.org/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://www.python.org/ftp/python/${pkg_version}/${pkg_dirname}.tgz
pkg_shasum=2603700da5d731e5ccca0049f33d0fb6416e405c46b4853b78b7aa808b77ffb4
pkg_deps=(
  core/bzip2
  core/gcc-libs
  core/gdbm
  core/glibc
  core/ncurses
  core/openssl
  core/readline
  core/sqlite
  core/zlib
)

pkg_build_deps=(
  core/coreutils
  core/diffutils
  core/gcc
  core/gdb
  core/linux-headers
  core/make
  core/util-linux
)
pkg_build_env=(
  ['PYTHON_SITE_PACKAGES']="lib/python${pkg_version%.*}/site-packages"
)
pkg_lib_dirs=(lib)
pkg_bin_dirs=(bin)
pkg_include_dirs=(include)
pkg_interpreters=(bin/python bin/python2 bin/python2.7)

do_prepare() {
  sed -i.bak 's/#zlib/zlib/' Modules/Setup.dist
  sed -i -re "/(SSL=|_ssl|-DUSE_SSL|-lssl).*/ s|^#||" Modules/Setup.dist
}

do_build() {
  ./configure --prefix="$pkg_prefix" \
    --enable-shared \
    --enable-unicode=ucs4 \
    --without-ensurepip
  make
}

do_check() {
  # disable test_locale because string are unicode and TestStringMethods does
  # not expect this, even though the behavior is correct.
  export EXTRATESTOPTS='-x test_locale'
  make quicktest
}

do_strip() {
  do_default_strip

  # Remove bytecode files
  find . -type f -name '*.py[co]' -delete
}

do_install() {
  do_default_install

  platlib=$(python -c "import sysconfig;print(sysconfig.get_path('platlib'))")
  cat <<EOF > "$platlib/_manylinux.py"
# Disable binary manylinux1(CentOS 5) wheel support
manylinux1_compatible = False
EOF
}

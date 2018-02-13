pkg_name=python-hello
pkg_version=0.1.0
pkg_deps=(core/python2 core/openssl rf_pub/flask)
pkg_build_deps=(core/coreutils core/gcc)
pkg_origin=miketheman
pkg_maintainer='Mike Fiedler'
pkg_expose=(5000)

# we copy in the source code in the `unpack` phase and need to put
# something here due to https://github.com/habitat-sh/habitat/issues/870
pkg_source="fake"

# Need to opt-out of all of these steps, as we're copying in source code
do_download() {
  return 0
}
do_verify() {
  return 0
}
do_clean() {
  return 0
}

do_unpack() {
  mkdir -p $pkg_prefix
  build_line "Copying src/ to $pkg_prefix/"
  cp -r $PLAN_CONTEXT/src/ $pkg_prefix/
}

do_build() {
  pip install --upgrade pip
}

do_install() {
  cd $pkg_prefix/src
  pip install -r requirements.txt
}

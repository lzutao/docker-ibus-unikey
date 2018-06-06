# Docker IBus Unikey

Add `[ci skip]` or `[skip ci]` to the git commit message if you changed only this `README.md`.

[![Docker Build Status][docker shield]][docker hub]

Docker image basics for building docker-ibus-unikey using [Ubuntu 18.04][ubuntu 18] and [Meson] build system.

This is an effort for building a stable test environment for the IBus Unikey. You may find this on [docker hub].

**See also**:

* [ibus-unikey]: An Vietnamese Input Method Engine for [IBus][ibus-wiki] using Unikey Engine.

[docker shield]: https://img.shields.io/docker/build/lzutao/docker-ibus-unikey.svg?style=flat-square
[docker hub]: https://hub.docker.com/r/lzutao/docker-ibus-unikey/
[ibus-unikey]: https://github.com/lzutao/ibus-unikey
[ibus-wiki]: https://en.wikipedia.org/wiki/Intelligent_Input_Bus
[ubuntu 18]: https://www.ubuntu.com/
[Meson]: http://mesonbuild.com/

## Usage with Ibus Unikey on Travis

Travis automatic downloads the reposity to `TRAVIS_BUILD_DIR`, hence an example `.travis.yml`:
```yaml
dist: trusty
sudo: required
language: cpp
services:
  - docker          # docker still needs sudo
compiler:
  - gcc
before_install:
  - docker pull lzutao/docker-ibus-unikey
install:
before_script:
script:
  - docker run --rm -v "$TRAVIS_BUILD_DIR":/SRC lzutao/docker-ibus-unikey sh -c "cd /SRC
      && meson builddir --prefix=/usr --libexec=lib/ibus
      && ninja -C builddir install
      && /usr/lib/ibus/ibus-engine-unikey  --version
      && /usr/lib/ibus/ibus-setup-unikey   --version"
after_success:
after_failure:
before_deploy:
deploy:
after_deploy:
after_script:
```

## LICENSE

Docker IBus Unikey is offered under the terms of the [MTT Licence][LICENCE].

[LICENCE]: COPYING

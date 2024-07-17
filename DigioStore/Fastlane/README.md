fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## iOS

### ios _increment_build

```sh
[bundle exec] fastlane ios _increment_build
```

Increment Build Number

### ios _connect_appstore

```sh
[bundle exec] fastlane ios _connect_appstore
```

Login Apple Connect

### ios _production

```sh
[bundle exec] fastlane ios _production
```

Build&Distribute App for AppStore

### ios _staging

```sh
[bundle exec] fastlane ios _staging
```

Build&Distribute App for Testflight

### ios _firebase_upload

```sh
[bundle exec] fastlane ios _firebase_upload
```

Build&Distribute Staging App

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).

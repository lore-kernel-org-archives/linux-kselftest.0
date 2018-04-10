From: joe.lawrence at redhat.com (Joe Lawrence)
Date: Tue, 10 Apr 2018 11:15:53 -0400
Subject: [PATCH v2] Add livepatch kselftests
Message-ID: <1523373354-10801-1-git-send-email-joe.lawrence@redhat.com>

Round two cleans up a few misc script and build items, adds a shadow
variable test, and reduces the total livepatch kselftest runtime to ~45
seconds.

The tests run on top of Petr's v11 atomic replace feature and v2 of the
shadow variable enhancement patchsets:

  [PATCH 0/8] livepatch: Atomic replace feature
  https://lkml.kernel.org/r/20180323120028.31451-1-pmladek at suse.com

  [PATCH v2 0/2] livepatch: Allocate and free shadow variables more safely
  https://lkml.kernel.org/r/20180405122315.29065-1-pmladek at suse.com

Questions for v3:

  - Should we split off the atomic replace and shadow variable update
    tests so that the this patchset could be merged before the ones
    listed above?

  - I didn't remove any of the sample modules.  If anyone thinks any of
    them should go, let me know.  They serve as nice, simple examples so
    I thought they should all stay.

  - Module naming convention: to make the test script easier to grep
    module names and filenames, I broke with livepatch convention and
    used underscores instead of dashes.  I didn't think it worth the
    regex foo to flip back and forth in the test script.

  - More tests from Libor and Nicolai would be welcome!
    -- Maybe we separate quicktests (like these) from longer tests if
       needed?

Here's a sample output from a successful test run:

  % time make -C tools/testing/selftests TARGETS=livepatch run_tests
  make: Entering directory `/root/linux/tools/testing/selftests'
  make[1]: Entering directory `/root/linux/tools/testing/selftests/livepatch'
  make[1]: Nothing to be done for `all'.
  make[1]: Leaving directory `/root/linux/tools/testing/selftests/livepatch'
  make[1]: Entering directory `/root/linux/tools/testing/selftests/livepatch'
  TAP version 13
  selftests: test-livepatch.sh
  ========================================
  TEST: basic function patching ... ok
  TEST: multiple livepatches ... ok
  TEST: atomic replace livepatch ... ok
  ok 1..1 selftests: test-livepatch.sh [PASS]
  selftests: test-callbacks.sh
  ========================================
  TEST: target module before livepatch ... ok
  TEST: module_coming notifier ... ok
  TEST: module_going notifier ... ok
  TEST: module_coming and module_going notifiers ... ok
  TEST: target module not present ... ok
  TEST: pre-patch callback -ENODEV ... ok
  TEST: module_coming + pre-patch callback -ENODEV ... ok
  TEST: multiple target modules ... ok
  TEST: busy target module ... ok
  TEST: multiple livepatches ... ok
  TEST: atomic replace ... ok
  ok 1..2 selftests: test-callbacks.sh [PASS]
  selftests: test-shadow-vars.sh
  ========================================
  TEST: basic shadow variable API ... ok
  ok 1..3 selftests: test-shadow-vars.sh [PASS]
  make[1]: Leaving directory `/root/linux/tools/testing/selftests/livepatch'
  make: Leaving directory `/root/linux/tools/testing/selftests'

  real    0m46.166s
  user    0m0.436s
  sys     0m1.244s


changes from v1:
- Only add $(CC_FLAGS_FTRACE) for target modules
- Remove between test delay
- Reduce RETRY_INTERVAL to .1 sec
- Reduce test_callback_mod's busymod_work_func delay from 60 to 10 sec
- s/PASS/ok and s/FAIL/not ok for test output
- Move test descriptions from Documentation/livepatch/callbacks.txt
  into tools/testing/selftests/livepatch/test-callbacks.sh
- Add a shadow variable test script and module
- Add a short tools/testing/selftests/livepatch/README
- to += linux-kselftest at vger.kernel.org
- cc += Libor, Nicolai, Artem

change from rfc:
- SPDX-License-Identifiers
- Moved livepatch test modules into lib/livepatch
- Renamed livepatch.sh (filename suffix)
- Reduced between-test delay time
- Split off common functions.sh file
- Split into separate livepatch, callbacks, and shadow-vars scrips
- Gave the tests short descriptions instead of TEST1, TEST2, etc.

Joe Lawrence (1):
  selftests/livepatch: introduce tests

 Documentation/livepatch/callbacks.txt              | 487 -----------------
 lib/Kconfig.debug                                  |  12 +
 lib/Makefile                                       |   2 +
 lib/livepatch/Makefile                             |  15 +
 lib/livepatch/test_klp_atomic_replace.c            |  69 +++
 lib/livepatch/test_klp_callbacks_busy.c            |  43 ++
 lib/livepatch/test_klp_callbacks_demo.c            | 132 +++++
 lib/livepatch/test_klp_callbacks_demo2.c           | 104 ++++
 lib/livepatch/test_klp_callbacks_mod.c             |  24 +
 lib/livepatch/test_klp_livepatch.c                 |  62 +++
 lib/livepatch/test_klp_shadow_vars.c               | 235 ++++++++
 tools/testing/selftests/Makefile                   |   1 +
 tools/testing/selftests/livepatch/Makefile         |   8 +
 tools/testing/selftests/livepatch/config           |   1 +
 tools/testing/selftests/livepatch/functions.sh     | 196 +++++++
 .../testing/selftests/livepatch/test-callbacks.sh  | 607 +++++++++++++++++++++
 .../testing/selftests/livepatch/test-livepatch.sh  | 173 ++++++
 .../selftests/livepatch/test-shadow-vars.sh        |  60 ++
 18 files changed, 1744 insertions(+), 487 deletions(-)
 create mode 100644 lib/livepatch/Makefile
 create mode 100644 lib/livepatch/test_klp_atomic_replace.c
 create mode 100644 lib/livepatch/test_klp_callbacks_busy.c
 create mode 100644 lib/livepatch/test_klp_callbacks_demo.c
 create mode 100644 lib/livepatch/test_klp_callbacks_demo2.c
 create mode 100644 lib/livepatch/test_klp_callbacks_mod.c
 create mode 100644 lib/livepatch/test_klp_livepatch.c
 create mode 100644 lib/livepatch/test_klp_shadow_vars.c
 create mode 100644 tools/testing/selftests/livepatch/Makefile
 create mode 100644 tools/testing/selftests/livepatch/config
 create mode 100644 tools/testing/selftests/livepatch/functions.sh
 create mode 100755 tools/testing/selftests/livepatch/test-callbacks.sh
 create mode 100755 tools/testing/selftests/livepatch/test-livepatch.sh
 create mode 100755 tools/testing/selftests/livepatch/test-shadow-vars.sh

--
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

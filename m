From: joe.lawrence at redhat.com (Joe Lawrence)
Date: Thu, 12 Apr 2018 10:54:30 -0400
Subject: [PATCH v3] Add livepatch kselftests
Message-ID: <1523544871-29444-1-git-send-email-joe.lawrence@redhat.com>

Tests run on top of Petr's v11 atomic replace feature and v2 of the shadow
variable enhancement patchsets:

  [PATCH 0/8] livepatch: Atomic replace feature
  https://lkml.kernel.org/r/20180323120028.31451-1-pmladek at suse.com

  [PATCH v2 0/2] livepatch: Allocate and free shadow variables more safely
  https://lkml.kernel.org/r/20180405122315.29065-1-pmladek at suse.com

which have been combined into a git tree, then branched:

  https://github.com/joe-lawrence/linux/tree/klp_kselftest_base
  https://github.com/joe-lawrence/linux/tree/klp_kselftest_v3

so that the kbuild test robot could verify:

  Subject: [joe-lawrence:klp_kselftest_v3] BUILD SUCCESS 73f12d67f681e3517a8cdc12ceec07b05543d269
  From: kbuild test robot <lkp at intel.com>
  To: Joe Lawrence <joe.lawrence at redhat.com>

  tree/branch: https://github.com/joe-lawrence/linux  klp_kselftest_v3
  branch HEAD: 73f12d67f681e3517a8cdc12ceec07b05543d269  selftests/livepatch: introduce tests

  elapsed time: 95m

  configs tested: 202

  [ ... snip ... ]

If anyone knows how to indicate an external git tree base to the bot in
the commit message or header letter, let me know.  Otherwise I'll have
to keep pushing up to github and ignoring its misfires as reported to
the list :(


changes from v2:

- fix module_exit(test_klp_shadow_vars_exit) in test_klp_shadow_vars.c
- silence kbuild test robot's "XXX can be static" and "Using plain
  integer as NULL pointer" complaints
- re-run tests with CONFIG_LOCKDEP=y and CONFIG_PROVE_LOCKING=y
- use GFP_ATOMIC in test_klp_shadow_vars.c constructor code

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
 lib/livepatch/test_klp_shadow_vars.c               | 236 ++++++++
 tools/testing/selftests/Makefile                   |   1 +
 tools/testing/selftests/livepatch/Makefile         |   8 +
 tools/testing/selftests/livepatch/README           |  43 ++
 tools/testing/selftests/livepatch/config           |   1 +
 tools/testing/selftests/livepatch/functions.sh     | 196 +++++++
 .../testing/selftests/livepatch/test-callbacks.sh  | 607 +++++++++++++++++++++
 .../testing/selftests/livepatch/test-livepatch.sh  | 173 ++++++
 .../selftests/livepatch/test-shadow-vars.sh        |  60 ++
 19 files changed, 1788 insertions(+), 487 deletions(-)
 create mode 100644 lib/livepatch/Makefile
 create mode 100644 lib/livepatch/test_klp_atomic_replace.c
 create mode 100644 lib/livepatch/test_klp_callbacks_busy.c
 create mode 100644 lib/livepatch/test_klp_callbacks_demo.c
 create mode 100644 lib/livepatch/test_klp_callbacks_demo2.c
 create mode 100644 lib/livepatch/test_klp_callbacks_mod.c
 create mode 100644 lib/livepatch/test_klp_livepatch.c
 create mode 100644 lib/livepatch/test_klp_shadow_vars.c
 create mode 100644 tools/testing/selftests/livepatch/Makefile
 create mode 100644 tools/testing/selftests/livepatch/README
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

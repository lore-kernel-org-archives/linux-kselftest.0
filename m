From: pvorel at suse.cz (Petr Vorel)
Date: Sat,  6 Apr 2019 23:49:13 +0200
Subject: [RFC PATCH 0/2] Kselftest shell (or even C) API
Message-ID: <20190406214915.16914-1-pvorel@suse.cz>

Hi,

this is a draft trying to define some API in order to remove some
redundancy from kselftest shell scripts. Existing kselftest.h already
defines some sort of API for C, there is none for shell.

It's just a small example how things could be. Draft, not meant to be
really merged. But instead of defining shell library (with more useful
helpers), I'd rather adopt LTP shell [1] and C [2] API to kselftest.
LTP API [1] is more like a framework, easy to use with a lot of helpers
making tests 1) small, concentrating on the problem itself 2) have
unique output. API is well documented [3] [4], it's creator Cyril Hrubis
made it after years experience of handling (at the time) quite bad
quality LTP code.  Rewriting LTP tests to use this API improved tests a
lot (less buggy, easier to read).

Some examples of advantages of LTP API:
* SAFE_*() macros for C, which handles errors inside a library
* unified messages, unified test status, unified way to exit testing due
missing functionality, at the end of testing there is summary of passed,
failed and skipped tests
* many prepared functionality for both C and shell
* handling threads, parent-child synchronization
* setup and cleanup functions
* "flags" for defining requirements or certain functionality (need root, temporary
directory, ...)
* and many other

kselftest and LTP has a bit different goals and approach. Probably
not all of LTP API is needed atm, but I guess it's at least worth of
thinking to adopt it.

There are of course other options: reinvent a wheel or left kselftest
code in a state it is now (code quality varies, some of the code is
really messy, buggy, not even compile).

[1] https://github.com/linux-test-project/ltp/blob/master/testcases/lib/tst_test.sh
[2] https://github.com/linux-test-project/ltp/tree/master/lib
[3] https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#22-writing-a-test-in-c
[4] https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#23-writing-a-testcase-in-shell

Petr Vorel (2):
  selftests: Start shell API
  selftest/kexec: Use kselftest shell API

 .../selftests/kexec/kexec_common_lib.sh       | 74 +++++--------------
 .../selftests/kexec/test_kexec_file_load.sh   | 53 ++++++-------
 .../selftests/kexec/test_kexec_load.sh        | 20 ++---
 tools/testing/selftests/kselftest.sh          | 53 +++++++++++++
 4 files changed, 105 insertions(+), 95 deletions(-)
 mode change 100755 => 100644 tools/testing/selftests/kexec/kexec_common_lib.sh
 create mode 100644 tools/testing/selftests/kselftest.sh

-- 
2.20.1

From: brendanhiggins at google.com (Brendan Higgins)
Date: Tue, 14 May 2019 15:16:53 -0700
Subject: [PATCH v4 00/18] kunit: introduce KUnit, the Linux kernel unit
 testing framework
Message-ID: <20190514221711.248228-1-brendanhiggins@google.com>

## TLDR

A quick follow up to yesterday's revision. I got some feedback that I
wanted to incorporate before anyone else read the update. For this
reason, I will leave a TLDR of the biggest changes since v2.

Biggest things to look out for (since v2):

- KUnit core now outputs results in TAP14.
- Heavily reworked tools/testing/kunit/kunit.py
  - Changed how parsing works.
  - Added testing.
  - Greg, Logan, you might want to re-review this.
- Added documentation on how to use KUnit on non-UML kernels. You can
  see the docs rendered here[1].

There is still some discussion going on on the [PATCH v2 00/17] thread,
but I wanted to get some of these updates out before they got too stale
(and too difficult for me to keep track of). I hope no one minds.

## Background

This patch set proposes KUnit, a lightweight unit testing and mocking
framework for the Linux kernel.

Unlike Autotest and kselftest, KUnit is a true unit testing framework;
it does not require installing the kernel on a test machine or in a VM
(however, KUnit still allows you to run tests on test machines or in VMs
if you want) and does not require tests to be written in userspace
running on a host kernel. Additionally, KUnit is fast: From invocation
to completion KUnit can run several dozen tests in under a second.
Currently, the entire KUnit test suite for KUnit runs in under a second
from the initial invocation (build time excluded).

KUnit is heavily inspired by JUnit, Python's unittest.mock, and
Googletest/Googlemock for C++. KUnit provides facilities for defining
unit test cases, grouping related test cases into test suites, providing
common infrastructure for running tests, mocking, spying, and much more.

## What's so special about unit testing?

A unit test is supposed to test a single unit of code in isolation,
hence the name. There should be no dependencies outside the control of
the test; this means no external dependencies, which makes tests orders
of magnitudes faster. Likewise, since there are no external dependencies,
there are no hoops to jump through to run the tests. Additionally, this
makes unit tests deterministic: a failing unit test always indicates a
problem. Finally, because unit tests necessarily have finer granularity,
they are able to test all code paths easily solving the classic problem
of difficulty in exercising error handling code.

## Is KUnit trying to replace other testing frameworks for the kernel?

No. Most existing tests for the Linux kernel are end-to-end tests, which
have their place. A well tested system has lots of unit tests, a
reasonable number of integration tests, and some end-to-end tests. KUnit
is just trying to address the unit test space which is currently not
being addressed.

## More information on KUnit

There is a bunch of documentation near the end of this patch set that
describes how to use KUnit and best practices for writing unit tests.
For convenience I am hosting the compiled docs here[2].

Additionally for convenience, I have applied these patches to a
branch[3].
The repo may be cloned with:
git clone https://kunit.googlesource.com/linux
This patchset is on the kunit/rfc/v5.1/v4 branch.

## Changes Since Last Version

As I mentioned above, there are a significant number of updates since
v2:
- Converted KUnit core to print test results in TAP14 format as
  suggested by Greg and Frank.
- Heavily reworked tools/testing/kunit/kunit.py
  - Changed how parsing works.
  - Added testing.
- Added documentation on how to use KUnit on non-UML kernels. You can
  see the docs rendered here[1].
- Added a new set of EXPECTs and ASSERTs for pointer comparison.
- Removed more function indirection as suggested by Logan.
- Added a new patch that adds `kunit_try_catch_throw` to objtool's
  noreturn list.
- Fixed a number of minorish issues pointed out by Shuah, Masahiro, and
  kbuild bot.

Nevertheless, there are only a couple of minor updates since v3:
- Added more context to the changelog on the objtool patch, as per
  Peter's request.
- Moved all KUnit documentation under the Documentation/dev-tools/
  directory as per Jonathan's suggestion.

[1] https://google.github.io/kunit-docs/third_party/kernel/docs/usage.html#kunit-on-non-uml-architectures
[2] https://google.github.io/kunit-docs/third_party/kernel/docs/
[3] https://kunit.googlesource.com/linux/+/kunit/rfc/v5.1/v4

-- 
2.21.0.1020.gf2820cf01a-goog

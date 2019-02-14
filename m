From: brendanhiggins at google.com (Brendan Higgins)
Date: Thu, 14 Feb 2019 13:37:12 -0800
Subject: [RFC v4 00/17] kunit: introduce KUnit,
 the Linux kernel unit testing framework
Message-ID: <20190214213729.21702-1-brendanhiggins@google.com>

This patch set proposes KUnit, a lightweight unit testing and mocking
framework for the Linux kernel.

Unlike Autotest and kselftest, KUnit is a true unit testing framework;
it does not require installing the kernel on a test machine or in a VM
and does not require tests to be written in userspace running on a host
kernel. Additionally, KUnit is fast: From invocation to completion KUnit
can run several dozen tests in under a second. Currently, the entire
KUnit test suite for KUnit runs in under a second from the initial
invocation (build time excluded).

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
For convenience I am hosting the compiled docs here:
https://google.github.io/kunit-docs/third_party/kernel/docs/
Additionally for convenience, I have applied these patches to a branch:
https://kunit.googlesource.com/linux/+/kunit/rfc/5.0-rc5/v4
The repo may be cloned with:
git clone https://kunit.googlesource.com/linux
This patchset is on the kunit/rfc/5.0-rc5/v4 branch.

## Changes Since Last Version

 - Got KUnit working on (hypothetically) all architectures (tested on
   x86), as per Rob's (and other's) request
 - Punting all KUnit features/patches depending on UML for now.
 - Broke out UML specific support into arch/um/* as per "[RFC v3 01/19]
   kunit: test: add KUnit test runner core", as requested by Luis.
 - Added support to kunit_tool to allow it to build kernels in external
   directories, as suggested by Kieran.
 - Added a UML defconfig, and a config fragment for KUnit as suggested
   by Kieran and Luis.
 - Cleaned up, and reformatted a bunch of stuff.

-- 
2.21.0.rc0.258.g878e2cd30e-goog

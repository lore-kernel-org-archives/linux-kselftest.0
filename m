From: brendanhiggins@google.com (Brendan Higgins)
Date: Tue, 23 Oct 2018 16:57:36 -0700
Subject: [RFC v2 00/14] kunit: introduce KUnit,
 the Linux kernel unit testing framework
Message-ID: <20181023235750.103146-1-brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181023235736.qiB4-rYFrmRA3eSD2LQ1xUNP_mIIGC3YlEr19fvIkAQ@z>

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

## Changes Since Last Version

 - Updated patchset to apply cleanly on 4.19.
 - Stripped down patchset to focus on just the core features (I dropped
   mocking, spying, and the MMIO stuff for now; you can find these
   patches here: https://kunit-review.googlesource.com/c/linux/+/1132),
   as suggested by Rob.
 - Cleaned up some of the commit messages and tweaked commit order a
   bit based on suggestions.

-- 
2.19.1.568.g152ad8e336-goog

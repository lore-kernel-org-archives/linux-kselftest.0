From: frowand.list@gmail.com (Frank Rowand)
Date: Tue, 4 Dec 2018 02:52:11 -0800
Subject: [RFC v3 00/19] kunit: introduce KUnit, the Linux kernel unit
 testing framework
In-Reply-To: <20181128193636.254378-1-brendanhiggins@google.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
Message-ID: <8807ac55-44e7-0ab7-176d-a0f71bff07e6@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181204105211.Q4wQM6g4bOmyZh7nQtQ01VkHQocjkuZ7ToNySUZF-_8@z>

On 11/28/18 11:36 AM, Brendan Higgins wrote:
> This patch set proposes KUnit, a lightweight unit testing and mocking
> framework for the Linux kernel.
> 
> Unlike Autotest and kselftest, KUnit is a true unit testing framework;
> it does not require installing the kernel on a test machine or in a VM
> and does not require tests to be written in userspace running on a host
> kernel. Additionally, KUnit is fast: From invocation to completion KUnit
> can run several dozen tests in under a second. Currently, the entire
> KUnit test suite for KUnit runs in under a second from the initial
> invocation (build time excluded).
> 
> KUnit is heavily inspired by JUnit, Python's unittest.mock, and
> Googletest/Googlemock for C++. KUnit provides facilities for defining
> unit test cases, grouping related test cases into test suites, providing
> common infrastructure for running tests, mocking, spying, and much more.
> 
> ## What's so special about unit testing?
> 


> A unit test is supposed to test a single unit of code in isolation,
> hence the name. There should be no dependencies outside the control of
> the test; this means no external dependencies, which makes tests orders
> of magnitudes faster. Likewise, since there are no external dependencies,
> there are no hoops to jump through to run the tests. Additionally, this

This question might be a misunderstanding of the intent of some of the
terminology in the above paragraph, so this is mostly a request for
clarification.

With my pre-conception of what unit tests are, I read "test a single unit
of code" to mean a relatively narrow piece of a subsystem.  So if I
understand correctly, taking examples from patch 17 "of: unittest:
migrate tests to run on KUnit", each function call like
KUNIT_ASSERT_NOT_ERR_OR_NULL(), KUNIT_EXPECT_STREQ_MSG(), and
KUNIT_EXPECT_EQ_MSG() are each a separate unit test, and thus the
paragraph says that each of these function calls should have no
dependencies outside the test.  Do I understand that correctly?

< snip >

-Frank

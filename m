From: robh@kernel.org (Rob Herring)
Date: Wed, 17 Oct 2018 15:43:45 -0500
Subject: [RFC v1 00/31] kunit: Introducing KUnit, the Linux kernel unit
 testing framework
In-Reply-To: <20181016235120.138227-1-brendanhiggins@google.com>
References: <20181016235120.138227-1-brendanhiggins@google.com>
Message-ID:
 <CABGGisyc_MnO-izpK5ANYV9HEcWCUM5XTiouZPvN8-mO977A6Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181017204345.zbIYbwJKim5r_jyq_DimBUskA74aIeUgJRwuS7XoQx0@z>

On Tue, Oct 16, 2018 at 6:53 PM Brendan Higgins
<brendanhiggins@google.com> wrote:
>
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

I very much like this. The DT code too has unit tests with our own,
simple infrastructure. They too can run under UML (and every other
arch).

Rob

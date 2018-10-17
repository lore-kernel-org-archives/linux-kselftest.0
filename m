From: Tim.Bird at sony.com (Tim.Bird at sony.com)
Date: Wed, 17 Oct 2018 17:49:24 +0000
Subject: [RFC v1 00/31] kunit: Introducing KUnit, the Linux kernel unit
 testing framework
In-Reply-To: <20181016235120.138227-1-brendanhiggins@google.com>
References: <20181016235120.138227-1-brendanhiggins@google.com>
Message-ID: <ECADFF3FD767C149AD96A924E7EA6EAF805242EE@USCULXMSG01.am.sony.com>

> -----Original Message-----
> From: Brendan Higgins
> 
> This patch set proposes KUnit, a lightweight unit testing and mocking
> framework for the Linux kernel.

I'm interested in this, and think the kernel might benefit from this,
but I have lots of questions.

> Unlike Autotest and kselftest, KUnit is a true unit testing framework;
> it does not require installing the kernel on a test machine or in a VM
> and does not require tests to be written in userspace running on a host
> kernel.


This is stated here and a few places in the documentation.  Just to clarify,
KUnit works by compiling the unit under test, along with the test code
itself, and then runs it on the machine where the compilation took
place?  Is this right?  How does cross-compiling enter into the equation?
If not what I described, then what exactly is happening?

Sorry - I haven't had time to look through the patches in detail.

Another issue is, what requirements does this place on the tested
code?  Is extra instrumentation required?  I didn't see any, but I
didn't look exhaustively at the code.

Are all unit tests stored separately from the unit-under-test, or are
they expected to be in the same directory?  Who is expected to
maintain the unit tests?  How often are they expected to change?
(Would it be every time the unit-under-test changed?)

Does the test code require the same level of expertise to write
and maintain as the unit-under-test code?  That is, could this be
a new opportunity for additional developers (especially relative
newcomers) to add value to the kernel by writing and maintaining
test code, or does this add to the already large burden of code
maintenance for our existing maintainers.

Thanks,
 -- Tim

...

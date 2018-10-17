From: brendanhiggins@google.com (Brendan Higgins)
Date: Wed, 17 Oct 2018 15:22:50 -0700
Subject: [RFC v1 00/31] kunit: Introducing KUnit, the Linux kernel unit
 testing framework
In-Reply-To: <ECADFF3FD767C149AD96A924E7EA6EAF805242EE@USCULXMSG01.am.sony.com>
References: <20181016235120.138227-1-brendanhiggins@google.com>
 <ECADFF3FD767C149AD96A924E7EA6EAF805242EE@USCULXMSG01.am.sony.com>
Message-ID:
 <CAFd5g46kWMFY_JXei=VqNS74wwm3TtzESK7ZsYeOFu26z4D8hw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181017222250.1Bxk9GiV7SpdgZumkGKuxjDmk4n_8qTeUH1gF3M6kZg@z>

On Wed, Oct 17, 2018@10:49 AM <Tim.Bird@sony.com> wrote:
>
> > -----Original Message-----
> > From: Brendan Higgins
> >
> > This patch set proposes KUnit, a lightweight unit testing and mocking
> > framework for the Linux kernel.
>
> I'm interested in this, and think the kernel might benefit from this,
> but I have lots of questions.
>
Awesome!

> > Unlike Autotest and kselftest, KUnit is a true unit testing framework;
> > it does not require installing the kernel on a test machine or in a VM
> > and does not require tests to be written in userspace running on a host
> > kernel.
>
>
> This is stated here and a few places in the documentation.  Just to clarify,
> KUnit works by compiling the unit under test, along with the test code
> itself, and then runs it on the machine where the compilation took
> place?  Is this right?  How does cross-compiling enter into the equation?
> If not what I described, then what exactly is happening?
>
Yep, that's exactly right!

The test and the code under test are linked together in the same
binary and are compiled under Kbuild. Right now I am linking
everything into a UML kernel, but I would ultimately like to make
tests compile into completely independent test binaries. So each test
file would get compiled into its own test binary and would link
against only the code needed to run the test, but we are a bit of a
ways off from that.

For now, tests compile as part of a UML kernel and a test script boots
the UML kernel, tests run as part of the boot process, and the script
extracts test results and reports them.

I intentionally made it so the KUnit test libraries could be
relatively easily ported to other architectures, but in the long term,
tests that depend on being built into a real kernel that boots on real
hardware would be a lot more difficult to maintain and we would never
be able to provide the kind of resources and infrastructure as we
could for tests that run as normal user space binaries.

Does that answer your question?

> Sorry - I haven't had time to look through the patches in detail.
>
> Another issue is, what requirements does this place on the tested
> code?  Is extra instrumentation required?  I didn't see any, but I
> didn't look exhaustively at the code.
>
Nope, no special instrumentation. As long as the code under tests can
be compiled under COMPILE_TEST for the host architecture, you should
be able to use KUnit.

> Are all unit tests stored separately from the unit-under-test, or are
> they expected to be in the same directory?  Who is expected to
> maintain the unit tests?  How often are they expected to change?
> (Would it be every time the unit-under-test changed?)
>
Tests are in the same directory as the code under test. For example,
if I have a driver drivers/i2c/busses/i2c-aspeed.c, I would write a
test drivers/i2c/busses/i2c-aspeed-test.c (that's my opinion anyway).

Unit tests should be the responsibility of the person who is
responsible for the code. So one way to do this would be that unit
tests should be the responsibility of the maintainer who would in turn
require that new tests are written for any new code added, and that
all tests should pass for every patch sent for review.

A well written unit test tests public interfaces (by public I just
mean functions exported outside of a .c file, so non-static functions
and functions which are shared as a member of a struct) so a unit test
should change at a slower rate than the code under test, but you would
likely have to change the test anytime the public interface changes
(intended behavior changes, function signature changes, new public
feature added, etc). More succinctly, if the contract that your code
provide changes your test should probably change, if the contract
doesn't change, your test probably shouldn't change. Does that make
sense?

> Does the test code require the same level of expertise to write
> and maintain as the unit-under-test code?  That is, could this be
> a new opportunity for additional developers (especially relative
> newcomers) to add value to the kernel by writing and maintaining
> test code, or does this add to the already large burden of code
> maintenance for our existing maintainers.

So a couple things, in order to write a unit test, the person who
writes the test must understand what the code they are testing is
supposed to do. To some extent that will probably require someone with
some expertise to ensure that the test makes sense, and indeed a
change that breaks a test should be accompanied by a update to the
test.

On the other hand, I think understanding what pre-existing code does
and is supposed to do is much easier than writing new code from
scratch, and probably doesn't require too much expertise. I actually
did a bit of an experiment internally on this: I had some people with
no prior knowledge of the kernel write some tests for existing kernel
code and they were able to do it with only minimal guidance. I was so
happy with the result that I was already thinking that it might have
some potential for onboarding newcomers.

Now, how much burden does this add to maintainers? As someone who
pretty regularly reviews code that come in with unit tests and code
that comes in without unit tests. I find it much easier to review code
that comes in with unit tests. I would actually say that from the
standpoint of being an owner of a code base, unit tests actually
reduce the amount of work I have to do overall. Code with unit tests
is usually cleaner, the tests tell me exactly what the code is
supposed to do, and I can run the tests (or ideally have an automated
service run the tests) that tell me that the code actually does what
the tests say it should. Even when it comes to writing code I find
that writing code with unit tests ends up saving me time overall.

From: tytso at mit.edu (Theodore Ts'o)
Date: Wed, 15 May 2019 00:28:38 -0400
Subject: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
In-Reply-To: <a305c732-9953-8724-b4a4-25aa50c89365@gmail.com>
References: <580e092f-fa4e-eedc-9e9a-a57dd085f0a6@gmail.com>
 <20190509032017.GA29703@mit.edu>
 <7fd35df81c06f6eb319223a22e7b93f29926edb9.camel@oracle.com>
 <20190509133551.GD29703@mit.edu>
 <ECADFF3FD767C149AD96A924E7EA6EAF9770D591@USCULXMSG01.am.sony.com>
 <875c546d-9713-bb59-47e4-77a1d2c69a6d@gmail.com>
 <20190509214233.GA20877@mit.edu>
 <80c72e64-2665-bd51-f78c-97f50f9a53ba@gmail.com>
 <20190511173344.GA8507@mit.edu>
 <a305c732-9953-8724-b4a4-25aa50c89365@gmail.com>
Message-ID: <20190515042838.GA26954@mit.edu>

On Tue, May 14, 2019 at 05:26:47PM -0700, Frank Rowand wrote:
> On 5/11/19 10:33 AM, Theodore Ts'o wrote:
> > On Fri, May 10, 2019 at 02:12:40PM -0700, Frank Rowand wrote:
> >> However, the reply is incorrect.  Kselftest in-kernel tests (which
> >> is the context here) can be configured as built in instead of as
> >> a module, and built in a UML kernel.  The UML kernel can boot,
> >> running the in-kernel tests before UML attempts to invoke the
> >> init process.
> > 
> > Um, Citation needed?
> 
> The paragraph that you quoted tells you exactly how to run a kselftest
> in-kernel test in a UML kernel.  Just to what that paragraph says.

I didn't quote a paragraph.  But I'll quote from it now:

  $ make -C tools/testing/selftests run_tests

This runs the kselftest harness, *in userspace*.  That means you have
to have a root file system, and it's run after init has started, by
default.  You asserted that kselftests allows you to run modules
before init has started.  There is absolutely zero, cero, nada, zilch
mentions of any of anything like that in Documentation/dev-tools/kselftests.rst

> > There exists test modules in the kernel that run before the init
> > scripts run --- but that's not strictly speaking part of kselftests,
> > and do not have any kind of infrastructure.  As noted, the
> > kselftests_harness header file fundamentally assumes that you are
> > running test code in userspace.
> 
> You are ignoring the kselftest in-kernel tests.

I'm talking specifically about what you have been *claiming* to be
kselftest in-kernel tests above.  And I'm asserting they are really
not kselftests.  They are just ad hoc tests that are run in kernel
space, which, when compiled as modules, can be loaded by a kselftest
shell script.  You can certainly hook in these ad hoc in-kernel tests
via kselftests --- but then they aren't run before init starts,
because kselftests is inherently a userspace-driven system.

If you build these tests (many of which existed before kselftests was
merged) into the kernel such that they are run before init starts,
without the kselftest harness, then they are not kselftests, by
definition.  Both in how they are run, and since many of these
in-kernel tests predate the introduction of kselftests --- in some
cases, by many years.

> We are talking in circles.  I'm done with this thread.

Yes, that sounds like it would be best.

						- Ted

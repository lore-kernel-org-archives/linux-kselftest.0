From: tytso@mit.edu (Theodore Ts'o)
Date: Wed, 8 May 2019 21:58:56 -0400
Subject: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
In-Reply-To: <a09a7e0e-9894-8c1a-34eb-fc482b1759d0@gmail.com>
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <54940124-50df-16ec-1a32-ad794ee05da7@gmail.com>
 <20190507080119.GB28121@kroah.com>
 <a09a7e0e-9894-8c1a-34eb-fc482b1759d0@gmail.com>
Message-ID: <20190509015856.GB7031@mit.edu>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190509015856.JzXmaUwngH0u4JnQzCiegnjPQL2wWn-RZSdAOdM9sJA@z>

On Wed, May 08, 2019@05:43:35PM -0700, Frank Rowand wrote:
> kselftest provides a mechanism for in-kernel tests via modules.  For
> example, see:
> 
>   tools/testing/selftests/vm/run_vmtests invokes:
>     tools/testing/selftests/vm/test_vmalloc.sh
>       loads module:
>         test_vmalloc
>         (which is built from lib/test_vmalloc.c if CONFIG_TEST_VMALLOC)

The majority of the kselftests are implemented as userspace programs.

You *can* run in-kernel test using modules; but there is no framework
for the in-kernel code found in the test modules, which means each of
the in-kernel code has to create their own in-kernel test
infrastructure.  

That's much like saying you can use vice grips to turn a nut or
bolt-head.  You *can*, but it might be that using a monkey wrench
would be a much better tool that is much easier.

What would you say to a wood worker objecting that a toolbox should
contain a monkey wrench because he already knows how to use vise
grips, and his tiny brain shouldn't be forced to learn how to use a
wrench when he knows how to use a vise grip, which is a perfectly good
tool?

If you want to use vice grips as a hammer, screwdriver, monkey wrench,
etc.  there's nothing stopping you from doing that.  But it's not fair
to object to other people who might want to use better tools.

The reality is that we have a lot of testing tools.  It's not just
kselftests.  There is xfstests for file system code, blktests for
block layer tests, etc.   We use the right tool for the right job.

						- Ted

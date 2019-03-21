From: brendanhiggins at google.com (Brendan Higgins)
Date: Thu, 21 Mar 2019 09:55:12 -0700
Subject: [RFC v4 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
In-Reply-To: <ce355f5c-189c-816c-cde4-fb4e816d44e7@deltatee.com>
References: <20190214213729.21702-1-brendanhiggins@google.com>
 <6d9b3b21-1179-3a45-7545-30aa15306cb4@deltatee.com>
 <01b2a950f661e8ebd6acbc45c2f89c8f10063daf.camel@oracle.com>
 <ce355f5c-189c-816c-cde4-fb4e816d44e7@deltatee.com>
Message-ID: <CAFd5g45LKU+SZAFzn3RNCoxhzum0NAr9t+UJ80SJDMc_FeKgBQ@mail.gmail.com>

On Thu, Mar 21, 2019 at 8:56 AM Logan Gunthorpe <logang at deltatee.com> wrote:
>
>
>
> On 2019-03-20 11:23 p.m., Knut Omang wrote:
> > Testing drivers, hardware and firmware within production kernels was the use
> > case that inspired KTF (Kernel Test Framework). Currently KTF is available as a
> > standalone git repository. That's been the most efficient form for us so far,
> > as we typically want tests to be developed once but deployed on many different
> > kernel versions simultaneously, as part of continuous integration.
>
> Interesting. It seems like it's really in direct competition with KUnit.

I won't speak for Knut, but I don't think we are in competition. I see
KTF as a novel way to do a kind of white box end-to-end testing for
the Linux kernel, which is a valuable thing, especially in some
circumstances. I could see KTF having a lot of value for someone who
wants to maintain out of tree drivers, in particular.

Nevertheless, I don't really see KTF as a real unit testing framework
for a number of different reasons; you pointed out some below, but I
think the main one being that it requires booting a real kernel on
actual hardware; I imagine it could be made to work on a VM, but that
isn't really the point; it fundamentally depends on having part of the
test, or at least driving the test from userspace on top of the kernel
under test. Knut, myself, and others, had a previous discussion to
this effect here: https://lkml.org/lkml/2018/11/24/170

> I didn't really go into it in too much detail but these are my thoughts:
>
> From a developer perspective I think KTF not being in the kernel tree is
> a huge negative. I want minimal effort to include my tests in a patch
> series and minimal effort for other developers to be able to use them.
> Needing to submit these tests to another project or use another project
> to run them is too much friction.
>
> Also I think the goal of having tests that run on any kernel version is
> a pipe dream. You'd absolutely need a way to encode which kernel
> versions a test is expected to pass on because the tests might not make
> sense until a feature is finished in upstream. And this makes it even
> harder to develop these tests because, when we write them, we might not
> even know which kernel version the feature will be added to. Similarly,
> if a feature is removed or substantially changed, someone will have to
> do a patch to disable the test for subsequent kernel versions and create
> a new test for changed features. So, IMO, tests absolutely have to be
> part of the kernel tree so they can be changed with the respective
> features they test.
>
> Kunit's ability to run without having to build and run the entire kernel
>  is also a huge plus. (Assuming there's a way to get around the build
> dependency issues). Because of this, it can be very quick to run these
> tests which makes development a *lot* easier seeing you don't have to
> reboot a machine every time you want to test a fix.

I will reply to your comments directly on your original email. I don't
want to hijack this thread, in case we want to discuss the topic of
KUnit vs. KTF further.

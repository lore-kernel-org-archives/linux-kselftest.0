From: mcgrof@kernel.org (Luis Chamberlain)
Date: Thu, 29 Nov 2018 16:59:42 -0800
Subject: [RFC v2 00/14] kunit: introduce KUnit, the Linux kernel unit
 testing framework
In-Reply-To: <abf3aff0-dfb3-717e-f14f-02dbe5574f49@kernel.org>
References: <20181023235750.103146-1-brendanhiggins@google.com>
 <1543036529.4680.655.camel@oracle.com>
 <CAFd5g45oPSp870hJLDSHiMfU7Mh-EvpYcFdAaOQxecXNde5PSw@mail.gmail.com>
 <1543434888.4680.862.camel@oracle.com>
 <abf3aff0-dfb3-717e-f14f-02dbe5574f49@kernel.org>
Message-ID: <20181130005942.GL4922@garbanzo.do-not-panic.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181130005942.SP6VNhwx5mjGp30PbcTdi0ZCXoFKaMho2VYZJU_9iiY@z>

On Wed, Nov 28, 2018@01:50:01PM -0700, shuah wrote:
> On 11/28/18 12:54 PM, Knut Omang wrote:
> > On Mon, 2018-11-26@17:41 -0800, Brendan Higgins wrote:
> > Both approaches provide assertion macros for running tests inside the kernel,
> > I doubt the kernel community would like to see yet two such sets of macros,
> > with differing syntax merged. One of the good reasons to have a *framework*
> > is that it is widely used and understood, so that people coming from one part of the
> > kernel can easily run, understand and relate to selected tests from another part.
> > 
> > The goal with KTF is to allow this for any kernel, old or new, not just kernels
> > built specifically for testing purposes. We felt that providing it as a separate git
> > module (still open source, for anyone to contribute to) is a more efficient approach
> > until we have more examples and experience with using it in different parts
> > of the kernel. We can definitely post the kernel side of KTF as a patch series fairly soon
> > if the community wants us to. Except for hybrid tests, the ktf.ko module works fine
> > independently of any user side support, just using the debugfs interface to run and
> > examine tests.
> > 
> 
> Having test framework in the kernel sources tree has benefits. It allows
> us (kernel developers) to do co-development of kernel features and tests
> for these features.

Agreed!

> It encourages developers to write regression tests. More importantly,
> kernel features and tests for these features are included in the same
> release in most cases and/or allows us freedom to do so if test framework
> and tests are part of the kernel sources.
> 
> We have seen this with our experience with kselftest. It would not have
> see the same level of attention and growth if it stayed outside the
> kernel sources.
> 
> Most kernel developers would not want to include a externally maintained
> module for testing. As a general rule, it has to be easy to run tests.
> 
> > I think there are good uses cases for having the ability to maintain a
> > single source for tests that can be run against multiple kernels,
> > also distro kernels that the test framework cannot expect to be able to modify,
> > except from using the module interfaces.
> 
> Same reasons as above. Having the tests included in the kernel sources
> makes it easier for distros to run those tests and include running them
> during their qualification.

Also... selftests are an example of tests which *are* upstream and yet
there are teams out there using them to test these tests on older
kernels. So the scripts for instance are supposed to work with older
kernels. So if you expand on a feature your selftest script should
detect if the new mechanism is present or not, and also be backward
compatible with older kernels.

> > And there are good arguments for having (at least parts of)
> > the test framework easily available within the kernel under test.
> > 
> 
> When Kernel unit, functional, and regressions tests reside in the kernel
> sources, they evolve quicker as kernel developers contribute tests as
> part of their kernel work-flow. Maintaining tests and framework
> separately will make it harder to maintain them and keep them updated
> for us the kernel community.

Agreed!

Also, I actually see no issue with having *both* kunit / ktest merged
upstream. IMHO we should not be forcing people to pick one or the other
but rather we should: let the best test framework win. Similar as we
did with LSMs. Each test framework has its own gains / advantages.

  Luis

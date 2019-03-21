From: knut.omang@oracle.com (Knut Omang)
Date: Thu, 21 Mar 2019 06:23:59 +0100
Subject: [RFC v4 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
In-Reply-To: <6d9b3b21-1179-3a45-7545-30aa15306cb4@deltatee.com>
References: <20190214213729.21702-1-brendanhiggins@google.com>
 <6d9b3b21-1179-3a45-7545-30aa15306cb4@deltatee.com>
Message-ID: <01b2a950f661e8ebd6acbc45c2f89c8f10063daf.camel@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190321052359.lqa085gV_9l9nu_xX0nV19wBHOtEgEzgTYN5bqhGjko@z>

Hi Logan,

On Wed, 2019-03-20@19:07 -0600, Logan Gunthorpe wrote:
> Hi,
> 
> On 2019-02-14 2:37 p.m., Brendan Higgins wrote:
> > This patch set proposes KUnit, a lightweight unit testing and mocking
> > framework for the Linux kernel.
> 
> I haven't followed the entire conversation but I saw the KUnit write-up
> on LWN and ended up, as an exercise, giving it a try.
> 
> I really like the idea of having a fast unit testing infrastructure in
> the kernel. Occasionally, I write userspace tests for tricky functions
> that I essentially write by copying the code over to a throw away C file
> and exercise them as I need. I think it would be great to be able to
> keep these tests around in a way that they can be run by anyone who
> wants to touch the code.
> 
> I was just dealing with some functions that required some mocked up
> tests so I thought I'd give KUnit a try. I found writing the code very
> easy and the infrastructure I was testing was quite simple to mock out
> the hardware.
> 
> However, I got a bit hung up by one issue: I was writing unit tests for
> code in the NTB tree which itself depends on CONFIG_PCI which cannot be
> enabled in UML (for what should be obvious reasons). I managed to work
> around this because, as luck would have it, all the functions I cared
> about testing were actually static inline functions in headers. So I
> placed my test code in the kunit folder (so it would compile) and hacked
> around a couple a of functions I didn't care about that would not be
> compiled.
> 
> In the end I got it to work acceptably, but I get the impression that
> KUnit will not be usable for wide swaths of kernel code that can't be
> compiled in UML. Has there been any discussion or ideas on how to work
> around this so it can be more generally useful? Or will this feature be
> restricted roughly to non-drivers and functions in headers that don't
> have #ifdefs around them?

Testing drivers, hardware and firmware within production kernels was the use
case that inspired KTF (Kernel Test Framework). Currently KTF is available as a
standalone git repository. That's been the most efficient form for us so far, 
as we typically want tests to be developed once but deployed on many different
kernel versions simultaneously, as part of continuous integration.

But we're also working towards a suitable proposal for how it can be 
smoothly integrated into the kernel, but while still keeping the benefits 
and tools to allow cross-kernel development of tests. As part of this,
I have a master student who has been looking at converting some of 
the existing kernel test suites to KTF, and we have more examples coming 
from our internal usage, as we get more mileage and more users.
See for instance this recent blog entry testing skbuff as an example,
on the Oracle kernel development blog:

https://blogs.oracle.com/linux/writing-kernel-tests-with-the-new-kernel-test-framework-ktf

Other relevant links:

Git repo: https://github.com/oracle/ktf
Formatted docs: http://heim.ifi.uio.no/~knuto/ktf/
LWN mention from my presentation at LPC'17: https://lwn.net/Articles/735034/
Earlier Oracle blog post: https://blogs.oracle.com/linux/oracles-new-kernel-test-framework-for-linux-v2
OSS'18 presentation slides: https://events.linuxfoundation.org/wp-content/uploads/2017/12/Test-Driven-Kernel-Development-Knut-Omang-Oracle.pdf

> If you're interested in seeing the unit tests I ended up writing you can
> find the commits here[1].

It would certainly be interesting to see how the use cases you struggled with
would work with KTF ;-)

Thanks,
Knut

>
> Thanks,
> 
> Logan
> 
> [1] https://github.com/sbates130272/linux-p2pmem/ ntb_kunit

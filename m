From: logang at deltatee.com (Logan Gunthorpe)
Date: Wed, 20 Mar 2019 19:07:34 -0600
Subject: [RFC v4 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
In-Reply-To: <20190214213729.21702-1-brendanhiggins@google.com>
References: <20190214213729.21702-1-brendanhiggins@google.com>
Message-ID: <6d9b3b21-1179-3a45-7545-30aa15306cb4@deltatee.com>

Hi,

On 2019-02-14 2:37 p.m., Brendan Higgins wrote:
> This patch set proposes KUnit, a lightweight unit testing and mocking
> framework for the Linux kernel.

I haven't followed the entire conversation but I saw the KUnit write-up
on LWN and ended up, as an exercise, giving it a try.

I really like the idea of having a fast unit testing infrastructure in
the kernel. Occasionally, I write userspace tests for tricky functions
that I essentially write by copying the code over to a throw away C file
and exercise them as I need. I think it would be great to be able to
keep these tests around in a way that they can be run by anyone who
wants to touch the code.

I was just dealing with some functions that required some mocked up
tests so I thought I'd give KUnit a try. I found writing the code very
easy and the infrastructure I was testing was quite simple to mock out
the hardware.

However, I got a bit hung up by one issue: I was writing unit tests for
code in the NTB tree which itself depends on CONFIG_PCI which cannot be
enabled in UML (for what should be obvious reasons). I managed to work
around this because, as luck would have it, all the functions I cared
about testing were actually static inline functions in headers. So I
placed my test code in the kunit folder (so it would compile) and hacked
around a couple a of functions I didn't care about that would not be
compiled.

In the end I got it to work acceptably, but I get the impression that
KUnit will not be usable for wide swaths of kernel code that can't be
compiled in UML. Has there been any discussion or ideas on how to work
around this so it can be more generally useful? Or will this feature be
restricted roughly to non-drivers and functions in headers that don't
have #ifdefs around them?

If you're interested in seeing the unit tests I ended up writing you can
find the commits here[1].

Thanks,

Logan

[1] https://github.com/sbates130272/linux-p2pmem/ ntb_kunit

From: logang at deltatee.com (Logan Gunthorpe)
Date: Thu, 21 Mar 2019 13:29:38 -0600
Subject: [RFC v4 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
In-Reply-To: <73b62e929f631038a9d8d21d261aa22ac3c18949.camel@oracle.com>
References: <20190214213729.21702-1-brendanhiggins@google.com>
 <6d9b3b21-1179-3a45-7545-30aa15306cb4@deltatee.com>
 <01b2a950f661e8ebd6acbc45c2f89c8f10063daf.camel@oracle.com>
 <ce355f5c-189c-816c-cde4-fb4e816d44e7@deltatee.com>
 <CAFd5g45LKU+SZAFzn3RNCoxhzum0NAr9t+UJ80SJDMc_FeKgBQ@mail.gmail.com>
 <73b62e929f631038a9d8d21d261aa22ac3c18949.camel@oracle.com>
Message-ID: <961494a3-d08c-2720-c59d-7d7008edb288@deltatee.com>



On 2019-03-21 1:13 p.m., Knut Omang wrote:
>> Nevertheless, I don't really see KTF as a real unit testing framework
>> for a number of different reasons; you pointed out some below, but I
>> think the main one being that it requires booting a real kernel on
>> actual hardware; 
> 
> That depends on what you want to test. If you need hardware (or simulated or
> emulated hardware) for the test, of course you would need to have that hardware,
> but if, lets say, you just wanted to run tests like the skbuff example tests
> (see link above) you wouldn't need anything more than what you need to run KUnit
> tests.

I'm starting to get the same impression: KTF isn't unit testing. When we
are saying "unit tests" we are specifying exactly what we want to test:
small sections of code in isolation. So by definition you should not
need hardware for this.

> I have fulfilled that dream, so I know it is possible (Inifinband driver,
> kernels from 2.6.39 to 4.8.x or so..) I know a lot of projects would benefit
> from support for such workflows, but that's not really the point here - we want
> to achieve both goals!

This is what makes me think we are not talking about testing the same
things. We are not talking about end to end testing of entire drivers
but smaller sections of code. A unit test is far more granular and
despite an infinband driver existing for 2.6.39 through 4.8, the
internal implementation could be drastically different. But unit tests
would be testing internal details which could be very different version
to version and has to evolve with the implementation.

> If your target component under test can be built as a kernel module, or set of
> modules, with KTF your workflow would not involve booting at all (unless you
> happened to crash the system with one of your tests, that is :) )

> You would just unload your module under test and the test module, recompile the
> two and insmod again. My work current work cycle on this is just a few seconds.

Yes, I'm sure we've all done that many a time but it's really beside the
point. Kunit offers a much nicer method for running a lot of unit tests
on existing code.

Logan

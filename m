From: frowand.list at gmail.com (Frank Rowand)
Date: Thu, 9 May 2019 22:11:01 -0700
Subject: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
In-Reply-To: <580e092f-fa4e-eedc-9e9a-a57dd085f0a6@gmail.com>
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <54940124-50df-16ec-1a32-ad794ee05da7@gmail.com>
 <20190507080119.GB28121@kroah.com>
 <a09a7e0e-9894-8c1a-34eb-fc482b1759d0@gmail.com>
 <20190509015856.GB7031@mit.edu>
 <580e092f-fa4e-eedc-9e9a-a57dd085f0a6@gmail.com>
Message-ID: <78e4d46e-6212-9871-51d6-dd2126f39d45@gmail.com>

Hi Ted,

I'll try answering this again.

The first time I was a little flippant in part of my answer because I
thought your comments somewhat flippant.  This time I'll provide a
more complete answer.


On 5/8/19 7:13 PM, Frank Rowand wrote:
> On 5/8/19 6:58 PM, Theodore Ts'o wrote:
>> On Wed, May 08, 2019 at 05:43:35PM -0700, Frank Rowand wrote:

*****  begin context from Greg KH that you snipped  *****

On 5/7/19 1:01 AM, Greg KH wrote:

<< note that I have snipped my original question above this point >>

>
> kselftest provides no in-kernel framework for testing kernel code
> specifically.  That should be what kunit provides, an "easy" way to
> write in-kernel tests for things.

*****  end   context from Greg KH that you snipped  *****

>>> kselftest provides a mechanism for in-kernel tests via modules.  For
>>> example, see:
>>>
>>>   tools/testing/selftests/vm/run_vmtests invokes:
>>>     tools/testing/selftests/vm/test_vmalloc.sh
>>>       loads module:
>>>         test_vmalloc
>>>         (which is built from lib/test_vmalloc.c if CONFIG_TEST_VMALLOC)
>>
>> The majority of the kselftests are implemented as userspace programs.

My flippant answer:

> Non-argument.

This time:

My reply to Greg was pointing out that in-kernel tests do exist in
kselftest.

Your comment that the majority of kselftests are implemented as userspace
programs has no bearing on whether kselftest support in-kernel tests.
It does not counter the fact the kselftest supports in-kernel tests.


>> You *can* run in-kernel test using modules; but there is no framework
>> for the in-kernel code found in the test modules, which means each of
>> the in-kernel code has to create their own in-kernel test
>> infrastructure.

The kselftest in-kernel tests follow a common pattern.  As such, there
is a framework.

This next two paragraphs you ignored entirely in your reply:

> Why create an entire new subsystem (KUnit) when you can add a header
> file (and .c code as appropriate) that outputs the proper TAP formatted
> results from kselftest kernel test modules?
> 
> There are already a multitude of in kernel test modules used by
> kselftest.  It would be good if they all used a common TAP compliant
> mechanism to report results.


 
>> That's much like saying you can use vice grips to turn a nut or
>> bolt-head.  You *can*, but it might be that using a monkey wrench
>> would be a much better tool that is much easier.
>>
>> What would you say to a wood worker objecting that a toolbox should
>> contain a monkey wrench because he already knows how to use vise
>> grips, and his tiny brain shouldn't be forced to learn how to use a
>> wrench when he knows how to use a vise grip, which is a perfectly good
>> tool?
>>
>> If you want to use vice grips as a hammer, screwdriver, monkey wrench,
>> etc.  there's nothing stopping you from doing that.  But it's not fair
>> to object to other people who might want to use better tools.
>>
>> The reality is that we have a lot of testing tools.  It's not just
>> kselftests.  There is xfstests for file system code, blktests for
>> block layer tests, etc.   We use the right tool for the right job.

My flippant answer:

> More specious arguments.

This time:

I took your answer as a straw man, and had no desire to spend time
countering a straw man.

I am not proposing using a vice grips (to use your analogy).  I
am saying that maybe the monkey wrench already exists.

My point of this whole thread has been to try to get the submitter
to provide a better, more complete explanation of how and why KUnit 
is a better tool.

I have not yet objected to the number (and differences among) the
many sub-system tests.  I am questioning whether there is a need
for another _test framework_ for in-kernel testing.  If there is
something important that KUnit provides that does not exist in
existing frameworks then the next question would be to ask how
to implement that important thing (improve the existing
framework, replace the existing framework, or have two
frameworks).  I still think it is premature to ask this
question until we first know the answer to what unique features
KUnit adds (and apparently until we know what the existing
framework provides).

-Frank

> 
> -Frank
> 
>>
>> 						- Ted
>>
> 
> 

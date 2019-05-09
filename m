From: frowand.list at gmail.com (Frank Rowand)
Date: Wed, 8 May 2019 18:01:00 -0700
Subject: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
In-Reply-To: <1b1efa91-0523-21a9-e541-fdc3612bd117@kernel.org>
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <54940124-50df-16ec-1a32-ad794ee05da7@gmail.com>
 <20190507080119.GB28121@kroah.com>
 <1b1efa91-0523-21a9-e541-fdc3612bd117@kernel.org>
Message-ID: <911e44bb-9bb1-e603-a260-fac63760fff6@gmail.com>

On 5/7/19 8:23 AM, shuah wrote:
> On 5/7/19 2:01 AM, Greg KH wrote:
>> On Mon, May 06, 2019 at 08:14:12PM -0700, Frank Rowand wrote:
>>> On 5/1/19 4:01 PM, Brendan Higgins wrote:
>>>> ## TLDR
>>>>
>>>> I rebased the last patchset on 5.1-rc7 in hopes that we can get this in
>>>> 5.2.
>>>>
>>>> Shuah, I think you, Greg KH, and myself talked off thread, and we agreed
>>>> we would merge through your tree when the time came? Am I remembering
>>>> correctly?
>>>>
>>>> ## Background
>>>>
>>>> This patch set proposes KUnit, a lightweight unit testing and mocking
>>>> framework for the Linux kernel.
>>>>
>>>> Unlike Autotest and kselftest, KUnit is a true unit testing framework;
>>>> it does not require installing the kernel on a test machine or in a VM
>>>> and does not require tests to be written in userspace running on a host
>>>> kernel. Additionally, KUnit is fast: From invocation to completion KUnit
>>>> can run several dozen tests in under a second. Currently, the entire
>>>> KUnit test suite for KUnit runs in under a second from the initial
>>>> invocation (build time excluded).
>>>>
>>>> KUnit is heavily inspired by JUnit, Python's unittest.mock, and
>>>> Googletest/Googlemock for C++. KUnit provides facilities for defining
>>>> unit test cases, grouping related test cases into test suites, providing
>>>> common infrastructure for running tests, mocking, spying, and much more.
>>>
>>> As a result of the emails replying to this patch thread, I am now
>>> starting to look at kselftest.  My level of understanding is based
>>> on some slide presentations, an LWN article, https://kselftest.wiki.kernel.org/
>>> and a _tiny_ bit of looking at kselftest code.
>>>
>>> tl;dr; I don't really understand kselftest yet.
>>>
>>>
>>> (1) why KUnit exists
>>>
>>>> ## What's so special about unit testing?
>>>>
>>>> A unit test is supposed to test a single unit of code in isolation,
>>>> hence the name. There should be no dependencies outside the control of
>>>> the test; this means no external dependencies, which makes tests orders
>>>> of magnitudes faster. Likewise, since there are no external dependencies,
>>>> there are no hoops to jump through to run the tests. Additionally, this
>>>> makes unit tests deterministic: a failing unit test always indicates a
>>>> problem. Finally, because unit tests necessarily have finer granularity,
>>>> they are able to test all code paths easily solving the classic problem
>>>> of difficulty in exercising error handling code.
>>>
>>> (2) KUnit is not meant to replace kselftest
>>>
>>>> ## Is KUnit trying to replace other testing frameworks for the kernel?
>>>>
>>>> No. Most existing tests for the Linux kernel are end-to-end tests, which
>>>> have their place. A well tested system has lots of unit tests, a
>>>> reasonable number of integration tests, and some end-to-end tests. KUnit
>>>> is just trying to address the unit test space which is currently not
>>>> being addressed.
>>>
>>> My understanding is that the intent of KUnit is to avoid booting a kernel on
>>> real hardware or in a virtual machine.  That seems to be a matter of semantics
>>> to me because isn't invoking a UML Linux just running the Linux kernel in
>>> a different form of virtualization?
>>>
>>> So I do not understand why KUnit is an improvement over kselftest.
> 
> They are in two different categories. Kselftest falls into black box
> regression test suite which is a collection of user-space tests with a
> few kernel test modules back-ending the tests in some cases.
> 
> Kselftest can be used by both kernel developers and users and provides
> a good way to regression test releases in test rings.
> 
> KUnit is a white box category and is a better fit as unit test framework
> for development and provides a in-kernel testing. I wouldn't view them
> one replacing the other. They just provide coverage for different areas
> of testing.

I don't see what about kselftest or KUnit is inherently black box or
white box.  I would expect both frameworks to be used for either type
of testing.


> I wouldn't view KUnit as something that would be easily run in test rings for example.

I don't see why not.

-Frank

> 
> Brendan, does that sound about right?
> 
>>>
>>> It seems to me that KUnit is just another piece of infrastructure that I
>>> am going to have to be familiar with as a kernel developer.  More overhead,
>>> more information to stuff into my tiny little brain.
>>>
>>> I would guess that some developers will focus on just one of the two test
>>> environments (and some will focus on both), splitting the development
>>> resources instead of pooling them on a common infrastructure.
> 
>>> What am I missing?
>>
>> kselftest provides no in-kernel framework for testing kernel code
>> specifically.  That should be what kunit provides, an "easy" way to
>> write in-kernel tests for things.
>>
>> Brendan, did I get it right?
> thanks,
> -- Shuah
> .
> 

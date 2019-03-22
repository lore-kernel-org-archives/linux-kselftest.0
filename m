From: frowand.list@gmail.com (Frank Rowand)
Date: Thu, 21 Mar 2019 17:27:54 -0700
Subject: [RFC v3 00/19] kunit: introduce KUnit, the Linux kernel unit
 testing framework
In-Reply-To: <CAFd5g47cDKSdXGAL8pbDxEU2O8A-9Ajq1wCM+PtPF40T4wYKow@mail.gmail.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <f34ee937-83d6-3ff6-12b3-c6cd9acbfc38@gmail.com>
 <CAL_JsqL0t_p8=Ueq4mHS5i2YEQdc7S7AtPWfkcOsj1g2SixUkA@mail.gmail.com>
 <CAFd5g47cDKSdXGAL8pbDxEU2O8A-9Ajq1wCM+PtPF40T4wYKow@mail.gmail.com>
Message-ID: <ec4c1020-4b53-e0f2-4a9d-3fc73af56746@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190322002754.UHpPH-vOHmWwkvZ0RC7qBz14BgMIHjewLHQjfzwUAaA@z>

On 12/5/18 3:10 PM, Brendan Higgins wrote:
> On Tue, Dec 4, 2018@5:49 AM Rob Herring <robh@kernel.org> wrote:
>>
>> On Tue, Dec 4, 2018@5:40 AM Frank Rowand <frowand.list@gmail.com> wrote:
>>>
>>> Hi Brendan, Rob,
>>>
>>> Pulling a comment from way back in the v1 patch thread:
>>>
>>> On 10/17/18 3:22 PM, Brendan Higgins wrote:
>>>> On Wed, Oct 17, 2018@10:49 AM <Tim.Bird@sony.com> wrote:
>>>
>>> < snip >
>>>
>>>> The test and the code under test are linked together in the same
>>>> binary and are compiled under Kbuild. Right now I am linking
>>>> everything into a UML kernel, but I would ultimately like to make
>>>> tests compile into completely independent test binaries. So each test
>>>> file would get compiled into its own test binary and would link
>>>> against only the code needed to run the test, but we are a bit of a
>>>> ways off from that.
>>>
>>> I have never used UML, so you should expect naive questions from me,
>>> exhibiting my lack of understanding.
>>>
>>> Does this mean that I have to build a UML architecture kernel to run
>>> the KUnit tests?
>>
>> In this version of the patch series, yes.
>>
>>> *** Rob, if the answer is yes, then it seems like for my workflow,
>>> which is to build for real ARM hardware, my work is doubled (or
>>> worse), because for every patch/commit that I apply, I not only have
>>> to build the ARM kernel and boot on the real hardware to test, I also
>>> have to build the UML kernel and boot in UML.  If that is correct
>>> then I see this as a major problem for me.
>>
>> I've already raised this issue elsewhere in the series. Restricting
>> the DT tests to UML is a non-starter.
> 

> I have already stated my position elsewhere on the matter, but in
> summary: Ensuring most tests can run without external dependencies
> (hardware, VM, etc) has a lot of benefits and should be supported in
> nearly all cases, but such tests should also work when compiled to run
> on real hardware/VM; the tooling might not be as good in the latter
> case, but I understand that there are good reasons to support it
> nonetheless.

And my needs are the exact opposite.  My tests must run on real hardware,
in the context of the real operating system subsystems and drivers
potentially causing issues.

It is useful if the tests can also run without that dependency.

-Frank


> 
> So I am going to try to add basic support for running tests on other
> architectures in the next version or two.

< snip >

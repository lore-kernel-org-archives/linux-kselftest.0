From: shuah at kernel.org (shuah)
Date: Tue, 18 Dec 2018 07:53:36 -0700
Subject: selftests/net: udpgso: LTS kernels supportability ?
In-Reply-To: <1de7a003-0aac-1f4f-b836-267136e30a0a@linaro.org>
References: <bbabafb5-e16c-4025-31d0-d9e5feb5f39a@linaro.org>
 <1d2c9a10-6caf-49ff-b921-8b93dbe96f78@kernel.org>
 <1de7a003-0aac-1f4f-b836-267136e30a0a@linaro.org>
Message-ID: <fd4c527a-daeb-1c73-c423-95d02e1b8e86@kernel.org>

On 12/18/18 4:37 AM, Rafael David Tinoco wrote:
> On 12/17/18 4:42 PM, shuah wrote:
>> Hi Rafael,
>>
>> On 12/17/18 10:53 AM, Rafael David Tinoco wrote:
>>> Shuah,
>>>
>>> I was recently investigating some errors coming out of our functional
>>> tests and we, Dan and I, came up with a discussion that might not be new
>>> for you, but, interests us, in defining how to better use kselftests as
>>> a regression mechanism/tool in our LKFT (https://lkft.linaro.org).
>>>
>>> David / Willem,
>>>
>>> I'm only using udpgso as an example for what I'd like to ask Shuah. Feel
>>> free to jump in in the discussion if you think its worth.
>>>
>>> All,
>>>
>>> Regarding: udpgso AND https://bugs.linaro.org/show_bug.cgi?id=3980
>>>
>>> udpgso tests are failing in kernels bellow 4.18 because of 2 main
>>> reasons:
>>>
>>> 1) udp4_ufo_fragment does not seem to demand the GSO SKB to be > than
>>> the MTU for older kernels (4th test case in udpgso.c).
>>>
>>> 2) setsockopt(...UDP_SEGMENT) support is not present for older kernels.
>>> (commits "udp: generate gso with UDP_SEGMENT" and its fixes seem to be
>>> needed).
>>
>> This case is easy right? Based on the test output below , I can see that
>> the failure is due to
>>
>> ./udpgso: setsockopt udp segment: Protocol not available. setsockopt()
>> is returning an error to clearly indicate that this options isn't
>> supported. This will be a test change to say test is a skip as opposed
>> to fail.
> 
> You referred to (2). (1) isn't that straightforward.
> 
>> We have a solution for this - test should SKIP as opposed to FAIL.
>>
>>> With that explained, finally the question/discussion:
>>>
>>> Shouldn't we enforce a versioning mechanism for tests that are testing
>>> recently added features ? I mean, some of the tests inside udpgso
>>> selftest are good enough for older kernels...
>>
>> Right - we do have generic way to handle that by detecting if feature is
>> supported and skip instead of using Kernel version which is going to be
>> hard to maintain.
> 
> You can't distinguish case (1) failures between real failures OR older
> kernel behaving differently then testcase expects.
> 
>>>
>>> But, because we have no control over "kernel features" and "supported
>>> test cases", we, Linaro, have to end up blacklisting all selftests that
>>> have new feature oriented tests, because one or two test cases only.
>>>

Can you share the blacklisted tests?

thanks,
-- Shuah

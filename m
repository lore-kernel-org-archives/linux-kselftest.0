From: rafael.tinoco@linaro.org (Rafael David Tinoco)
Date: Tue, 18 Dec 2018 13:36:46 -0200
Subject: selftests/net: udpgso: LTS kernels supportability ?
In-Reply-To: <fd4c527a-daeb-1c73-c423-95d02e1b8e86@kernel.org>
References: <bbabafb5-e16c-4025-31d0-d9e5feb5f39a@linaro.org>
 <1d2c9a10-6caf-49ff-b921-8b93dbe96f78@kernel.org>
 <1de7a003-0aac-1f4f-b836-267136e30a0a@linaro.org>
 <fd4c527a-daeb-1c73-c423-95d02e1b8e86@kernel.org>
Message-ID: <f0529af4-4eb6-afb3-3992-c196a09af6bc@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181218153646.X7i2zAOsiGtX1PJ83KSUzN5CcrBh_Pf6yucW4zlHGr0@z>

On 12/18/18 12:53 PM, shuah wrote:
> On 12/18/18 4:37 AM, Rafael David Tinoco wrote:
>> On 12/17/18 4:42 PM, shuah wrote:
>>> Hi Rafael,
>>>
>>> On 12/17/18 10:53 AM, Rafael David Tinoco wrote:
>>>> Shuah,
>>>>
>>>> I was recently investigating some errors coming out of our functional
>>>> tests and we, Dan and I, came up with a discussion that might not be
>>>> new
>>>> for you, but, interests us, in defining how to better use kselftests as
>>>> a regression mechanism/tool in our LKFT (https://lkft.linaro.org).
>>>>
>>>> David / Willem,
>>>>
>>>> I'm only using udpgso as an example for what I'd like to ask Shuah.
>>>> Feel
>>>> free to jump in in the discussion if you think its worth.
>>>>
>>>> All,
>>>>
>>>> Regarding: udpgso AND https://bugs.linaro.org/show_bug.cgi?id=3980
>>>>
>>>> udpgso tests are failing in kernels bellow 4.18 because of 2 main
>>>> reasons:
>>>>
>>>> 1) udp4_ufo_fragment does not seem to demand the GSO SKB to be > than
>>>> the MTU for older kernels (4th test case in udpgso.c).
>>>>
>>>> 2) setsockopt(...UDP_SEGMENT) support is not present for older kernels.
>>>> (commits "udp: generate gso with UDP_SEGMENT" and its fixes seem to be
>>>> needed).
>>>
>>> This case is easy right? Based on the test output below , I can see that
>>> the failure is due to
>>>
>>> ./udpgso: setsockopt udp segment: Protocol not available. setsockopt()
>>> is returning an error to clearly indicate that this options isn't
>>> supported. This will be a test change to say test is a skip as opposed
>>> to fail.
>>
>> You referred to (2). (1) isn't that straightforward.
>>
>>> We have a solution for this - test should SKIP as opposed to FAIL.
>>>
>>>> With that explained, finally the question/discussion:
>>>>
>>>> Shouldn't we enforce a versioning mechanism for tests that are testing
>>>> recently added features ? I mean, some of the tests inside udpgso
>>>> selftest are good enough for older kernels...
>>>
>>> Right - we do have generic way to handle that by detecting if feature is
>>> supported and skip instead of using Kernel version which is going to be
>>> hard to maintain.
>>
>> You can't distinguish case (1) failures between real failures OR older
>> kernel behaving differently then testcase expects.
>>
>>>>
>>>> But, because we have no control over "kernel features" and "supported
>>>> test cases", we, Linaro, have to end up blacklisting all selftests that
>>>> have new feature oriented tests, because one or two test cases only.
>>>>
> 
> Can you share the blacklisted tests?

Sure!

The following yaml file:

https://github.com/Linaro/qa-reports-known-issues/blob/master/kselftests-production.yaml

Contains a list of all "known issues" for kselftests running in LKFT.

1 entry example (this particular one):

 - environments: *environments_all
    notes: >
      LKFT: net: udpgso.sh PASS on 4.18 and failed on 4.17 and below
    projects:
    - lkft/linux-stable-rc-4.14-oe
    - lkft/linux-stable-rc-4.9-oe
    - lkft/linux-stable-rc-4.4-oe
    - lkft/linaro-hikey-stable-rc-4.4-oe
    test_names:
    - kselftest/net_udpgso.sh
    - kselftest-vsyscall-mode-none/net_udpgso.sh
    - kselftest-vsyscall-mode-native/net_udpgso.sh
    url: https://bugs.linaro.org/show_bug.cgi?id=3980
    active: true
    intermittent: false

Tells us:

Its a known issue for all environments (arm, arm64, x86, x86_64, qemus,
etc) and kernels 4.14, 4.9 and 4.4. The "url" shows our internal bug
related to the known issue/investigation.

With that, we don't consider it as a regression when this test fails for
4.14, 4.9 and 4.4 in any existing environment (boards, qemu/kvm, hosts,
diff archs).

I hope it helps you,

Cheers o/
-- 
Rafael D. Tinoco
Linaro - Kernel Validation

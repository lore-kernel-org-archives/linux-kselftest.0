From: shuah@kernel.org (Shuah Khan)
Date: Fri, 11 May 2018 13:33:26 -0600
Subject: [PATCH v2] selftests/cgroup: memory controller self-tests
In-Reply-To: <20180511180342.GA20683@castle>
References: <20180510163701.28936-1-guro@fb.com>
 <20180510183224.GP2368884@devbig577.frc2.facebook.com>
 <a652ce44-07f9-d229-70d4-4376bfbafa40@kernel.org>
 <20180511143228.GU2368884@devbig577.frc2.facebook.com>
 <ae4dc3f9-baa6-b492-7c43-0359734440b3@kernel.org>
 <20180511162920.GV2368884@devbig577.frc2.facebook.com>
 <957d089f-7a88-9ff4-733a-8e082339720c@kernel.org>
 <20180511180342.GA20683@castle>
Message-ID: <fb835740-cee8-83f8-880c-ea6eea8c7c63@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180511193326.Lci66eStLpHpfbV3nHRR9jMJXb99JbtExlgHJgI8JIk@z>

On 05/11/2018 12:03 PM, Roman Gushchin wrote:
> On Fri, May 11, 2018@10:58:53AM -0600, Shuah Khan wrote:
>> On 05/11/2018 10:29 AM, Tejun Heo wrote:
>>> Hello, Shuah.
>>>
>>> On Fri, May 11, 2018@08:55:28AM -0600, Shuah Khan wrote:
>>>> I think we don't need to create a special branch and all. The following
>>>> should work:
>>>>
>>>> linux-next already has the skip work. What we can do is:
>>>>
>>>> Do the cleanup and test it against linux-next. In linux-next SKIP isn't PASS. If test is
>>>> compiled on linux-next, you will see that SKIP is SKIP. If it is compiled on the mainline,
>>>> it will be reported PASS, which will be a temporary state.
>>>
>>> Hah, why not just create a branch and make sure what we see in the
>>> topic branch is what we'll push?  That's how these things are done
>>> usually.
>>>
>>
>> It probably doesn't need to be complex.
>>
>> Unless there is a dependency with the cgroup tree and the cgroup test,
>> the test can go through kselftest tree with you. That is usually how
>> I handle kselftests.
>>
>> If you think there is a dependency and it has to go through cgroup tree
>> then, I can give you the Ack once this TEST_* gets cleaned up.
>>
>> thanks,
>> -- Shuah
>>
> 
> 
> Hello, Shuah!
> 
> A minor problem here is a version with KSFT_ constants won't even compile
> without your patch, which redefines KSFT_SKIP into a separate value,
> due to duplicate cases in the switch statement at the end of the file.
> 
> Anyway, not a big deal, we can handle it either way.
> An updated version below.
> 
> Thanks!
> 

Yeah. I see that. You have a switch for the KSFT_ values. Since there is no
dependency on the cgroup tree, I would recommend having this patch go through
kselftest tree which is the normal process for tests anyway.

This version is good and I can apply this to linux-kselftest next. I ran a
quick test and the Skip case looks good.

TAP version 13
selftests: cgroup: test_memcontrol
========================================
1..0 # Skipped: memory controller isn't available
not ok 1..1 selftests: cgroup: test_memcontrol [SKIP]


Tejun! Please send me your Ack.

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

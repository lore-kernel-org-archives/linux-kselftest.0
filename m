From: shuah@kernel.org (Shuah Khan)
Date: Fri, 27 Apr 2018 15:41:52 -0600
Subject: [PATCH 1/1] selftests: Fix lib.mk run_tests target shell script
In-Reply-To: <769479298.6230.1524864798331.JavaMail.zimbra@efficios.com>
References: <20171028134639.16811-1-mathieu.desnoyers@efficios.com>
 <44e3d6b0-6e0d-4482-fa7e-d8dac8619d4e@osg.samsung.com>
 <1490563551.1701.1509574972486.JavaMail.zimbra@efficios.com>
 <1717349402.1702.1509575073204.JavaMail.zimbra@efficios.com>
 <c1575990-8bb7-9997-0c0a-8a5b78b347c6@osg.samsung.com>
 <740429490.6175.1524860259330.JavaMail.zimbra@efficios.com>
 <670cba49-7419-5506-de06-05267f0493e9@kernel.org>
 <3fa8c84a-6587-dfca-2e93-5cfe15f42c81@kernel.org>
 <769479298.6230.1524864798331.JavaMail.zimbra@efficios.com>
Message-ID: <834c528c-9ff2-0a62-6124-84697798dfdc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180427214152.XWnJhgJA6IA7FE0-QLQ7ErjvkucY7mJ04cgw4N2_TrU@z>

On 04/27/2018 03:33 PM, Mathieu Desnoyers wrote:
> ----- On Apr 27, 2018,@5:05 PM, shuah shuah@kernel.org wrote:
> 
>> On 04/27/2018 02:42 PM, Shuah Khan wrote:
>>> On 04/27/2018 02:17 PM, Mathieu Desnoyers wrote:
>>>> ----- On Nov 1, 2017,@6:28 PM, Shuah Khan shuahkh@osg.samsung.com wrote:
>>>>
>>>>> On 11/01/2017 04:24 PM, Mathieu Desnoyers wrote:
>>>>>> ----- On Nov 1, 2017, at 6:22 PM, Mathieu Desnoyers
>>>>>> mathieu.desnoyers@efficios.com wrote:
>>>>>>
>>>>>>> ----- On Nov 1, 2017,@5:33 PM, Shuah Khan shuahkh@osg.samsung.com wrote:
>>>>>>>
>>>>>>>> On 10/28/2017 07:46 AM, Mathieu Desnoyers wrote:
>>>>>>>>> Within run_tests target, the whole script needs to be executed within
>>>>>>>>> the same shell and not as separate subshells, so the initial test_num
>>>>>>>>> variable set to 0 is still present when executing "test_num=`echo
>>>>>>>>> $$test_num+1 | bc`;".
>>>>>>>>>
>>>>>>>>> Demonstration of the issue (make run_tests):
>>>>>>>>>
>>>>>>>>> TAP version 13
>>>>>>>>> (standard_in) 1: syntax error
>>>>>>>>> selftests: basic_test
>>>>>>>>> ========================================
>>>>>>>>> ok 1.. selftests: basic_test [PASS]
>>>>>>>>> (standard_in) 1: syntax error
>>>>>>>>> selftests: basic_percpu_ops_test
>>>>>>>>> ========================================
>>>>>>>>> ok 1.. selftests: basic_percpu_ops_test [PASS]
>>>>>>>>> (standard_in) 1: syntax error
>>>>>>>>> selftests: param_test
>>>>>>>>> ========================================
>>>>>>>>> ok 1.. selftests: param_test [PASS]
>>>>>>>>
>>>>>>>> Hi Mathieu,
>>>>>>>>
>>>>>>>> Odd. I don't see the error. I am curious if this specific to
>>>>>>>> env. Can you reproduce this with one of the existing tests,
>>>>>>>> kcmp or breakpoints
>>>>>>>
>>>>>>> Yes, it reproduces:
>>>>>>>
>>>>>>> cd tools/testing/selftests/kcmp
>>>>>>> make run_tests
>>>>>>> gcc -I../../../../usr/include/    kcmp_test.c  -o
>>>>>>> /home/efficios/git/linux-rseq/tools/testing/selftests/kcmp/kcmp_test
>>>>>>> TAP version 13
>>>>>>> (standard_in) 1: syntax error
>>>>>>> selftests: kcmp_test
>>>>>>> ========================================
>>>>>>> ok 1.. selftests: kcmp_test [PASS]
>>>>>>>
>>>>>>> cd tools/testing/selftests/breakpoints
>>>>>>> make run_tests
>>>>>>> gcc     step_after_suspend_test.c  -o
>>>>>>> /home/efficios/git/linux-rseq/tools/testing/selftests/breakpoints/step_after_suspend_test
>>>>>>> gcc     breakpoint_test.c  -o
>>>>>>> /home/efficios/git/linux-rseq/tools/testing/selftests/breakpoints/breakpoint_test
>>>>>>> TAP version 13
>>>>>>> (standard_in) 1: syntax error
>>>>>>> selftests: step_after_suspend_test
>>>>>>> ========================================
>>>>>>> not ok 1.. selftests:  step_after_suspend_test [FAIL]
>>>>>>> (standard_in) 1: syntax error
>>>>>>> selftests: breakpoint_test
>>>>>>> ========================================
>>>>>>> ok 1.. selftests: breakpoint_test [PASS]
>>>>>>>
>>>>>>
>>>>>> The version of "make" on that machine is:
>>>>>>
>>>>>> make --version
>>>>>> GNU Make 3.81
>>>>>> Copyright (C) 2006  Free Software Foundation, Inc.
>>>>>> This is free software; see the source for copying conditions.
>>>>>> There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
>>>>>> PARTICULAR PURPOSE.
>>>>>>
>>>>>> This program built for x86_64-pc-linux-gnu
>>>>>>
>>>>>> (if it helps reproducing)
>>>>>>
>>>>>
>>>>> Yup that's it. I have
>>>>>
>>>>> GNU Make 4.1
>>>>> Built for x86_64-pc-linux-gnu
>>>>> Copyright (C) 1988-2014 Free Software Foundation, Inc.
>>>>> License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
>>>>> This is free software: you are free to change and redistribute it.
>>>>> There is NO WARRANTY, to the extent permitted by law.
>>>>>
>>>>> I will test with your patch and see what happens in my env.
>>>>
>>>> Hi,
>>>>
>>>> I still see the problem with v4.17-rc2. Did you have time to
>>>> consider merging my fix ?
>>>>
>>>> Thanks,
>>>>
>>>> Mathieu
>>>
>>> Sorry for the delay. It slipped through. I will queue this for the next rc.
>>> Thanks for
>>> the ping. Hope it applies :)
>>>
>>> thanks,
>>> -- Shuah
>>>
>>>
>>
>> Now I remember why I didn't pull this in. With your patch, I see the same
>> failures you are seeing in my env. with
>>
>> GNU Make 4.1
>> Built for x86_64-pc-linux-gnu
>> Copyright (C) 1988-2014 Free Software Foundation, Inc.
>> License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
>> This is free software: you are free to change and redistribute it.
>> There is NO WARRANTY, to the extent permitted by law.
>>
>> I will have to figure out a different way to fix the problem.
> 
> It works fine here on my other machine that has GNU make 4.1 both with
> and without the patch. The patch fixes the behavior on GNU make 3.81.
> 
> I noticed I had to manually apply the patch to 4.17-rc2. Here is the updated diff.
> Please ensure that you both remove the appropriate "@" from beginning
> of lines, and add "\" characters at end of lines if you integrate the patch
> manually.
> 

Please rebase and resend the patch to avoid manual integration.

thanks,
-- Shuah

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

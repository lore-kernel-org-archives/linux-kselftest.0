From: shuahkh at osg.samsung.com (Shuah Khan)
Date: Fri, 2 Mar 2018 10:17:10 -0700
Subject: [PATCH] selftests: memory-hotplug: fix emit_tests regression
In-Reply-To: <CADYN=9LGPa+rfnuGJ-nrpxPvw+tuAYNjxCCqefxAuRe-B_tq4w@mail.gmail.com>
References: <20180301201626.17347-1-shuahkh@osg.samsung.com>
 <CADYN=9LGPa+rfnuGJ-nrpxPvw+tuAYNjxCCqefxAuRe-B_tq4w@mail.gmail.com>
Message-ID: <98a5211d-2b88-1c0c-c5d5-7cfcfa31ef2a@osg.samsung.com>

On 03/02/2018 01:31 AM, Anders Roxell wrote:
> On 1 March 2018 at 21:16, Shuah Khan <shuahkh at osg.samsung.com> wrote:
>> Commit 16c513b13477
>> ("selftests: memory-hotplug: silence test command echo")
>>
>> introduced regression in emit_tests and results in the following
>> failure when selftests are installed and run. Fix it.
>>
>> Running tests in memory-hotplug
>> ========================================
>> ./run_kselftest.sh: line 121: @./mem-on-off-test.sh: No such file or
>> directory
>> selftests: memory-hotplug [FAIL]
>>
>> Fixes: 16c513b13477 (selftests: memory-hotplug: silence test command echo")
>> Reported-by: Naresh Kamboju <naresh.kamboju at linaro.org>
>> Signed-off-by: Shuah Khan <shuahkh at osg.samsung.com>
> 
> Tested-by: Anders Roxell <anders.roxell at linaro.org>
> 

Thanks for testing. It is now in linux-kselftest fixes for the next
4.16-rc

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: shuah at kernel.org (shuah)
Date: Tue, 21 May 2019 11:33:51 -0600
Subject: [PATCH v2 5/5] kselftest: Extend vDSO selftest to clock_getres
In-Reply-To: <252b011e-974a-2f3b-2cc3-0892d1c4a3c0@kernel.org>
References: <20190416161434.32691-1-vincenzo.frascino@arm.com>
 <20190416161434.32691-6-vincenzo.frascino@arm.com>
 <f07e07b0-4e53-96c8-ebe2-a0f5528fa329@arm.com>
 <252b011e-974a-2f3b-2cc3-0892d1c4a3c0@kernel.org>
Message-ID: <759f59b2-2cb3-130b-fb30-89e3fb92af33@kernel.org>

On 5/21/19 10:24 AM, shuah wrote:
> On 5/21/19 10:11 AM, Vincenzo Frascino wrote:
>> Hi Shuah,
>>
>> I did not see this patch in 5.2-rc1 and I was wondering if there is 
>> anything I
>> can do to help with upstraming it.
>>
> 
> Thanks for the ping.
> 
> Sorry about this. I saw that this part of a series and thought it
> depends on other patches and should go through another tree.
> 
> Totally missed that Will suggested that I take it though selftests.
> 
> My bad. I will get this in - I hope there are no dependencies with other
> trees.
> 
> thanks,
> -- Shuah
> 
> 

Can you take a look at the macro in this patch. It has checkpatch
warn:

WARNING: Macros with flow control statements should be avoided


thanks,
-- Shuah

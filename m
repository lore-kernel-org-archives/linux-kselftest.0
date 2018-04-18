From: tom.hromatka@oracle.com (Tom Hromatka)
Date: Wed, 18 Apr 2018 14:03:37 -0600
Subject: [PATCH 2/2] selftests: sparc64: char: Selftest for privileged ADI
 driver
In-Reply-To: <6ef81e28-7656-ccf5-5d4d-ef315ae250ce@kernel.org>
References: <20180418162958.442909-1-tom.hromatka@oracle.com>
 <20180418162958.442909-3-tom.hromatka@oracle.com>
 <6ef81e28-7656-ccf5-5d4d-ef315ae250ce@kernel.org>
Message-ID: <a44ead3d-8565-2d44-5a28-dfc51d4920d9@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180418200337.nWukkw6Eeh2F_V4Elcq0q-FRuss6RdowEhhExkkxXQs@z>



On 04/18/2018 01:58 PM, Shuah Khan wrote:
> Hi Tom,
>
> On 04/18/2018 10:29 AM, Tom Hromatka wrote:
>> Add a selftest for the sparc64 privileged ADI driver.  These
>> tests verify the read(), pread(), write(), pwrite(), and seek()
>> functionality of the driver.  The tests also report simple
>> performance statistics:
>>
>>          Syscall Call    AvgTime AvgSize
>>                  Count   (ticks) (bytes)
>>          -------------------------------
>>          read          3  167134    8133
>>          pread         4  137217    6741
>>          write         3   73787    8133
>>          pwrite        4   65832    6741
>>          seek         10    2422       0
>>
>>          Ran 8 tests
>>          All tests passed
>>
>> Signed-off-by: Tom Hromatka <tom.hromatka at oracle.com>
>> Reviewed-by: Allen Pais <allen.pais at oracle.com>
> Thanks for the patch. A few comments below:

Thanks for the quick turnaround, Shuah.  I'll work through your
comments and get a v2 out in the next few days.

Regards.

Tom



--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

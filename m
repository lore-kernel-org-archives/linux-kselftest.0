From: bauerman@linux.ibm.com (Thiago Jung Bauermann)
Date: Mon, 30 Jul 2018 20:54:53 -0300
Subject: [PATCH 2/3] userfaultfd: selftest: Skip test if a feature isn't
 supported
In-Reply-To: <20180725141148.GD25188@rapoport-lnx>
References: <20180725024209.32586-1-bauerman@linux.ibm.com>
 <20180725024209.32586-3-bauerman@linux.ibm.com>
 <20180725141148.GD25188@rapoport-lnx>
Message-ID: <871sbkb7oy.fsf@morokweng.localdomain>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180730235453.3BHmwp8HvJF2lO7DRS-S6_kknem1oXM6CYd52kE0zXQ@z>


Mike Rapoport <rppt at linux.vnet.ibm.com> writes:

> Hi,
>
> On Tue, Jul 24, 2018@11:42:08PM -0300, Thiago Jung Bauermann wrote:
>> If userfaultfd runs on a system that doesn't support some feature it is
>> trying to test, it currently ends with error code 1 which indicates
>> test failure:
>> 
>>   # ./userfaultfd anon 10 10
>>   nr_pages: 160, nr_pages_per_cpu: 80
>>   bounces: 9, mode: rnd poll, userfaults: 7 59
>>   bounces: 8, mode: poll, userfaults: 0 0
>>   bounces: 7, mode: rnd racing ver, userfaults: 45 2
>>   bounces: 6, mode: racing ver, userfaults: 3 1
>>   bounces: 5, mode: rnd ver, userfaults: 55 32
>>   bounces: 4, mode: ver, userfaults: 69 0
>>   bounces: 3, mode: rnd racing, userfaults: 1 1
>>   bounces: 2, mode: racing, userfaults: 65 0
>>   bounces: 1, mode: rnd, userfaults: 44 1
>>   bounces: 0, mode:, userfaults: 3 2
>>   testing UFFDIO_ZEROPAGE: done.
>>   testing signal delivery: UFFDIO_API
>>   # echo $?
>>   1
>> 
>> Make the testcase return KSFT_SKIP instead, which is more accurate since it
>> is not a real test failure:
>> 
>>   # ./userfaultfd anon 10 10
>>   nr_pages: 160, nr_pages_per_cpu: 80
>>   bounces: 9, mode: rnd poll, userfaults: 3 0
>>   bounces: 8, mode: poll, userfaults: 6 1
>>   bounces: 7, mode: rnd racing ver, userfaults: 3 1
>>   bounces: 6, mode: racing ver, userfaults: 2 1
>>   bounces: 5, mode: rnd ver, userfaults: 2 1
>>   bounces: 4, mode: ver, userfaults: 3 47
>>   bounces: 3, mode: rnd racing, userfaults: 38 0
>>   bounces: 2, mode: racing, userfaults: 4 61
>>   bounces: 1, mode: rnd, userfaults: 16 6
>>   bounces: 0, mode:, userfaults: 55 25
>>   testing UFFDIO_ZEROPAGE: done.
>>   testing signal delivery: UFFDIO_API: Invalid argument
>>   # echo $?
>>   4
>> 
>> While at it, also improve the error message of the ioctl(UFFDIO_API) call.
>
> Can you please also make the test return KSFT_SKIP if userfaultfd(2) fails
> with ENOSYS?

Sure. v2 will have a separate patch implementing your suggestion.

-- 
Thiago Jung Bauermann
IBM Linux Technology Center

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

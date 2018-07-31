From: bauerman@linux.ibm.com (Thiago Jung Bauermann)
Date: Mon, 30 Jul 2018 21:01:56 -0300
Subject: [PATCH 3/3] userfaultfd: selftest: Report XFAIL if shmem doesn't
 support zeropage
In-Reply-To: <20180725141849.GE25188@rapoport-lnx>
References: <20180725024209.32586-1-bauerman@linux.ibm.com>
 <20180725024209.32586-4-bauerman@linux.ibm.com>
 <20180725141849.GE25188@rapoport-lnx>
Message-ID: <87zhy89ssr.fsf@morokweng.localdomain>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180731000156.qdQkKsx20lpaU_etkoj028d5fTX6_GVdfs-FjxFeDww@z>


Mike Rapoport <rppt at linux.vnet.ibm.com> writes:

> Hi,
>
> On Tue, Jul 24, 2018@11:42:09PM -0300, Thiago Jung Bauermann wrote:
>> If userfaultfd runs on a system that doesn't support UFFDIO_ZEROPAGE for
>> shared memory, it currently ends with error code 1 which indicates test
>> failure:
>>
>>   # ./userfaultfd shmem 10 10
>>   nr_pages: 160, nr_pages_per_cpu: 80
>>   bounces: 9, mode: rnd poll, unexpected missing ioctl for anon memory
>>   # echo $?
>>   1
>>
>> This is a real failure, but expected so signal that to the test harness:
>
> I don't think its a real failure. If the kernel does not support
> UFFDIO_ZEROPAGE for shared memory the userfaultfd_zeropage_test can be
> simply skipped.

Ok, good point. I'll make that change in v2.

>>   # ./userfaultfd shmem 10 10
>>   nr_pages: 160, nr_pages_per_cpu: 80
>>   bounces: 9, mode: rnd poll, UFFDIO_ZEROPAGE unsupported in shmem VMAs
>>   # echo $?
>>   2
>>
>> Signed-off-by: Thiago Jung Bauermann <bauerman at linux.ibm.com>
>> ---
>>  tools/testing/selftests/vm/userfaultfd.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/tools/testing/selftests/vm/userfaultfd.c b/tools/testing/selftests/vm/userfaultfd.c
>> index bc9ec38fbc34..686fe96f617f 100644
>> --- a/tools/testing/selftests/vm/userfaultfd.c
>> +++ b/tools/testing/selftests/vm/userfaultfd.c
>> @@ -1115,6 +1115,14 @@ static int userfaultfd_stress(void)
>>  		expected_ioctls = uffd_test_ops->expected_ioctls;
>>  		if ((uffdio_register.ioctls & expected_ioctls) !=
>>  		    expected_ioctls) {
>> +			if (test_type == TEST_SHMEM &&
>> +			    (uffdio_register.ioctls & expected_ioctls) ==
>> +			    UFFD_API_RANGE_IOCTLS_BASIC) {
>> +				fprintf(stderr,
>> +					"UFFDIO_ZEROPAGE unsupported in shmem VMAs\n");
>> +				return KSFT_XFAIL;
>> +			}
>> +
>
> By all means, this check should be moved to userfaultfd_zeropage_test().

I made that change in v2.

> Ideally, we should call here ksft_test_result_skip() and simply return from
> the function.

In my understanding, calling ksft_test_result_skip() would require
converting the testcase to use the functions that generate TAP output.

Also, returning here isn't actually necessary: from my testing
userfaultfd_stress() doesn't require zeropage support in shmem so if the
only bit missing from uffdio_register.ioctls is the one for
UFFDIO_ZEROPAGE then this error can simply be ignored and the test can
continue. Do you agree?

>>  			fprintf(stderr,
>>  				"unexpected missing ioctl for anon memory\n");
>>  			return 1;


--
Thiago Jung Bauermann
IBM Linux Technology Center

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

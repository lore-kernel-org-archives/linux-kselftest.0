From: shuah at kernel.org (Shuah Khan)
Date: Wed, 10 Jan 2018 10:04:21 -0700
Subject: [Linux-kselftest-mirror] [PATCH] kselftest: fix OOM in memory
	compaction test
In-Reply-To: <7f319aac-ef79-a7b0-372c-b52062063f97@kernel.org>
References: <20180109162648.3987382-1-arnd@arndb.de>
 <7f319aac-ef79-a7b0-372c-b52062063f97@kernel.org>
Message-ID: <1e1f540c-fe13-e95e-6ecb-4d88c03ac9e7@kernel.org>

On 01/09/2018 09:47 AM, Shuah Khan wrote:
> On 01/09/2018 09:26 AM, Arnd Bergmann wrote:
>> Running the compaction_test sometimes results in out-of-memory
>> failures. When I debugged this, it turned out that the code to
>> reset the number of hugepages to the initial value is simply
>> broken since we write into an open sysctl file descriptor
>> multiple times without seeking back to the start.
>>
>> Adding the lseek here fixes the problem.
>>
>> Cc: stable at vger.kernel.org
>> Reported-by: Naresh Kamboju <naresh.kamboju at linaro.org>
>> Link: https://bugs.linaro.org/show_bug.cgi?id=3145
>> Signed-off-by: Arnd Bergmann <arnd at arndb.de>
>> ---
>>  tools/testing/selftests/vm/compaction_test.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/tools/testing/selftests/vm/compaction_test.c b/tools/testing/selftests/vm/compaction_test.c
>> index a65b016d4c13..1097f04e4d80 100644
>> --- a/tools/testing/selftests/vm/compaction_test.c
>> +++ b/tools/testing/selftests/vm/compaction_test.c
>> @@ -137,6 +137,8 @@ int check_compaction(unsigned long mem_free, unsigned int hugepage_size)
>>  	printf("No of huge pages allocated = %d\n",
>>  	       (atoi(nr_hugepages)));
>>  
>> +	lseek(fd, 0, SEEK_SET);
>> +
>>  	if (write(fd, initial_nr_hugepages, strlen(initial_nr_hugepages))
>>  	    != strlen(initial_nr_hugepages)) {
>>  		perror("Failed to write value to /proc/sys/vm/nr_hugepages\n");
>>
> 
> 
> Thanks for the patch. I will get this into 4.16-rc1
> 

Applied to linux-kselftest next for 4.16-rc1

thanks,
-- Shuah

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

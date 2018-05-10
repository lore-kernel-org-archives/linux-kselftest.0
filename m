From: shuah@kernel.org (Shuah Khan)
Date: Thu, 10 May 2018 11:28:20 -0600
Subject: [PATCH] selftests: media_tests: fix spelling mistake:
 "iternations" -> "iterations"
In-Reply-To: <140c4e71-071f-039a-c883-fc664e696402@kernel.org>
References: <20180502150010.32333-1-colin.king@canonical.com>
 <140c4e71-071f-039a-c883-fc664e696402@kernel.org>
Message-ID: <f990d4dd-ff00-b695-68e6-d8d93a200e57@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180510172820.FqvxIlsteAY2Lu3cGud832h9qpb6Rvnaht8W-KGppuQ@z>

On 05/04/2018 01:42 PM, Shuah Khan wrote:
> On 05/02/2018 09:00 AM, Colin King wrote:
>> From: Colin Ian King <colin.king at canonical.com>
>>
>> Trivial fix to spelling mistake in message text
>>
>> Signed-off-by: Colin Ian King <colin.king at canonical.com>
>> ---
>>  tools/testing/selftests/media_tests/media_device_test.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tools/testing/selftests/media_tests/media_device_test.c b/tools/testing/selftests/media_tests/media_device_test.c
>> index 421a367e4bb3..d8bb1e15d1d9 100644
>> --- a/tools/testing/selftests/media_tests/media_device_test.c
>> +++ b/tools/testing/selftests/media_tests/media_device_test.c
>> @@ -88,7 +88,7 @@ int main(int argc, char **argv)
>>  	       "other Oops in the dmesg. Enable KaSan kernel\n"
>>  	       "config option for use-after-free error detection.\n\n");
>>  
>> -	printf("Running test for %d iternations\n", count);
>> +	printf("Running test for %d iterations\n", count);
>>  
>>  	while (count > 0) {
>>  		ret = ioctl(fd, MEDIA_IOC_DEVICE_INFO, &mdi);
>>
> 
> Thanks. I will queue this for 4.18-rc1
> 
> -- Shuah
> 

Applied to linux-kselftest next for 4.18-rc1

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

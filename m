From: shuah@kernel.org (Shuah Khan)
Date: Thu, 10 May 2018 11:29:04 -0600
Subject: [PATCH] selftests: fix spelling mistake: "desciptor" ->
 "descriptor"
In-Reply-To: <55d4fa6c-2870-afd4-2506-b7a3d721e711@kernel.org>
References: <20180429115425.9378-1-colin.king@canonical.com>
 <55d4fa6c-2870-afd4-2506-b7a3d721e711@kernel.org>
Message-ID: <d8829df5-7292-cbe4-7ea4-e580c2de3ba4@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180510172904.cxwYPkjpdK7jGYX2nzZFr6d4o8HtbCOvhTIgwDiHDus@z>

On 05/04/2018 01:45 PM, Shuah Khan wrote:
> On 04/29/2018 05:54 AM, Colin King wrote:
>> From: Colin Ian King <colin.king at canonical.com>
>>
>> Trivial fix to spelling mistake in message text
>>
>> Signed-off-by: Colin Ian King <colin.king at canonical.com>
>> ---
>>  tools/testing/selftests/filesystems/devpts_pts.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tools/testing/selftests/filesystems/devpts_pts.c b/tools/testing/selftests/filesystems/devpts_pts.c
>> index b9055e974289..ea5de8271521 100644
>> --- a/tools/testing/selftests/filesystems/devpts_pts.c
>> +++ b/tools/testing/selftests/filesystems/devpts_pts.c
>> @@ -279,7 +279,7 @@ int main(int argc, char *argv[])
>>  	int ret;
>>  
>>  	if (!isatty(STDIN_FILENO)) {
>> -		fprintf(stderr, "Standard input file desciptor is not attached "
>> +		fprintf(stderr, "Standard input file descriptor is not attached "
>>  				"to a terminal. Skipping test\n");
>>  		exit(EXIT_FAILURE);
>>  	}
>>
> 
> Thanks. I will queue this up for 4.18-rc1
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

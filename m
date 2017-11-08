From: lei.yang at windriver.com (lei yang)
Date: Wed, 8 Nov 2017 11:22:05 +0800
Subject: [Linux-kselftest-mirror] [PATCH] selftests: memfd_test.c: fix
	compilation warning.
In-Reply-To: <6a76f65a-a484-ba72-6cc5-85010666359c@osg.samsung.com>
References: <1509879400-26061-1-git-send-email-Lei.Yang@windriver.com>
 <6a76f65a-a484-ba72-6cc5-85010666359c@osg.samsung.com>
Message-ID: <1591d8a2-fcc4-9560-0be5-b4ddcf7825ec@windriver.com>

I got the same warning even with ubuntu new distro, this patch fixed 
this issue.

$ gcc --version
gcc (Ubuntu 6.3.0-12ubuntu2) 6.3.0 20170406
Copyright (C) 2016 Free Software Foundation, Inc.
This is free software; see the source for copying conditions. There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

$ make -v
GNU Make 4.1
Built for x86_64-pc-linux-gnu
Copyright (C) 1988-2014 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later 
<http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
$ uname -a
Linux pek-lyang0-u17 4.10.0-38-generic #42-Ubuntu SMP Tue Oct 10 
13:24:27 UTC 2017 x86_64 x86_64 x86_64 GNU/Linux


---------------------

memfd_test.c: In function mfd_assert_grow_write:
memfd_test.c:517:19: warning: format %d expects argument of type int, 
but argument 2 has type size_t {aka long unsigned int} [-Wformat=]
    printf("malloc(%d) failed: %m\n", mfd_def_size * 8);
                    ^
memfd_test.c: In function mfd_fail_grow_write:
memfd_test.c:537:19: warning: format %d expects argument of type int, 
but argument 2 has type size_t {aka long unsigned int} [-Wformat=]
    printf("malloc(%d) failed: %m\n", mfd_def_size * 8);



Lei


On 2017年11月07日 07:46, Shuah Khan wrote:
> On 11/05/2017 03:56 AM, Lei Yang wrote:
>> Replace '%d' by '%zu' to fix the following compilation warning.
>>
>> memfd_test.c:517:3: warning: format ‘%d’ expects argument of
>> type ‘int’,but argument 2 has type ‘size_t’ [-Wformat=]
>>     printf("malloc(%d) failed: %m\n", mfd_def_size * 8);
>>     ^
>> memfd_test.c: In function ‘mfd_fail_grow_write’:
>> memfd_test.c:537:3: warning: format ‘%d’ expects argument
>> of type ‘int’,but argument 2 has type ‘size_t’ [-Wformat=]
>>     printf("malloc(%d) failed: %m\n", mfd_def_size * 8);
>>
>> Signed-off-by: Lei Yang <Lei.Yang at windriver.com>
>> ---
>>   tools/testing/selftests/memfd/memfd_test.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/testing/selftests/memfd/memfd_test.c b/tools/testing/selftests/memfd/memfd_test.c
>> index f94c6d1..95df9e6 100644
>> --- a/tools/testing/selftests/memfd/memfd_test.c
>> +++ b/tools/testing/selftests/memfd/memfd_test.c
>> @@ -514,7 +514,7 @@ static void mfd_assert_grow_write(int fd)
>>   
>>   	buf = malloc(mfd_def_size * 8);
>>   	if (!buf) {
>> -		printf("malloc(%d) failed: %m\n", mfd_def_size * 8);
>> +		printf("malloc(%zu) failed: %m\n", mfd_def_size * 8);
>>   		abort();
>>   	}
>>   
>> @@ -534,7 +534,7 @@ static void mfd_fail_grow_write(int fd)
>>   
>>   	buf = malloc(mfd_def_size * 8);
>>   	if (!buf) {
>> -		printf("malloc(%d) failed: %m\n", mfd_def_size * 8);
>> +		printf("malloc(%zu) failed: %m\n", mfd_def_size * 8);
>>   		abort();
>>   	}
>>   
>>
> Relates to gcc version perhaps. What's your gcc version?
>
> thanks,
> -- Shuah

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

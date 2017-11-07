From: shuahkh@osg.samsung.com (Shuah Khan)
Date: Tue, 7 Nov 2017 15:54:55 -0700
Subject: [Linux-kselftest-mirror] [PATCH] selftests: fix compile error
	for sync
In-Reply-To: <c97a29d9-e424-c996-3729-d4d7e0a5bc07@windriver.com>
References: <1509876499-18499-1-git-send-email-Lei.Yang@windriver.com>
 <9a23bae8-00ee-eeb6-0b51-16132aab5b1a@osg.samsung.com>
 <c97a29d9-e424-c996-3729-d4d7e0a5bc07@windriver.com>
Message-ID: <5daeb7e7-5b92-aa67-e45c-f83db57811e2@osg.samsung.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20171107225455.5TamkhPJd8f5_k81aZ5Ppk_tbWZBvu6JM9Dcs_nqeuA@z>

On 11/06/2017 06:14 PM, lei yang wrote:
> 
> 
> On 2017年11月07日 07:35, Shuah Khan wrote:
>> On 11/05/2017 03:08 AM, Lei Yang wrote:
>>> I got below error message when building sync test:
>>>
>>> make[1]: Entering directory `tools/testing/selftests/sync'
>>> gcc -c sync.c -o tools/testing/selftests/sync/sync.o
>>> sync.c:42:29: fatal error: linux/sync_file.h: No such file or directory
>>>   #include <linux/sync_file.h>
>>>
>>> obviously, CFLAGS and LDFLAGS are not used when comipling.
>>>
>>> Signed-off-by: Lei Yang <Lei.Yang at windriver.com>
>>> ---
>>>   tools/testing/selftests/sync/Makefile | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/tools/testing/selftests/sync/Makefile b/tools/testing/selftests/sync/Makefile
>>> index 8e04d0a..46cbcc3 100644
>>> --- a/tools/testing/selftests/sync/Makefile
>>> +++ b/tools/testing/selftests/sync/Makefile
>>> @@ -29,9 +29,9 @@ $(TEST_CUSTOM_PROGS): $(TESTS) $(OBJS)
>>>       $(CC) -o $(TEST_CUSTOM_PROGS) $(OBJS) $(TESTS) $(CFLAGS) $(LDFLAGS)
>>>     $(OBJS): $(OUTPUT)/%.o: %.c
>>> -    $(CC) -c $^ -o $@
>>> +    $(CC) -c $^ -o $@ $(CFLAGS) $(LDFLAGS)
>>>     $(TESTS): $(OUTPUT)/%.o: %.c
>>> -    $(CC) -c $^ -o $@
>>> +    $(CC) -c $^ -o $@ $(CFLAGS) $(LDFLAGS)
>>>     EXTRA_CLEAN := $(TEST_CUSTOM_PROGS) $(OBJS) $(TESTS)
>>>
>> How are you building the test? I am not seeing the error on linux-4.14.0-rc8
> 
> make -C tools/testing/selftests
> 
> Lei
> 
> 

Based on the information in your other emails, looks like you are
testing these patches on 

$ cat /proc/version
Linux version 3.16.0-30-generic (buildd at kissel) (gcc version 4.8.2 (Ubuntu 4.8.2-19ubuntu1) ) #40~14.04.1-Ubuntu SMP Thu Jan 15 17:43:14 UTC 2015

That explains why you aren't finding sync_file.h header. This test isn't applicable
to Linux 3.16. In any case, I can't take patches that aren't tested on the latest
kernel release. 3.16 is very old.

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

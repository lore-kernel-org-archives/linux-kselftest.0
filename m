From: anders.roxell at linaro.org (Anders Roxell)
Date: Tue, 16 Jan 2018 12:00:45 +0100
Subject: [Linux-kselftest-mirror] [PATCH] selftests: sync: missing
	CFLAGS while compiling
In-Reply-To: <7273d0ce-3548-60f7-c331-bdf9bd9a3ec2@kernel.org>
References: <20180105163323.22920-1-anders.roxell@linaro.org>
 <7273d0ce-3548-60f7-c331-bdf9bd9a3ec2@kernel.org>
Message-ID: <CADYN=9LkAQnwHbADrt0qCsrXgREzTkFGUppfKrvNiwgDcamYbw@mail.gmail.com>

On 10 January 2018 at 01:05, Shuah Khan <shuah at kernel.org> wrote:
> On 01/05/2018 09:33 AM, Anders Roxell wrote:
>> Based on patch: https://patchwork.kernel.org/patch/10042045/
>>
>> arch64-linux-gnu-gcc -c sync.c -o sync/sync.o
>> sync.c:42:29: fatal error: linux/sync_file.h: No such file or directory
>>  #include <linux/sync_file.h>
>>                              ^
>> CFLAGS is not used during the compile step, so the system instead of
>> kernel headers are used.  Fix this by using lib.mk's compile rules and
>> remove CFLAGS from the linking step.
>
> Hmm. The changes don't match the change log. It odes more than just
> removing LDFLAGS from compile step,

oh, you are correct. I'm sorry.
I will re-spin the patch and make the changelog reflect the actual change
next time.

>
>>
>> Reported-by: Lei Yang <Lei.Yang at windriver.com>
>> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
>> ---
>>  tools/testing/selftests/sync/Makefile | 8 +-------
>>  1 file changed, 1 insertion(+), 7 deletions(-)
>>
>> diff --git a/tools/testing/selftests/sync/Makefile b/tools/testing/selftests/sync/Makefile
>> index b3c8ba3cb668..58b9336d6c84 100644
>> --- a/tools/testing/selftests/sync/Makefile
>> +++ b/tools/testing/selftests/sync/Makefile
>> @@ -27,12 +27,6 @@ OBJS := $(patsubst %,$(OUTPUT)/%,$(OBJS))
>>  TESTS := $(patsubst %,$(OUTPUT)/%,$(TESTS))
>>
>>  $(TEST_CUSTOM_PROGS): $(TESTS) $(OBJS)
>> -     $(CC) -o $(TEST_CUSTOM_PROGS) $(OBJS) $(TESTS) $(CFLAGS) $(LDFLAGS)
>
> So why not just delete $(LDFLAGS)??
> $(CC) -o $(TEST_CUSTOM_PROGS) $(OBJS) $(TESTS) $(CFLAGS)
>
>> -
>> -$(OBJS): $(OUTPUT)/%.o: %.c
>> -     $(CC) -c $^ -o $@
>> -
>> -$(TESTS): $(OUTPUT)/%.o: %.c
>> -     $(CC) -c $^ -o $@
>> +     $(CC) -o $(TEST_CUSTOM_PROGS) $(OBJS) $(TESTS) $(LDFLAGS)
>>
>>  EXTRA_CLEAN := $(TEST_CUSTOM_PROGS) $(OBJS) $(TESTS)
>>
>
> I can't take this patch the way it is. It breaks the following
> use-case:
>
> make O=/tmp/kselftest TARGETS=sync kselftest

Oh, I've missed that use-case. Will fix that in the re-spin of the patch.

To fix this build issue when cross compiling

--- a/tools/testing/selftests/sync/Makefile
+++ b/tools/testing/selftests/sync/Makefile
@@ -30,7 +30,7 @@ $(TEST_CUSTOM_PROGS): $(TESTS) $(OBJS)
        $(CC) -o $(TEST_CUSTOM_PROGS) $(OBJS) $(TESTS) $(CFLAGS) $(LDFLAGS)

 $(OBJS): $(OUTPUT)/%.o: %.c
-       $(CC) -c $^ -o $@
+       $(CC) -c $^ -o $@ $(CFLAGS)

 $(TESTS): $(OUTPUT)/%.o: %.c
        $(CC) -c $^ -o $@


The other issue that needs to be addressed somehow would be make the
build system do
headers_install or if that should be a prerequisite.
I've seen ways to install the headers: "make -C ../../../..
headers_install" if the headers
aren't there, in
tools/testing/selftests/gpio/Makefile
tools/testing/selftests/vm/Makefile

Is that the preferred way or should an update in
Documentation/dev-tools/kselftest.rst be done to say do "make
headers_install" before
building kselftests?


Cheers,
Anders

>
> thanks,
> -- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

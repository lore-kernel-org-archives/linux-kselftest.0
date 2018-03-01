From: shuahkh@osg.samsung.com (Shuah Khan)
Date: Thu, 1 Mar 2018 07:41:21 -0700
Subject: [PATCH] selftests: memory-hotplug: silence test command echo
In-Reply-To: <CA+G9fYsE0w00aeE3jxJU3Q01Yz_C95zn+kguMHqg6M9PRmhemg@mail.gmail.com>
References: <20180213214407.21717-1-shuahkh@osg.samsung.com>
 <CA+G9fYsE0w00aeE3jxJU3Q01Yz_C95zn+kguMHqg6M9PRmhemg@mail.gmail.com>
Message-ID: <7475d5ca-3fc6-260b-a1d3-60a3e1263769@osg.samsung.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180301144121.5_IMqz_zOU4R2nHxSLBZHTF5Ycze4U6CWOz94wYeUE0@z>

On 03/01/2018 02:11 AM, Naresh Kamboju wrote:
> On 14 February 2018@03:14, Shuah Khan <shuahkh@osg.samsung.com> wrote:
>> Silence the following command being printed while running test.
>>
>> ./mem-on-off-test.sh -r 2 && echo "selftests: memory-hotplug [PASS]" ||
>> echo "selftests: memory-hotplug [FAIL]"
>>
>> Signed-off-by: Shuah Khan <shuahkh at osg.samsung.com>
>> ---
>>  tools/testing/selftests/memory-hotplug/Makefile | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tools/testing/selftests/memory-hotplug/Makefile b/tools/testing/selftests/memory-hotplug/Makefile
>> index 86636d207adf..183b46883875 100644
>> --- a/tools/testing/selftests/memory-hotplug/Makefile
>> +++ b/tools/testing/selftests/memory-hotplug/Makefile
>> @@ -4,7 +4,7 @@ all:
>>  include ../lib.mk
>>
>>  TEST_PROGS := mem-on-off-test.sh
>> -override RUN_TESTS := ./mem-on-off-test.sh -r 2 && echo "selftests: memory-hotplug [PASS]" || echo "selftests: memory-hotplug [FAIL]"
>> +override RUN_TESTS := @./mem-on-off-test.sh -r 2 && echo "selftests: memory-hotplug [PASS]" || echo "selftests: memory-hotplug [FAIL]"
>>  override EMIT_TESTS := echo "$(RUN_TESTS)"
>>
>>  run_full_test:
> 
> The test execution broken due to this patch ?

Thanks for reporting this. I will look at this. The change probably
broke the EMIT_TESTS case.

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

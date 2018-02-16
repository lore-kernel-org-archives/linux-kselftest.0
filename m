From: naresh.kamboju@linaro.org (Naresh Kamboju)
Date: Fri, 16 Feb 2018 12:36:33 +0530
Subject: [PATCH] selftests: pstore: Adding config fragment
 CONFIG_PSTORE_RAM=m
In-Reply-To: <CAGXu5jJO9Cm37U=GwHPVpfh4yumszN3LuZweZuC5hqb-d0s3zw@mail.gmail.com>
References: <1517995040-22929-1-git-send-email-naresh.kamboju@linaro.org>
 <CAGXu5jJO9Cm37U=GwHPVpfh4yumszN3LuZweZuC5hqb-d0s3zw@mail.gmail.com>
Message-ID:
 <CA+G9fYtoRby8WJMOwviC8X4SvXrLEurFvD8pKX=9KLnRccm3Uw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180216070633.ahNPTBrxEvsaIxPkK8G7tFVQsASRjfe95E4b9TPD3Zo@z>

On 7 February 2018@14:50, Kees Cook <keescook@chromium.org> wrote:
> On Wed, Feb 7, 2018 at 8:17 PM, Naresh Kamboju
> <naresh.kamboju@linaro.org> wrote:
>> pstore_tests and pstore_post_reboot_tests need CONFIG_PSTORE_RAM=m
>
> Does it need to be =m, or is =y okay too?
>
>> Signed-off-by: Naresh Kamboju <naresh.kamboju at linaro.org>
>
> Either way:
>
> Acked-by: Kees Cook <keescook at chromium.org>

Thanks for the ACK.

Shuah,
Please help in applying this patch to selftests.

Best regards
Naresh Kamboju
>
> -Kees
>
>> ---
>>  tools/testing/selftests/pstore/config | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/tools/testing/selftests/pstore/config b/tools/testing/selftests/pstore/config
>> index 6a8e5a9..d148f9f 100644
>> --- a/tools/testing/selftests/pstore/config
>> +++ b/tools/testing/selftests/pstore/config
>> @@ -2,3 +2,4 @@ CONFIG_MISC_FILESYSTEMS=y
>>  CONFIG_PSTORE=y
>>  CONFIG_PSTORE_PMSG=y
>>  CONFIG_PSTORE_CONSOLE=y
>> +CONFIG_PSTORE_RAM=m
>> --
>> 2.7.4
>>
>
>
>
> --
> Kees Cook
> Pixel Security
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

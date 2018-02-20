From: shuah at kernel.org (Shuah Khan)
Date: Tue, 20 Feb 2018 08:43:48 -0700
Subject: [PATCH] selftests: pstore: Adding config fragment
 CONFIG_PSTORE_RAM=m
In-Reply-To: <CA+G9fYtoRby8WJMOwviC8X4SvXrLEurFvD8pKX=9KLnRccm3Uw@mail.gmail.com>
References: <1517995040-22929-1-git-send-email-naresh.kamboju@linaro.org>
 <CAGXu5jJO9Cm37U=GwHPVpfh4yumszN3LuZweZuC5hqb-d0s3zw@mail.gmail.com>
 <CA+G9fYtoRby8WJMOwviC8X4SvXrLEurFvD8pKX=9KLnRccm3Uw@mail.gmail.com>
Message-ID: <c109f735-d26f-4325-152d-d23adbb0695c@kernel.org>

On 02/16/2018 12:06 AM, Naresh Kamboju wrote:
> On 7 February 2018 at 14:50, Kees Cook <keescook at chromium.org> wrote:
>> On Wed, Feb 7, 2018 at 8:17 PM, Naresh Kamboju
>> <naresh.kamboju at linaro.org> wrote:
>>> pstore_tests and pstore_post_reboot_tests need CONFIG_PSTORE_RAM=m
>>
>> Does it need to be =m, or is =y okay too?
>>
>>> Signed-off-by: Naresh Kamboju <naresh.kamboju at linaro.org>
>>
>> Either way:
>>
>> Acked-by: Kees Cook <keescook at chromium.org>
> 
> Thanks for the ACK.
> 
> Shuah,
> Please help in applying this patch to selftests.
> 

Hi Naresh,

I applied it to linux-kselftest fixes for 4.16-rc3.

thanks,
-- Shuah

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

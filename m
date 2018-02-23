From: zongbox@gmail.com (Zong Li)
Date: Fri, 23 Feb 2018 15:05:25 +0800
Subject: [PATCH] selftest: fix kselftest-merge depend on
 'RUNTIME_TESTING_MENU'
In-Reply-To: <CADYN=9KgBp0+iGDL8x774UUadyo54Za4ESLPk2GUfqFz+7W02Q@mail.gmail.com>
References: <20180222115307.15063-1-zongbox@gmail.com>
 <CADYN=9KgBp0+iGDL8x774UUadyo54Za4ESLPk2GUfqFz+7W02Q@mail.gmail.com>
Message-ID:
 <CA+ZOyajDWFr9dG70uOMoreA=FALoKJCYsFRiUAkZC-a3BuojZg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180223070525.tO0JvL9IFhVSVBhpE9Gkb7MDMoSRTer2A_SoQ7jkSh0@z>

2018-02-23 3:57 GMT+08:00 Anders Roxell <anders.roxell at linaro.org>:
> On 22 February 2018@12:53, Zong Li <zongbox@gmail.com> wrote:
>> Since the 'commit d3deafaa8b5c ("lib/: make RUNTIME_TESTS a menuconfig
>> to ease disabling it all")', the make kselftest-merge cannot merge the
>> config dependencies of kselftest to the existing .config file.
>>
>> These config dependencies of kselftest need to enable the
>> 'CONFIG_RUNTIME_TESTING_MENU=y' at the same time.
>
> Is this patch needed when patch sha 'f29c79906064 ("lib/Kconfig.debug: enable
> RUNTIME_TESTING_MENU")' find its way into the kernel ?
> I think it's in linux-next now.

Thanks. The patch sha 'f29c79906064 ("lib/Kconfig.debug: enable
RUNTIME_TESTING_MENU")' can resolve the make kselftest-merge
on default situation, but I think the kselftest-merge should resolve
the dependencies
without the prerequisite, it should enable the 'RUNTIME_TESTING_MENU'
when merging
the config of some selftests if RUNTIME_TESTING_MENU is not set.

Best Regards,
Zong Li
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

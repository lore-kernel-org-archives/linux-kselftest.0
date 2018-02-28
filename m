From: zongbox@gmail.com (Zong Li)
Date: Wed, 28 Feb 2018 17:13:01 +0800
Subject: [PATCH] selftest: fix kselftest-merge depend on
 'RUNTIME_TESTING_MENU'
In-Reply-To: <CADYN=9JgNRqs5ghv9_UU0MEEKX_kg+L2KXs3c-tXpw1m0dnxDw@mail.gmail.com>
References: <20180222115307.15063-1-zongbox@gmail.com>
 <CADYN=9KgBp0+iGDL8x774UUadyo54Za4ESLPk2GUfqFz+7W02Q@mail.gmail.com>
 <CA+ZOyajDWFr9dG70uOMoreA=FALoKJCYsFRiUAkZC-a3BuojZg@mail.gmail.com>
 <CADYN=9JgNRqs5ghv9_UU0MEEKX_kg+L2KXs3c-tXpw1m0dnxDw@mail.gmail.com>
Message-ID:
 <CA+ZOyagCaxyrgTJ4uTqKC3zQgCG97qX+XmfQaXLUhk=MFOJyDA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180228091301.2VfDR86hkR7VSY5aBdLDH0lUoXH8z_AbNniDT1aWD2Q@z>

2018-02-28 6:32 GMT+08:00 Anders Roxell <anders.roxell at linaro.org>:
>
> On 23 February 2018@08:05, Zong Li <zongbox@gmail.com> wrote:
> > 2018-02-23 3:57 GMT+08:00 Anders Roxell <anders.roxell at linaro.org>:
> >> On 22 February 2018@12:53, Zong Li <zongbox@gmail.com> wrote:
> >>> Since the 'commit d3deafaa8b5c ("lib/: make RUNTIME_TESTS a menuconfig
> >>> to ease disabling it all")', the make kselftest-merge cannot merge the
> >>> config dependencies of kselftest to the existing .config file.
> >>>
> >>> These config dependencies of kselftest need to enable the
> >>> 'CONFIG_RUNTIME_TESTING_MENU=y' at the same time.
> >>
> >> Is this patch needed when patch sha 'f29c79906064 ("lib/Kconfig.debug: enable
> >> RUNTIME_TESTING_MENU")' find its way into the kernel ?
> >> I think it's in linux-next now.
> >
> > Thanks. The patch sha 'f29c79906064 ("lib/Kconfig.debug: enable
> > RUNTIME_TESTING_MENU")' can resolve the make kselftest-merge
> > on default situation, but I think the kselftest-merge should resolve
> > the dependencies
> > without the prerequisite, it should enable the 'RUNTIME_TESTING_MENU'
> > when merging
> > the config of some selftests if RUNTIME_TESTING_MENU is not set.
>
> I see your point, but should the be enabled in a common place that
> gets included per
> default if running kselftest-merge and not in all config fragments?
>
> Cheers,
> Anders

I agree with you. It is better that the config fragments of each
selftests is responsible for
enabling the specific configs they needed only.
Thanks for your reply.

Best Regard,
Zong Li
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

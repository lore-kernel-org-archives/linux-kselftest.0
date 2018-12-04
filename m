From: brendanhiggins@google.com (Brendan Higgins)
Date: Mon, 3 Dec 2018 16:13:58 -0800
Subject: [RFC v3 17/19] of: unittest: migrate tests to run on KUnit
In-Reply-To: <18814973-8f0a-4647-a097-fcc3dc0b3cd3@infradead.org>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <20181128193636.254378-18-brendanhiggins@google.com>
 <CAL_Jsq+09Kx7yMBC_Jw45QGmk6U_fp4N6HOZDwYrM4tWw+_dOA@mail.gmail.com>
 <18814973-8f0a-4647-a097-fcc3dc0b3cd3@infradead.org>
Message-ID:
 <CAFd5g475RK9v9X4qxmXwuHiPMOs05WrZAw6EJWNdVoAHQWguFQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181204001358.VwKJOXVYluCZkmBq4Rfy7NXXRwNJf5aQw5CtQDUywJY@z>

On Thu, Nov 29, 2018@4:40 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 11/28/18 12:56 PM, Rob Herring wrote:
> >> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> >> index ad3fcad4d75b8..f309399deac20 100644
> >> --- a/drivers/of/Kconfig
> >> +++ b/drivers/of/Kconfig
> >> @@ -15,6 +15,7 @@ if OF
> >>  config OF_UNITTEST
> >>         bool "Device Tree runtime unit tests"
> >>         depends on !SPARC
> >> +       depends on KUNIT
> > Unless KUNIT has depends, better to be a select here.
>
> That's just style or taste.  I would prefer to use depends
> instead of select, but that's also just my preference.

I prefer depends too, but Rob is the maintainer here.

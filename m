From: robh@kernel.org (Rob Herring)
Date: Tue, 4 Dec 2018 07:40:57 -0600
Subject: [RFC v3 17/19] of: unittest: migrate tests to run on KUnit
In-Reply-To: <CAFd5g475RK9v9X4qxmXwuHiPMOs05WrZAw6EJWNdVoAHQWguFQ@mail.gmail.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <20181128193636.254378-18-brendanhiggins@google.com>
 <CAL_Jsq+09Kx7yMBC_Jw45QGmk6U_fp4N6HOZDwYrM4tWw+_dOA@mail.gmail.com>
 <18814973-8f0a-4647-a097-fcc3dc0b3cd3@infradead.org>
 <CAFd5g475RK9v9X4qxmXwuHiPMOs05WrZAw6EJWNdVoAHQWguFQ@mail.gmail.com>
Message-ID:
 <CAL_JsqL_PivQbrJFEusdKAy-2EQtKL3OHbmyYSK9bzuTOQegqA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181204134057.5WLEtFYzG8Xq0hSKdT37r2ZbG9yh8QHZen27UlMCFr8@z>

On Mon, Dec 3, 2018 at 6:14 PM Brendan Higgins
<brendanhiggins@google.com> wrote:
>
> On Thu, Nov 29, 2018@4:40 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> >
> > On 11/28/18 12:56 PM, Rob Herring wrote:
> > >> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> > >> index ad3fcad4d75b8..f309399deac20 100644
> > >> --- a/drivers/of/Kconfig
> > >> +++ b/drivers/of/Kconfig
> > >> @@ -15,6 +15,7 @@ if OF
> > >>  config OF_UNITTEST
> > >>         bool "Device Tree runtime unit tests"
> > >>         depends on !SPARC
> > >> +       depends on KUNIT
> > > Unless KUNIT has depends, better to be a select here.
> >
> > That's just style or taste.  I would prefer to use depends
> > instead of select, but that's also just my preference.
>
> I prefer depends too, but Rob is the maintainer here.

Well, we should be consistent, not the follow the whims of each maintainer.

Rob

From: keescook@chromium.org (Kees Cook)
Date: Tue, 16 Apr 2019 18:16:23 -0500
Subject: [PATCH 1/6] selftests: Extract single-test shell logic from lib.mk
In-Reply-To: <714c1bf0-63a5-9cec-ccd6-7f3abb020574@kernel.org>
References: <20190409235556.3967-1-keescook@chromium.org>
 <20190409235556.3967-2-keescook@chromium.org>
 <714c1bf0-63a5-9cec-ccd6-7f3abb020574@kernel.org>
Message-ID:
 <CAGXu5jJOG9Or_==aa0AMtv6n2=_MT_etLX7OCm22NpzT6d7W4g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190416231623.AXHbI01SI9iXSTQIiObjQrPzTUjcEwLE4ClnGdzLCGQ@z>

On Tue, Apr 16, 2019@6:11 PM shuah <shuah@kernel.org> wrote:
>
> Hi Kees,
>
> Thanks for the patch.
>
> On 4/9/19 5:55 PM, Kees Cook wrote:
> > In order to improve the reusability of the kselftest test running logic,
> > this extracts the single-test logic from lib.mk into kselftest/runner.sh
> > which lib.mk can call directly. No changes in output.
> >
> > As part of the change, this removes the unused "summary" Makefile variable
> > (and tests). However, future merging with the "emit_tests" target needs
> > to be able to redirect output, so a new "logfile" variable is introduced.
>
> Shouldn't the selftests/Makefile need update for "summary" removal??
>

I didn't see anything using "summary" except as a --summary argument
to the run_kselftests.sh script. Maybe I missed it?

> >
> > Signed-off-by: Kees Cook <keescook at chromium.org>
> > ---
> >   tools/testing/selftests/.gitignore          |  1 -
> >   tools/testing/selftests/kselftest/runner.sh | 31 +++++++++++++++++++
> >   tools/testing/selftests/lib.mk              | 33 ++-------------------
> >   3 files changed, 34 insertions(+), 31 deletions(-)
> >   create mode 100644 tools/testing/selftests/kselftest/runner.sh
> >
> > diff --git a/tools/testing/selftests/.gitignore b/tools/testing/selftests/.gitignore
> > index 91750352459d..8059ce834247 100644
> > --- a/tools/testing/selftests/.gitignore
> > +++ b/tools/testing/selftests/.gitignore
> > @@ -1,4 +1,3 @@
> > -kselftest
> >   gpiogpio-event-mon
> >   gpiogpio-hammer
> >   gpioinclude/
>
> Please don't include this .gitignore change here. These are generated
> in tools/gpio and this .gitignore isn't the right place for them.

This change is only removing the "kselftest" entry, for which the
target is long gone. Since I was adding a directory by that name, I
needed to remove it from the .gitignore file. I have nothing to do
with the gpio stuff. :)

Thanks for looking this over!

-- 
Kees Cook

From: keescook@chromium.org (Kees Cook)
Date: Tue, 2 Apr 2019 14:51:41 -0700
Subject: [PATCH v3 3/7] kselftest/lib: Use new shell runner to define tests
In-Reply-To: <CAGXu5jJHKS=cghJDRwhTAEXg2yEOKjxGxKinDWHv3X4fZ5oxfQ@mail.gmail.com>
References: <20190306214226.14598-1-tobin@kernel.org>
 <20190306214226.14598-4-tobin@kernel.org>
 <CAGXu5jJHKS=cghJDRwhTAEXg2yEOKjxGxKinDWHv3X4fZ5oxfQ@mail.gmail.com>
Message-ID:
 <CAGXu5jL46pxXg8S_ywKmhc0A92qZSgTSH+96YXvuex5tqW20JA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190402215141.V12Aqb257bUG5YUSI6KXaykH9cnC9qUHy97Vdxu3Y8E@z>

On Tue, Apr 2, 2019@2:45 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Wed, Mar 6, 2019@1:43 PM Tobin C. Harding <tobin@kernel.org> wrote:
> > [...]
> > diff --git a/tools/testing/selftests/lib/prime_numbers.sh b/tools/testing/selftests/lib/prime_numbers.sh
> > index 78e7483c8d60..6f782386d897 100755
> > --- a/tools/testing/selftests/lib/prime_numbers.sh
> > +++ b/tools/testing/selftests/lib/prime_numbers.sh
> > @@ -2,18 +2,17 @@
> > [...]
> > -if /sbin/modprobe -q prime_numbers selftest=65536; then
>
> Here it is! This conversion loses the "selftest=..." argument to modprobe.
>
> And I think all of these files could be reduced to a single script
> that did something like:
>
> . $path/kselftest_module.sh
>
> run "strscpy" test_strscpy
> run "bitmap" test_bitmap
> run "prime numbers" prime_numbers selftest=65536
>
> and kselftest_module.sh could define a "trap {...} EXIT" to perform
> the reporting of everything that got run.

Though I guess if we want separate scripts per module, ignore me on
this part. :)

-- 
Kees Cook

From: keescook at chromium.org (Kees Cook)
Date: Tue, 23 Apr 2019 19:43:58 -0700
Subject: [PATCH 1/6] selftests: Extract single-test shell logic from lib.mk
In-Reply-To: <ca4605d5-9423-542e-5a10-2b681293baf9@kernel.org>
References: <20190409235556.3967-1-keescook@chromium.org>
 <20190409235556.3967-2-keescook@chromium.org>
 <714c1bf0-63a5-9cec-ccd6-7f3abb020574@kernel.org>
 <CAGXu5jJOG9Or_==aa0AMtv6n2=_MT_etLX7OCm22NpzT6d7W4g@mail.gmail.com>
 <6610ef83-b3e0-28b5-b976-5a5f68ca492d@kernel.org>
 <CAGXu5jKLmX5wX1Qb0hYkn1oBhWNgJUYARoEn2JmioJUn5hiW4A@mail.gmail.com>
 <ca4605d5-9423-542e-5a10-2b681293baf9@kernel.org>
Message-ID: <CAGXu5jLgaU-Q1hxn0aSpbDsAbHNxmriCQ5inSajUKUUez4PpLg@mail.gmail.com>

On Tue, Apr 23, 2019 at 3:47 PM shuah <shuah at kernel.org> wrote:
> You can see it by running
>
> make summary=1 TARGETS="breakpoints" kselftest

Okay, thanks for this! I'll give it a spin.

> with and without your first patch. Ca you fix the regression and send
> me revised patches. Sorry, I didn't get back to you sooner. A few bugs
> I found kept me busy.
>
> While I was testing your patch series, I found test build failures due
> to circular dependency that needed fixing. In addition, the same
> headers_install dependency, also broke O= and KBUILD_OUTPUT builds
> and fixed those as well. Long story short, these fixes might conflict
> with your work.

I can rebase the series -- which tree should I look at? (Is it all in
-next already?)

Thanks!

-- 
Kees Cook

From: keescook at chromium.org (Kees Cook)
Date: Tue, 2 Apr 2019 14:37:57 -0700
Subject: [PATCH v3 0/7] lib/string: Add strscpy_pad() function
In-Reply-To: <20190306214226.14598-1-tobin@kernel.org>
References: <20190306214226.14598-1-tobin@kernel.org>
Message-ID: <CAGXu5jJeFOBBiofjG6_rqbf+_0fbKC46pzyfoACWt+NBg-bXtg@mail.gmail.com>

On Wed, Mar 6, 2019 at 1:43 PM Tobin C. Harding <tobin at kernel.org> wrote:
> This set makes an attempt at adding a framework to kselftest for writing
> kernel test modules.  It also adds a script for use in creating script
> test runners for kselftest.  My macro-foo is not great, all criticism
> and suggestions very much appreciated.  The design is based on test
> modules lib/test_printf.c, lib/test_bitmap.c, lib/test_xarray.c.

Hi Shuah,

The bulk of this series is in the kselftests. Would you be willing to
carry this series?

I think it might be able to use a v4 just to clean up the
script-finding logic, but I might be entirely missing something about
the best way to do it.

Thanks!

-Kees

-- 
Kees Cook

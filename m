From: me at tobin.cc (Tobin C. Harding)
Date: Wed, 3 Apr 2019 11:23:55 +1100
Subject: [PATCH v3.1] selftests: Clean up module testing shell script
In-Reply-To: <20190402222610.GA15100@beast>
References: <20190402222610.GA15100@beast>
Message-ID: <20190403002355.GA29296@eros.localdomain>

On Tue, Apr 02, 2019 at 03:26:10PM -0700, Kees Cook wrote:
> This adjusts kselftest_module.sh to take an option "args" argument for
> modprobe arguments, removes bash-isms (since some system's /bin/sh may
> not be bash), and refactors the lib/ scripts into a shorter calling
> convention.
> 
> Signed-off-by: Kees Cook <keescook at chromium.org>
> ---
> This is my suggested clean-up for the module testing script for the
> strscpy_pad() series...

You are seriously at risk of being the most awesome code reviewer on
LKML.  Beer is on me next time I see you.

I will roll this into a v4 for the strscpy_pad() set.  Would you like a
Co-developed-by tag or just a mention in the commit log?

thanks,
Tobin.

From: keescook@chromium.org (Kees Cook)
Date: Wed, 3 Apr 2019 08:28:16 -0700
Subject: [PATCH v3.1] selftests: Clean up module testing shell script
In-Reply-To: <20190403002355.GA29296@eros.localdomain>
References: <20190402222610.GA15100@beast>
 <20190403002355.GA29296@eros.localdomain>
Message-ID:
 <CAGXu5jL16hn=_uY1tojAGqEi=a_nU=ScUZkTVO9_nbWnS+2wSw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190403152816.S0gtZ0PIl9S6uiCmmuTCH1Cth9xPozn2qDEtb0BS5So@z>

On Tue, Apr 2, 2019@5:24 PM Tobin C. Harding <me@tobin.cc> wrote:
>
> On Tue, Apr 02, 2019@03:26:10PM -0700, Kees Cook wrote:
> > This adjusts kselftest_module.sh to take an option "args" argument for
> > modprobe arguments, removes bash-isms (since some system's /bin/sh may
> > not be bash), and refactors the lib/ scripts into a shorter calling
> > convention.
> >
> > Signed-off-by: Kees Cook <keescook at chromium.org>
> > ---
> > This is my suggested clean-up for the module testing script for the
> > strscpy_pad() series...
>
> You are seriously at risk of being the most awesome code reviewer on
> LKML.  Beer is on me next time I see you.

And slowest! ;)

> I will roll this into a v4 for the strscpy_pad() set.  Would you like a
> Co-developed-by tag or just a mention in the commit log?

I'm happy either way. I really just tweaked it; maybe commit log?

-- 
Kees Cook

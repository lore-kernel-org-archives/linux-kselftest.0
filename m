From: brendanhiggins at google.com (Brendan Higgins)
Date: Fri, 10 May 2019 03:27:33 -0700
Subject: [PATCH v2 06/17] kbuild: enable building KUnit
In-Reply-To: <CAK7LNAQ+SRMn8UFjW1dZv_TrL0qjD2v2S=rXgtUpiA-urr1DDA@mail.gmail.com>
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-7-brendanhiggins@google.com>
 <CAK7LNAQ+SRMn8UFjW1dZv_TrL0qjD2v2S=rXgtUpiA-urr1DDA@mail.gmail.com>
Message-ID: <CAFd5g47BNZ0gRz4SXb37XjyXF_LyNZrSmoqDbzaaCUrTg3O7Yg@mail.gmail.com>

> On Thu, May 2, 2019 at 8:03 AM Brendan Higgins
> <brendanhiggins at google.com> wrote:
> >
> > Add KUnit to root Kconfig and Makefile allowing it to actually be built.
> >
> > Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
>
> You need to make sure
> to not break git-bisect'abililty.
>
>
> With this commit, I see build error.
>
>   CC      kunit/test.o
> kunit/test.c:11:10: fatal error: os.h: No such file or directory
>  #include <os.h>
>           ^~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.build;279: kunit/test.o] Error 1
> make: *** [Makefile;1763: kunit/] Error 2

Nice catch! That header shouldn't even be in there.

Sorry about that. I will have it fixed in the next revision.

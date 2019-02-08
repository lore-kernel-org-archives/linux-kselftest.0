From: murphyt7 at tcd.ie (Tom Murphy)
Date: Fri, 8 Feb 2019 14:31:07 +0000
Subject: [PATCH] fix dma-buf/udmabuf selftest
In-Reply-To: <CAMuHMdWX=5CE=vhazBSOEbzJYyAwiK2PSDryCrA67yXRVb0m3w@mail.gmail.com>
References: <20181127103312.19368-1-murphyt7@tcd.ie>
 <CAMuHMdWX=5CE=vhazBSOEbzJYyAwiK2PSDryCrA67yXRVb0m3w@mail.gmail.com>
Message-ID: <CALQxJusnECzqS+Hn-TgfJnXKw--MbfB8DizrjYanejfDdA=gRA@mail.gmail.com>

> However, we need <linux/fcntl.h> for F_ADD_SEALS, F_SEAL_SHRINK.
>
> Including both leads to lots of redefinition warnings.
>
> Can we fix that?

I still haven't looked at this and probably won't get a chance anytime soon.
linux/tools/testing/selftests/memfd/fuse_test.c also suffers from this
(it needs the F_ADD_SEALS too) so that should also be fixed if anyone
gets a chance




On Wed, 9 Jan 2019 at 10:44, Geert Uytterhoeven <geert at linux-m68k.org> wrote:
>
> Hi Tom,
>
> On Tue, Nov 27, 2018 at 7:53 PM Tom Murphy <murphyt7 at tcd.ie> wrote:
> > This patch fixes the udmabuf selftest. Currently the selftest is broken.
> > I fixed the selftest by setting the F_SEAL_SHRINK seal on the memfd
> > file descriptor which is required by udmabuf and added the test to
> > the selftest Makefile.
> >
> > Signed-off-by: Tom Murphy <murphyt7 at tcd.ie>
>
> This is now commit 6edf2e3710f4ef25 ("fix dma-buf/udmabuf selftest").
>
> > --- a/tools/testing/selftests/drivers/dma-buf/udmabuf.c
> > +++ b/tools/testing/selftests/drivers/dma-buf/udmabuf.c
> > @@ -4,7 +4,7 @@
> >  #include <unistd.h>
> >  #include <string.h>
> >  #include <errno.h>
> > -#include <fcntl.h>
> > +#include <linux/fcntl.h>
>
> Not including <fcntl.h> means we get
>
> udmabuf.c:30:10: warning: implicit declaration of function ‘open’; did
> you mean ‘popen’? [-Wimplicit-function-declaration]
>   devfd = open("/dev/udmabuf", O_RDWR);
> udmabuf.c:42:8: warning: implicit declaration of function ‘fcntl’; did
> you mean ‘fcvt’? [-Wimplicit-function-declaration]
>    ret = fcntl(memfd, F_ADD_SEALS, F_SEAL_SHRINK);
>
> However, we need <linux/fcntl.h> for F_ADD_SEALS, F_SEAL_SHRINK.
>
> Including both leads to lots of redefinition warnings.
>
> Can we fix that?
>
> >  #include <malloc.h>
> >
> >  #include <sys/ioctl.h>
> > @@ -33,12 +33,19 @@ int main(int argc, char *argv[])
> >                 exit(77);
> >         }
> >
> > -       memfd = memfd_create("udmabuf-test", MFD_CLOEXEC);
> > +       memfd = memfd_create("udmabuf-test", MFD_ALLOW_SEALING);
> >         if (memfd < 0) {
> >                 printf("%s: [skip,no-memfd]\n", TEST_PREFIX);
> >                 exit(77);
> >         }
> >
> > +       ret = fcntl(memfd, F_ADD_SEALS, F_SEAL_SHRINK);
> > +       if (ret < 0) {
> > +               printf("%s: [skip,fcntl-add-seals]\n", TEST_PREFIX);
> > +               exit(77);
> > +       }
> > +
> > +
> >         size = getpagesize() * NUM_PAGES;
> >         ret = ftruncate(memfd, size);
> >         if (ret == -1) {
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert at linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

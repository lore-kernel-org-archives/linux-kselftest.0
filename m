From: alakesh.haloi at gmail.com (Alakesh Haloi)
Date: Tue, 28 May 2019 19:40:51 +0000
Subject: [PATCH] selftests: bpf: fix compiler warning
In-Reply-To: <CAPhsuW7H=w_UMyu5Q5p5+MGogkQ7+7X7sS=vJTiR=+JJy0KuTg@mail.gmail.com>
References: <20190524003038.GA69487@ip-172-31-44-144.us-west-2.compute.internal>
 <CAPhsuW7H=w_UMyu5Q5p5+MGogkQ7+7X7sS=vJTiR=+JJy0KuTg@mail.gmail.com>
Message-ID: <20190528194051.GA7103@ip-172-31-44-144.us-west-2.compute.internal>

On Tue, May 28, 2019 at 09:45:14AM -0700, Song Liu wrote:
> On Thu, May 23, 2019 at 5:31 PM Alakesh Haloi <alakesh.haloi at gmail.com> wrote:
> >
> > Add missing header file following compiler warning
> >
> > prog_tests/flow_dissector.c: In function ‘tx_tap’:
> > prog_tests/flow_dissector.c:175:9: warning: implicit declaration of function ‘writev’; did you mean ‘write’? [-Wimplicit-function-declaration]
> >   return writev(fd, iov, ARRAY_SIZE(iov));
> >          ^~~~~~
> >          write
> >
> > Signed-off-by: Alakesh Haloi <alakesh.haloi at gmail.com>
> 
> The patch looks good. Please add a "Fixes" tag, so the fix
> can be back ported properly.
> 
> Also, please specify which tree the patch should be applied
> with [PATCH bpf] or [PATCH bpf-next].
> 
> Thanks,
> Song
> 

Thanks for reviewing the patch. My apologies for not following the
rules. I have sent an updated patch after adding Fixes: tag and
modifying the subject to reflect that it is for bpf tree.
The updated patch is here https://lkml.org/lkml/2019/5/28/904

Thanks
Alakesh
> 
> 
> 
> > ---
> >  tools/testing/selftests/bpf/prog_tests/flow_dissector.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/tools/testing/selftests/bpf/prog_tests/flow_dissector.c b/tools/testing/selftests/bpf/prog_tests/flow_dissector.c
> > index fbd1d88a6095..c938283ac232 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/flow_dissector.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/flow_dissector.c
> > @@ -3,6 +3,7 @@
> >  #include <error.h>
> >  #include <linux/if.h>
> >  #include <linux/if_tun.h>
> > +#include <sys/uio.h>
> >
> >  #define CHECK_FLOW_KEYS(desc, got, expected)                           \
> >         CHECK_ATTR(memcmp(&got, &expected, sizeof(got)) != 0,           \
> > --
> > 2.17.1
> >

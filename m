From: jrdr.linux@gmail.com (Souptick Joarder)
Date: Wed, 6 Mar 2019 23:36:38 +0530
Subject: [PATCH] tools: testing: selftests: Remove duplicate headers
In-Reply-To: <CAFqt6zYqa6aCAcs51AdePtBSL58hMa1BSA87ZMLbwUJA=rWNLA@mail.gmail.com>
References: <20190223070901.GA10274@jordon-HP-15-Notebook-PC>
 <87tvgr1fr4.fsf@concordia.ellerman.id.au>
 <CAFqt6zY0HV7E+_6_s5A3eG+jEj+4hgQnAgJQm-Pc1gyX4Vnbpg@mail.gmail.com>
 <CAFqt6zYqa6aCAcs51AdePtBSL58hMa1BSA87ZMLbwUJA=rWNLA@mail.gmail.com>
Message-ID:
 <CAFqt6zZcoe1fZF__h=zdKaWC7MHt4nVELCV07RspWjntHA94hg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190306180638.aIf4GLu9E5c_RoRKGLPNhJIorVfm7sVlT2qCCrCYKoU@z>

On Mon, Mar 4, 2019@4:19 PM Souptick Joarder <jrdr.linux@gmail.com> wrote:
>
> On Tue, Feb 26, 2019@10:59 AM Souptick Joarder <jrdr.linux@gmail.com> wrote:
> >
> > On Tue, Feb 26, 2019@7:18 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
> > >
> > > Souptick Joarder <jrdr.linux at gmail.com> writes:
> > > > Remove duplicate headers which are included twice.
> > > >
> > > > Signed-off-by: Sabyasachi Gupta <sabyasachi.linux at gmail.com>
> > > > Signed-off-by: Souptick Joarder <jrdr.linux at gmail.com>
> > > > ---
> > > ...
> > > >  tools/testing/selftests/powerpc/pmu/ebb/fork_cleanup_test.c | 1 -
> > >
> > > I took this hunk via the powerpc tree.
> >
> > How about taking this entirely through a single tree ?
> > or Shall I send these changes in different patches ?
>
> If no comment, can we get this patch in queue for 5.1 ?

I will drop this patch as we have submitted these changes in
different patches. ( Except the one picked by Michael).

>
> >
> > >
> > > > diff --git a/tools/testing/selftests/powerpc/pmu/ebb/fork_cleanup_test.c b/tools/testing/selftests/powerpc/pmu/ebb/fork_cleanup_test.c
> > > > index 167135b..af1b802 100644
> > > > --- a/tools/testing/selftests/powerpc/pmu/ebb/fork_cleanup_test.c
> > > > +++ b/tools/testing/selftests/powerpc/pmu/ebb/fork_cleanup_test.c
> > > > @@ -11,7 +11,6 @@
> > > >  #include <sys/wait.h>
> > > >  #include <unistd.h>
> > > >  #include <setjmp.h>
> > > > -#include <signal.h>
> > > >
> > > >  #include "ebb.h"
> > >
> > >
> > > cheers

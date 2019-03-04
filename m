From: jrdr.linux@gmail.com (Souptick Joarder)
Date: Mon, 4 Mar 2019 16:19:29 +0530
Subject: [PATCH] tools: testing: selftests: Remove duplicate headers
In-Reply-To: <CAFqt6zY0HV7E+_6_s5A3eG+jEj+4hgQnAgJQm-Pc1gyX4Vnbpg@mail.gmail.com>
References: <20190223070901.GA10274@jordon-HP-15-Notebook-PC>
 <87tvgr1fr4.fsf@concordia.ellerman.id.au>
 <CAFqt6zY0HV7E+_6_s5A3eG+jEj+4hgQnAgJQm-Pc1gyX4Vnbpg@mail.gmail.com>
Message-ID:
 <CAFqt6zYqa6aCAcs51AdePtBSL58hMa1BSA87ZMLbwUJA=rWNLA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190304104929.qq9XXWD4FrhC_dIU2k_3eEZioEkCYSKQyCQ8NrMse88@z>

On Tue, Feb 26, 2019@10:59 AM Souptick Joarder <jrdr.linux@gmail.com> wrote:
>
> On Tue, Feb 26, 2019@7:18 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
> >
> > Souptick Joarder <jrdr.linux at gmail.com> writes:
> > > Remove duplicate headers which are included twice.
> > >
> > > Signed-off-by: Sabyasachi Gupta <sabyasachi.linux at gmail.com>
> > > Signed-off-by: Souptick Joarder <jrdr.linux at gmail.com>
> > > ---
> > ...
> > >  tools/testing/selftests/powerpc/pmu/ebb/fork_cleanup_test.c | 1 -
> >
> > I took this hunk via the powerpc tree.
>
> How about taking this entirely through a single tree ?
> or Shall I send these changes in different patches ?

If no comment, can we get this patch in queue for 5.1 ?

>
> >
> > > diff --git a/tools/testing/selftests/powerpc/pmu/ebb/fork_cleanup_test.c b/tools/testing/selftests/powerpc/pmu/ebb/fork_cleanup_test.c
> > > index 167135b..af1b802 100644
> > > --- a/tools/testing/selftests/powerpc/pmu/ebb/fork_cleanup_test.c
> > > +++ b/tools/testing/selftests/powerpc/pmu/ebb/fork_cleanup_test.c
> > > @@ -11,7 +11,6 @@
> > >  #include <sys/wait.h>
> > >  #include <unistd.h>
> > >  #include <setjmp.h>
> > > -#include <signal.h>
> > >
> > >  #include "ebb.h"
> >
> >
> > cheers

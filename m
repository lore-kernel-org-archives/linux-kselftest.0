From: jrdr.linux at gmail.com (Souptick Joarder)
Date: Tue, 26 Feb 2019 10:59:50 +0530
Subject: [PATCH] tools: testing: selftests: Remove duplicate headers
In-Reply-To: <87tvgr1fr4.fsf@concordia.ellerman.id.au>
References: <20190223070901.GA10274@jordon-HP-15-Notebook-PC>
 <87tvgr1fr4.fsf@concordia.ellerman.id.au>
Message-ID: <CAFqt6zY0HV7E+_6_s5A3eG+jEj+4hgQnAgJQm-Pc1gyX4Vnbpg@mail.gmail.com>

On Tue, Feb 26, 2019 at 7:18 AM Michael Ellerman <mpe at ellerman.id.au> wrote:
>
> Souptick Joarder <jrdr.linux at gmail.com> writes:
> > Remove duplicate headers which are included twice.
> >
> > Signed-off-by: Sabyasachi Gupta <sabyasachi.linux at gmail.com>
> > Signed-off-by: Souptick Joarder <jrdr.linux at gmail.com>
> > ---
> ...
> >  tools/testing/selftests/powerpc/pmu/ebb/fork_cleanup_test.c | 1 -
>
> I took this hunk via the powerpc tree.

How about taking this entirely through a single tree ?
or Shall I send these changes in different patches ?

>
> > diff --git a/tools/testing/selftests/powerpc/pmu/ebb/fork_cleanup_test.c b/tools/testing/selftests/powerpc/pmu/ebb/fork_cleanup_test.c
> > index 167135b..af1b802 100644
> > --- a/tools/testing/selftests/powerpc/pmu/ebb/fork_cleanup_test.c
> > +++ b/tools/testing/selftests/powerpc/pmu/ebb/fork_cleanup_test.c
> > @@ -11,7 +11,6 @@
> >  #include <sys/wait.h>
> >  #include <unistd.h>
> >  #include <setjmp.h>
> > -#include <signal.h>
> >
> >  #include "ebb.h"
>
>
> cheers

From: alakesh.haloi@gmail.com (Alakesh Haloi)
Date: Fri, 10 May 2019 00:00:30 +0000
Subject: [PATCH] selftests/bpf: Fix compile warning in bpf selftest
In-Reply-To: <CAADnVQ+e6TW9cH6yDmRSG5pRHXJiZajcx_q9SoPQi1keDROh-g@mail.gmail.com>
References: <20190507231224.GA3787@ip-172-31-29-54.us-west-2.compute.internal>
 <CAADnVQ+e6TW9cH6yDmRSG5pRHXJiZajcx_q9SoPQi1keDROh-g@mail.gmail.com>
Message-ID:
 <20190510000030.GA81841@ip-172-31-29-54.us-west-2.compute.internal>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190510000030.cXRotZAnw6u2AallBKX2HNYAq6vYeA5DiyfBQnUH1lA@z>

On Thu, May 09, 2019@01:51:54PM -0700, Alexei Starovoitov wrote:
> On Tue, May 7, 2019@4:12 PM Alakesh Haloi <alakesh.haloi@gmail.com> wrote:
> >
> > This fixes the following compile time warning
> >
> > flow_dissector_load.c: In function ‘detach_program’:
> > flow_dissector_load.c:55:19: warning: format not a string literal and no format arguments [-Wformat-security]
> >    error(1, errno, command);
> >                    ^~~~~~~
> > Signed-off-by: Alakesh Haloi <alakesh.haloi at gmail.com>
> > ---
> >  tools/testing/selftests/bpf/flow_dissector_load.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tools/testing/selftests/bpf/flow_dissector_load.c b/tools/testing/selftests/bpf/flow_dissector_load.c
> > index 77cafa66d048..7136ab9ffa73 100644
> > --- a/tools/testing/selftests/bpf/flow_dissector_load.c
> > +++ b/tools/testing/selftests/bpf/flow_dissector_load.c
> > @@ -52,7 +52,7 @@ static void detach_program(void)
> >         sprintf(command, "rm -r %s", cfg_pin_path);
> >         ret = system(command);
> >         if (ret)
> > -               error(1, errno, command);
> > +               error(1, errno, "%s", command);
> >  }
> 
> it was fixed month ago.
The warning is seen in mainline. I did not try bpf tree. Looks like it
is fixed there. 

Thanks
-Alakesh

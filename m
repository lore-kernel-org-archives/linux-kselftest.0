From: willemdebruijn.kernel at gmail.com (Willem de Bruijn)
Date: Fri, 24 May 2019 01:02:20 -0400
Subject: [PATCH net 4/4] net/udpgso_bench_tx: audit error queue
In-Reply-To: <D68C643B-C6A4-4EC5-8E4F-368BDE03760B@appneta.com>
References: <20190523210651.80902-1-fklassen@appneta.com>
 <20190523210651.80902-5-fklassen@appneta.com>
 <CAF=yD-KBNLr5KY-YQ1KMmZGCpYNefSJKaJkZNOwd8nRiedpQtA@mail.gmail.com>
 <D68C643B-C6A4-4EC5-8E4F-368BDE03760B@appneta.com>
Message-ID: <CAF=yD-JGxrAbv0Cxcn1O20mXY28J1PnpWsHRqcRPO97advm10A@mail.gmail.com>

On Thu, May 23, 2019 at 9:27 PM Fred Klassen <fklassen at appneta.com> wrote:
>
> Willem, this is only my 2nd patch, and my last one was a one liner.
> I’ll try to work through this, but let me know if I am doing a rookie
> mistake (learning curve and all).

Not at all. The fix makes perfect sense.

The test patches 2 and 4 are not fixes, so are better suited to to
net-next. Perhaps the changes to the test can also be more concise,
just the minimal changes needed to demonstrate the bug and fix.

> >>                        tss = (struct my_scm_timestamping *)CMSG_DATA(cmsg);
> >> -                       fprintf(stderr, "tx timestamp = %lu.%09lu\n",
> >> -                               tss->ts[i].tv_sec, tss->ts[i].tv_nsec);
> >> +                       if (tss->ts[i].tv_sec == 0)
> >> +                               stat_tx_ts_errors++;
> >> +                       if (cfg_verbose)
> >> +                               fprintf(stderr, "tx timestamp = %lu.%09lu\n",
> >> +                                       tss->ts[i].tv_sec, tss->ts[i].tv_nsec);
> >
> > changes unrelated to this feature?
>
> I’ll remove. Do you think that I should pull out any messages related
> to “cfg_verbose”?

This change did not seem relevant to the main feature of the patch.

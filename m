From: willemdebruijn.kernel at gmail.com (Willem de Bruijn)
Date: Tue, 28 May 2019 13:07:02 -0400
Subject: [PATCH net 4/4] net/udpgso_bench_tx: audit error queue
In-Reply-To: <9811659B-6D5A-4C4F-9CF8-735E9CA6DE4E@appneta.com>
References: <20190523210651.80902-1-fklassen@appneta.com>
 <20190523210651.80902-5-fklassen@appneta.com>
 <CAF=yD-KBNLr5KY-YQ1KMmZGCpYNefSJKaJkZNOwd8nRiedpQtA@mail.gmail.com>
 <879E5DA6-3A4F-4CE1-9DA5-480EE30109DE@appneta.com>
 <CAF=yD-LQT7=4vvMwMa96_SFuUd5GywMoae7hGi9n6rQeuhhxuQ@mail.gmail.com>
 <5BB184F2-6C20-416B-B2AF-A678400CFE3E@appneta.com>
 <CAF=yD-+6CRyqL6Fq5y2zpw5nnDitYC7G1c2JAVHZTjyw68DYJg@mail.gmail.com>
 <903DEC70-845B-4C4B-911D-2F203C191C27@appneta.com>
 <CAF=yD-Le0XKCfyDBvHmBRVqkwn1D6ZoG=12gss5T62VcN5+1_w@mail.gmail.com>
 <9811659B-6D5A-4C4F-9CF8-735E9CA6DE4E@appneta.com>
Message-ID: <CAF=yD-KcX-zCgZFVVVMU7JFy+gJwRpUoViA_mWdM4QtHNr685g@mail.gmail.com>

On Tue, May 28, 2019 at 12:57 PM Fred Klassen <fklassen at appneta.com> wrote:
>
>
>
> > On May 28, 2019, at 8:08 AM, Willem de Bruijn <willemdebruijn.kernel at gmail.com> wrote:
> >
>
> I will push up latest patches soon.
>
> I did some testing and discovered that only TCP audit tests failed. They
> failed much less often when enabling poll.  Once in about 20 runs
> still failed. Therefore I commented out the TCP audit tests.

Sounds good, thanks.

> You may be interested that I reduced test lengths from 4 to 3 seconds,
> but I am still getting 3 reports per test. I picked up the extra report by
> changing 'if (tnow > treport)’ to 'if (tnow >= treport)’

Nice!

> > The only issue specific to GSO is that xmit_more can forego this
> > doorbell until the last segment. We want to complicate this logic with
> > a special case based on tx_flags. A process that cares should either
> > not use GSO, or the timestamp should be associated with the last
> > segment as I've been arguing so far.
>
> This is the area I was thinking of looking into. I’m not sure it will work
> or that it will be too messy. It may be worth a little bit of digging to
> see if there is anything there. That will be down the road a bu

Sorry, I meant  we [do not (!)] want to complicate this logic. And
definitely don't want to read skb_shinfo where that cacheline isn't
accessed already.

Given xmit_more, do you still find the first segment the right one to
move the timestamp tx_flags to in __udp_gso_segment?

>
> >>
> >> I’ll get back to you when I have tested this more thoroughly. Early results
> >> suggest that adding the -P poll() option has fixed it without any appreciable
> >> performance hit. I’ll share raw results with you, and we can make a final
> >> decision together.
> >
> > In the main loop? It still is peculiar that notifications appear to go
> > missing unless the process blocks waiting for them. Nothing in
> > sock_zerocopy_callback or the queueing onto the error queue should
> > cause drops, as far as I know.
> >
>
> Now that I know the issue is only in TCP, I can speculate that all bytes are
> being reported, but done with fewer messages. It may warrant some
> investigation in case there is some kind of bug.

This would definitely still be a bug and should not happen. We have
quite a bit of experience with TCP zerocopy and I have not run into
this in practice, so I do think that it is somehow a test artifact.

> > Indeed. Ideally even run all tests, but return error if any failed,
> > like this recent patch
> >
> >  selftests/bpf: fail test_tunnel.sh if subtests fail
> >  https://patchwork.ozlabs.org/patch/1105221/
> >
> > but that may be a lot of code churn and better left to a separate patch.
>
> I like it. I have it coded up, and it seems to work well. I’ll make a
> separate commit in the patch set so we can yank it out if you feel
> it is too much

Great. Yes, it sounds like an independent improvement, in which case
it is easier to review as a separate patch. If you already have it, by
all means send it as part of the larger patchset.

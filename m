From: willemdebruijn.kernel@gmail.com (Willem de Bruijn)
Date: Tue, 28 May 2019 11:08:14 -0400
Subject: [PATCH net 4/4] net/udpgso_bench_tx: audit error queue
In-Reply-To: <903DEC70-845B-4C4B-911D-2F203C191C27@appneta.com>
References: <20190523210651.80902-1-fklassen@appneta.com>
 <20190523210651.80902-5-fklassen@appneta.com>
 <CAF=yD-KBNLr5KY-YQ1KMmZGCpYNefSJKaJkZNOwd8nRiedpQtA@mail.gmail.com>
 <879E5DA6-3A4F-4CE1-9DA5-480EE30109DE@appneta.com>
 <CAF=yD-LQT7=4vvMwMa96_SFuUd5GywMoae7hGi9n6rQeuhhxuQ@mail.gmail.com>
 <5BB184F2-6C20-416B-B2AF-A678400CFE3E@appneta.com>
 <CAF=yD-+6CRyqL6Fq5y2zpw5nnDitYC7G1c2JAVHZTjyw68DYJg@mail.gmail.com>
 <903DEC70-845B-4C4B-911D-2F203C191C27@appneta.com>
Message-ID:
 <CAF=yD-Le0XKCfyDBvHmBRVqkwn1D6ZoG=12gss5T62VcN5+1_w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190528150814.M4zB3XwjOOL3EJzGLCmvA1BjN0cUJPfu8Ci_jD3FNk0@z>

> >> I have been wondering about xmit_more
> >> myself. I don’t think it changes anything for software timestamps,
> >> but it may with hardware timestamps.
> >
> > It arguably makes the software timestamp too early if taken on the
> > first segment, as the NIC is only informed of all the new descriptors
> > when the last segment is written and the doorbell is rung.
> >
>
> Totally makes sense. Possibly this can be improved software TX
> timestamps by delaying until just before ring buffer is advanced.
> It would have to be updated in each driver. I may have a look at
> this once I am complete this patch. Hopefully that one will be a bit
> smoother.

How do you see that? The skb_tstamp_tx call currently is already the
last action before ringing the doorbell, after setting up the
descriptor. It cannot be set later.

The only issue specific to GSO is that xmit_more can forego this
doorbell until the last segment. We want to complicate this logic with
a special case based on tx_flags. A process that cares should either
not use GSO, or the timestamp should be associated with the last
segment as I've been arguing so far.

> >>> Can you elaborate on this suspected memory leak?
> >>
> >> A user program cannot free a zerocopy buffer until it is reported as free.
> >> If zerocopy events are not reported, that could be a memory leak.
> >>
> >> I may have a fix. I have added a -P option when I am running an audit.
> >> It doesn’t appear to affect performance, and since implementing it I have
> >> received all error messages expected for both timestamp and zerocopy.
> >>
> >> I am still testing.
> >
> > I see, a userspace leak from lack of completion notification.
> >
> > If the issue is a few missing notifications at the end of the run,
> > then perhaps cfg_waittime_ms is too short.
> >
>
> I’ll get back to you when I have tested this more thoroughly. Early results
> suggest that adding the -P poll() option has fixed it without any appreciable
> performance hit. I’ll share raw results with you, and we can make a final
> decision together.

In the main loop? It still is peculiar that notifications appear to go
missing unless the process blocks waiting for them. Nothing in
sock_zerocopy_callback or the queueing onto the error queue should
cause drops, as far as I know.

>
> >> Should the test have failed at this point? I did return an error(), but
> >> the script kept running.
> >
> > This should normally be cause for test failure, I think yes. Though
> > it's fine to send the code for review and possibly even merge, so that
> > I can take a look.
> >
>
> Sounds like udpgso_bench.sh needs a ’set -e’ to ensure it stops on
> first error.

Indeed. Ideally even run all tests, but return error if any failed,
like this recent patch

  selftests/bpf: fail test_tunnel.sh if subtests fail
  https://patchwork.ozlabs.org/patch/1105221/

but that may be a lot of code churn and better left to a separate patch.

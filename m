From: fklassen at appneta.com (Fred Klassen)
Date: Tue, 28 May 2019 09:57:35 -0700
Subject: [PATCH net 4/4] net/udpgso_bench_tx: audit error queue
In-Reply-To: <CAF=yD-Le0XKCfyDBvHmBRVqkwn1D6ZoG=12gss5T62VcN5+1_w@mail.gmail.com>
References: <20190523210651.80902-1-fklassen@appneta.com>
 <20190523210651.80902-5-fklassen@appneta.com>
 <CAF=yD-KBNLr5KY-YQ1KMmZGCpYNefSJKaJkZNOwd8nRiedpQtA@mail.gmail.com>
 <879E5DA6-3A4F-4CE1-9DA5-480EE30109DE@appneta.com>
 <CAF=yD-LQT7=4vvMwMa96_SFuUd5GywMoae7hGi9n6rQeuhhxuQ@mail.gmail.com>
 <5BB184F2-6C20-416B-B2AF-A678400CFE3E@appneta.com>
 <CAF=yD-+6CRyqL6Fq5y2zpw5nnDitYC7G1c2JAVHZTjyw68DYJg@mail.gmail.com>
 <903DEC70-845B-4C4B-911D-2F203C191C27@appneta.com>
 <CAF=yD-Le0XKCfyDBvHmBRVqkwn1D6ZoG=12gss5T62VcN5+1_w@mail.gmail.com>
Message-ID: <9811659B-6D5A-4C4F-9CF8-735E9CA6DE4E@appneta.com>



> On May 28, 2019, at 8:08 AM, Willem de Bruijn <willemdebruijn.kernel at gmail.com> wrote:
> 

I will push up latest patches soon.

I did some testing and discovered that only TCP audit tests failed. They
failed much less often when enabling poll.  Once in about 20 runs
still failed. Therefore I commented out the TCP audit tests.

As for the other tests, this is what I got with poll() disabled…

udp gso zerocopy timestamp audit
udp rx:   1611 MB/s  1148129 calls/s
udp tx:   1659 MB/s    28146 calls/s  28146 msg/s
udp rx:   1686 MB/s  1201494 calls/s
udp tx:   1685 MB/s    28579 calls/s  28579 msg/s
udp rx:   1685 MB/s  1200402 calls/s
udp tx:   1683 MB/s    28552 calls/s  28552 msg/s
Summary over 3.000 seconds...
sum udp tx:   1716 MB/s      85277 calls (28425/s)      85277 msgs (28425/s)
Tx Timestamps:               85277 received                 0 errors
Zerocopy acks:               85277 received                 0 errors

Here you see that with poll() enabled, it is a bit slower, so I don’t have it
enabled in udpgso_bench.sh …

udp gso zerocopy timestamp audit
udp rx:   1591 MB/s  1133945 calls/s
udp tx:   1613 MB/s    27358 calls/s  27358 msg/s
udp rx:   1644 MB/s  1171674 calls/s
udp tx:   1643 MB/s    27869 calls/s  27869 msg/s
udp rx:   1643 MB/s  1170666 calls/s
udp tx:   1641 MB/s    27845 calls/s  27845 msg/s
Summary over 3.000 seconds...
sum udp tx:   1671 MB/s      83072 calls (27690/s)      83072 msgs (27690/s)
Tx Timestamps:               83072 received                 0 errors
Zerocopy acks:               83072 received                 0 errors


You may be interested that I reduced test lengths from 4 to 3 seconds,
but I am still getting 3 reports per test. I picked up the extra report by
changing 'if (tnow > treport)’ to 'if (tnow >= treport)’

> The only issue specific to GSO is that xmit_more can forego this
> doorbell until the last segment. We want to complicate this logic with
> a special case based on tx_flags. A process that cares should either
> not use GSO, or the timestamp should be associated with the last
> segment as I've been arguing so far.

This is the area I was thinking of looking into. I’m not sure it will work
or that it will be too messy. It may be worth a little bit of digging to
see if there is anything there. That will be down the road a bu

>> 
>> I’ll get back to you when I have tested this more thoroughly. Early results
>> suggest that adding the -P poll() option has fixed it without any appreciable
>> performance hit. I’ll share raw results with you, and we can make a final
>> decision together.
> 
> In the main loop? It still is peculiar that notifications appear to go
> missing unless the process blocks waiting for them. Nothing in
> sock_zerocopy_callback or the queueing onto the error queue should
> cause drops, as far as I know.
> 

Now that I know the issue is only in TCP, I can speculate that all bytes are
being reported, but done with fewer messages. It may warrant some
investigation in case there is some kind of bug.

> Indeed. Ideally even run all tests, but return error if any failed,
> like this recent patch
> 
>  selftests/bpf: fail test_tunnel.sh if subtests fail
>  https://patchwork.ozlabs.org/patch/1105221/
> 
> but that may be a lot of code churn and better left to a separate patch.

I like it. I have it coded up, and it seems to work well. I’ll make a
separate commit in the patch set so we can yank it out if you feel
it is too much

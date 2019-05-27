From: fklassen at appneta.com (Fred Klassen)
Date: Mon, 27 May 2019 15:56:31 -0700
Subject: [PATCH net 4/4] net/udpgso_bench_tx: audit error queue
In-Reply-To: <CAF=yD-LQT7=4vvMwMa96_SFuUd5GywMoae7hGi9n6rQeuhhxuQ@mail.gmail.com>
References: <20190523210651.80902-1-fklassen@appneta.com>
 <20190523210651.80902-5-fklassen@appneta.com>
 <CAF=yD-KBNLr5KY-YQ1KMmZGCpYNefSJKaJkZNOwd8nRiedpQtA@mail.gmail.com>
 <879E5DA6-3A4F-4CE1-9DA5-480EE30109DE@appneta.com>
 <CAF=yD-LQT7=4vvMwMa96_SFuUd5GywMoae7hGi9n6rQeuhhxuQ@mail.gmail.com>
Message-ID: <5BB184F2-6C20-416B-B2AF-A678400CFE3E@appneta.com>



> On May 27, 2019, at 2:46 PM, Willem de Bruijn <willemdebruijn.kernel at gmail.com> wrote:
>> Also, I my v2 fix in net is still up for debate. In its current state, it
>> meets my application’s requirements, but may not meet all of yours.

> I gave more specific feedback on issues with it (referencing zerocopy
> and IP_TOS, say).
> 

Unfortunately I don’t have a very good email setup, and I found a
bunch of your comments in my junk folder. That was on Saturday,
and on Sunday I spent some time implementing your suggestions.
I have not pushed the changes up yet. 

I wanted to discuss whether or not to attach a buffer to the 
recvmsg(fd, &msg, MSG_ERRQUEUE). Without it, I have
MSG_TRUNC errors in my msg_flags. Either I have to add
a buffer, or ignore that error flag. 

> Also, it is safer to update only the relevant timestamp bits in
> tx_flags, rather that blanket overwrite, given that some bits are
> already set in skb_segment. I have not checked whether this is
> absolutely necessary.
> 
 I agree. See tcp_fragment_tstamp().

I think this should work.

skb_shinfo(seg)->tx_flags |=
			(skb_shinfo(gso_skb)->tx_flags & SKBTX_ANY_TSTAMP);

>> I am still open to suggestions, but so far I don’t have an alternate
>> solution that doesn’t break what I need working.
> 
> Did you see my response yesterday? I can live with the first segment.
> Even if I don't think that it buys much in practice given xmit_more
> (and it does cost something, e.g., during requeueing).
> 

I’m sorry, I didn’t receive a response. Once again, I am struggling
with crappy email setup. Hopefully as of today my junk mail filters are
set up properly.

I’d like to see that comment. I have been wondering about xmit_more
myself. I don’t think it changes anything for software timestamps,
but it may with hardware timestamps.

I have service contracts with Intel and Mellanox. I can open up a ticket
with them to see exactly when the timestamp is taken. I believe you
mentioned before that this is vendor specific.

> It is not strictly necessary, but indeed often a nice to have. We
> generally reference by SHA1, so wait with submitting the test until
> the fix is merged. See also the ipv6 flowlabel test that I just sent
> for one example.

Thanks. I will hold off with the test until I get a final fix in net, and I’ll use
your example.

>> Below is a sample output of the
>> test, including a failure on IPv6 TCP Zerocopy audit (a failure that may
>> lead to a memory leak).
> 
> Can you elaborate on this suspected memory leak?

A user program cannot free a zerocopy buffer until it is reported as free.
If zerocopy events are not reported, that could be a memory leak.

I may have a fix. I have added a -P option when I am running an audit.
It doesn’t appear to affect performance, and since implementing it I have
received all error messages expected for both timestamp and zerocopy.

I am still testing. 

>> I wanted to review the report with you before
>> I push up the v2 patch into net-next.
>> 
>> Are these extra tests what you were expecting? Is it OK that it doesn’t
>> flow well?
> 
> Do you mean how the output looks? That seems fine.
> 

Good. Thanks.

>> Also, there is a failure about every 3rd time I run it,
>> indicating that some TX or Zerocopy messages are lost. Is that OK?
> 
> No that is not. These tests are run in a continuous test
> infrastructure. We should try hard to avoid flakiness.
> 

As per above comment, I think I removed the flakiness. I will run
overnight to confirm.

> If this intermittent failure is due to a real kernel bug, please move
> that part to a flag (or just comment out) to temporarily exclude it
> from continuous testing.
> 
> More commonly it is an issue with the test itself. My SO_TXTIME test
> from last week depends on timing, which has me somewhat worried when
> run across a wide variety of (likely virtualized) platforms. I
> purposely chose large timescales to minimize the risk.
> 
> On a related note, tests run as part of continuous testing should run
> as briefly as possible. Perhaps we need to reduce the time per run to
> accommodate for the new variants you are adding.
> 

I could reduce testing from 4 to 2 seconds. Anything below that and I
miss some reports. When I found flakey results, I found I could reproduce
them in as little as 1 second.
>> Summary over 4.000 seconds...
>> sum tcp tx:   6921 MB/s     458580 calls (114645/s)     458580 msgs (114645/s)
>> ./udpgso_bench_tx: Unexpected number of Zerocopy completions:    458580 expected    458578 received
> 
> Is this the issue you're referring to? Good catch. Clearly this is a
> good test to have :) That is likely due to some timing issue in the
> test, e.g., no waiting long enough to harvest all completions. That is
> something I can look into after the code is merged.

Thanks.

Should the test have failed at this point? I did return an error(), but
the script kept running.

As stated, I don’t want to push up until I have tested more fully, and
the fix is accepted (which requires a v3). If you want to review what
I have, I can push it up now with the understanding that I may still
fine tune things. 

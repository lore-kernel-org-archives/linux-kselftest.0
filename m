Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793325923;
	b=m6l9B4W6JIMM2L87sWyL9CVU4aDGXntglM2vDuLFvUGgzIv79hT5QjI9X5FhmGgfFaxv
	 FCy2NHgJRn+JXXRshGeO27xVqZOG0sjYNsl0XiacB0lPzmu1mukL/xl4RVq7mnWGapVpO
	 blALBWjlmj7HNo0dEC0oYqsh8eXn5cHZf1LgMsphgS58f4THKN2SrAPec2mHG/Gzyk2V2
	 Va+6nd6a5HOBq4WKbZJipQGdlu4gLos3R+fK93k+eHotWPzcaRNFNDmtsPz9okr1ydiJ6
	 DyArGziqAufPurgkwFjtgx8EsG4WyOsE8OEJHlGvDDyVo1DspfN83eEogsj3oPiv//Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793325923;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=W03CTg8YBsTmEJlqmouPl1VKaY9WqanjxmoS0oDAFEg=;
	b=cErg3+eISxQfw2Vp3G3VAdyfRoFliwF1t/R2fxAJkIAuvzLodOzV/EmIXLiYqyMui9rF
	 d0zQ40hvmzeHf9O8c6Ak0Pm0ah4VeVrAx8w3wyvcAuQuvoCqgMLQDmZNimEgEODWMgSEp
	 BNlLydEz3PRKhUdHiax4wbe6gaYrqI+3ob+vZEVjuhjSpAwWQ4Pb+x1Go28JDtfm5Tsf9
	 imdF54sw6lmVsChmkYzhGlCVQ1rBvFZivAMW8uMoRwaKuD26QZ1XV9V48kRJtu+4fFBgQ
	 R/knGO1R4MNb+pAmMOWr41FKrVHVaf1zxlb1vWtQFxfjxvqwj34uuXSoU5y/IQwvgAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RFLXXb8N;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E814606A31A;
	Fri, 30 Oct 2026 02:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RFLXXb8N
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0D1F1F00A15;
	Fri, 30 Oct 2026 02:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793325922;
	bh=W03CTg8YBsTmEJlqmouPl1VKaY9WqanjxmoS0oDAFEg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RFLXXb8N0skjj/X4DD5Uj57g7PcDqchi79wRj2b9r34BC9itEQyFvDHTpn1kPXolR
	 rt4zQ3vhfpThatMi+Eds8uwDGK3bSGV4ZZsDdURZQFd99Dlf/ODlWmqrnPmwQxobol
	 u3POCU3jWAWa5g2+PiUcQt3KEe2nBtv3lI7OISX0vRtRkLWs+Oy0cv/eIMROrDfj5Q
	 WEBfZgEqZONGyszDevw6kMzVaGb7P0ek76zIG6gkMleRIJVlFd8rNOyHkwy5SAQB92
	 ttQpsaQzNdPRF2DaovTVRWWbDwa+hLJsqwav/iEAj4nm76FNoyzi7jifob/fMfw001
	 TuohcfUb86ZsQ==
Subject:
 Re: [PATCH net v2 1/2] netlink: check sk_rcvbuf before charging the dump skb
From: netdev-bot+sashiko@kernel.org
To: jhonata.poma@gmail.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kuniyu@google.com, m.szyprowski@samsung.com
Date: Fri, 30 Oct 2026 02:05:21 +0000
Message-ID: <179332592143.3134.3446883215083774550@kernel.org>
In-Reply-To: <20261027-netlink-dump-livelock-v2-1-c4bb05352a33@gmail.com>
References: <20261027-netlink-dump-livelock-v2-1-c4bb05352a33@gmail.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 (1) · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] In netlink_dump() (net/netlink/af_netlink.c:2327), a dump can
  still fail to start because of memory charged by skbs that have…
- [Low] The new comment in netlink_dump() ("netlink_recvmsg() continues
  the dump at or below half of sk_rcvbuf, and the skb must be queued…
- [Low] The dump_extack selftest (tools/testing/selftests/net/netlink-
  dumps.c, comment at lines 158-161, branch at 162-163) still describes…

Pre-existing issues:
- [Medium] This problem wasn't introduced by this patch, but it has the
  same trigger the commit describes.

--

netlink: check sk_rcvbuf before charging the dump skb

This patch changes netlink_dump() so that sk_rmem_alloc is compared
against sk_rcvbuf before the new dump skb is charged instead of after.
A dump can then start while something else is still charged to the
socket. It also refuses an skb that would push sk_rmem_alloc past
INT_MAX, so the wraparound fix from ae8f160e7eb2 still holds.

> diff --git a/net/netlink/af_netlink.c b/net/netlink/af_netlink.c
> index a904dc3bcad6b..4129e93a9ff0c 100644
> --- a/net/netlink/af_netlink.c
> +++ b/net/netlink/af_netlink.c
> @@ -2318,9 +2318,13 @@ static int netlink_dump(struct sock *sk, bool lock_taken)
>  	if (!skb)
>  		goto errout_skb;
>  
> +	/* Check the limit before charging the skb: netlink_recvmsg() continues
> +	 * the dump at or below half of sk_rcvbuf, and the skb must be queued
> +	 * then. Keep sk_rmem_alloc at or below INT_MAX.
> +	 */

[Severity: Low]
Is "the skb must be queued then" guaranteed? netlink_recvmsg() checks its
gate without any lock that keeps senders out:

netlink_recvmsg() {
    ...
	if (READ_ONCE(nlk->cb_running) &&
	    atomic_read(&sk->sk_rmem_alloc) <= sk->sk_rcvbuf / 2) {
		ret = netlink_dump(sk, false);
    ...
}

netlink_dump() then takes nl_cb_mutex and calls alloc_skb(GFP_KERNEL).
Both can sleep before the skb is charged. Several things can happen in
that window:

  - netlink_broadcast_deliver() fills the socket up to rcvbuf, or puts
    an skb of any truesize into an empty socket.
  - A rejected broadcast briefly over-charges before its atomic_sub().
  - setsockopt(SO_RCVBUF) shrinks rcvbuf.
  - A second reader's dump skb gets queued first.

Any of these can make rmem - skb->truesize >= rcvbuf true after the gate
passed. netlink_recvmsg() then sets sk_err while the dump keeps running.
A later read seems to resume the dump, so this looks transient. The same
races also existed before this patch.

Could the comment and the commit message ("so the skb is then always
queued") be softened to say this only holds when nothing else charges
the socket concurrently?

Separately, the plain read of sk->sk_rcvbuf in that gate races with the
WRITE_ONCE() in sock_setsockopt(). That part is pre-existing.

>  	rcvbuf = READ_ONCE(sk->sk_rcvbuf);
>  	rmem = atomic_add_return(skb->truesize, &sk->sk_rmem_alloc);
> -	if (rmem != skb->truesize && rmem >= rcvbuf) {
> +	if (rmem - skb->truesize >= rcvbuf || rmem > INT_MAX) {

[Severity: High]
Can the dump still get stuck when the stale charge alone is at least
sk_rcvbuf?

The commit message says this fixes "A dump that starts while something
else is still charged to a socket with a small receive buffer fails with
ENOBUFS and stays running". This check only covers a stale charge that is
below sk_rcvbuf.

netlink_broadcast_deliver() accepts a notification of any truesize into
a socket with nothing charged, through rmem == skb->truesize. The
selftest in the next patch uses SO_RCVBUF 2048, which gives sk_rcvbuf
4096. With a buffer that small, one rtnetlink or genetlink notification
can have truesize >= sk_rcvbuf.

do_one_broadcast() gives the first listener the original skb through
p->skb2 = skb_get(p->skb). After the reader dequeues it, the charge stays
on the socket until netlink_broadcast_filtered() calls consume_skb(skb).
This is the preempted-sender state from the commit message. The
broadcaster can also sleep in skb_clone() for later listeners.

The reader then sends a dump request:

__netlink_dump_start()
    WRITE_ONCE(nlk->cb_running, true);
    netlink_dump()
        rmem - skb->truesize >= rcvbuf -> -ENOBUFS
    return ret;   /* cb_running is still true */

The ack goes through netlink_rcv_skb()->netlink_ack()->netlink_unicast()
->netlink_attachskb(). There rmem = stale + ack truesize, which is above
rcvbuf and not equal to the ack truesize, so the ack is dropped.
netlink_overrun() then sets sk_err, or does nothing if NETLINK_NO_ENOBUFS
is set.

When the broadcaster later drops its reference, sock_rfree() only
uncharges. It does not wake the reader or call netlink_dump().

netlink_recvmsg() resumes a dump only after skb_recv_datagram() returns
an skb, and the queue is empty. So:

  - the next recvmsg() returns sk_err;
  - the one after that blocks;
  - every later dump request gets -EBUSY from __netlink_dump_start(),
    until some unrelated message arrives.

Would it be more robust to never fail the first netlink_dump() call from
__netlink_dump_start() because of rcvbuf? Another option is to clear
cb_running, or arrange a resume, when that call fails.

[Severity: Low]
This isn't a bug, but the dump_extack test in
tools/testing/selftests/net/netlink-dumps.c still describes the old
behaviour:

dump_extack() {
    ...
		/* Once we fill the buffer we'll see one ENOBUFS followed
		 * by a number of EBUSYs. Then the last recv() will finally
		 * trigger and complete the dump.
		 */
		if (ret == FOUND_ERR && (ea.err == ENOBUFS || ea.err == EBUSY))
			continue;
    ...
}

With this check, the bad RTM_GETNEIGH dumps keep queueing DONE+extack
skbs as long as the charge before each one is below sk_rcvbuf. So
sk_rmem_alloc ends up in [rcvbuf, rcvbuf + truesize).

The ENOBUFS ack for the next dump is then refused in netlink_attachskb(),
and netlink_overrun() sets NETLINK_S_CONGESTED. Because of that bit, the
later EBUSY acks are dropped as well. The ENOBUFS/EBUSY branch above can
no longer be reached.

Should the comment and the branch be updated, perhaps to check the new
behaviour instead? The next patch in the series only adds a new test and
leaves dump_extack unchanged.

[Severity: Medium]
This isn't a bug introduced by this patch, but the same trigger can also
stall a dump after it has started. netlink_recvmsg() is the only place
that continues a running dump:

netlink_recvmsg() {
    ...
	skb_free_datagram(sk, skb);

	if (READ_ONCE(nlk->cb_running) &&
	    atomic_read(&sk->sk_rmem_alloc) <= sk->sk_rcvbuf / 2) {
		ret = netlink_dump(sk, false);
    ...
}

The sk_rmem_alloc value read there still includes the charge of a
notification that was dequeued but is held through skb_get() in
do_one_broadcast(). That charge stays until consume_skb(skb) in
netlink_broadcast_filtered().

Suppose that notification's truesize is between rcvbuf/2 and rcvbuf:

  1. The dump starts normally under the new check.
  2. The reader consumes the first dump skb.
  3. The gate sees the stale charge above rcvbuf/2 and does not
     continue the dump.
  4. The next recvmsg() blocks on an empty queue.
  5. netlink_skb_destructor()->sock_rfree() later uncharges, but neither
     wakes the reader nor calls netlink_dump().

A dump that needs several skbs, such as a scan dump, then stalls until
some unrelated message arrives. Could this be handled together with the
start-of-dump case? The gate and the destructor are not changed here, and
they behaved the same way before ae8f160e7eb2.

>  		atomic_sub(skb->truesize, &sk->sk_rmem_alloc);
>  		goto errout_skb;
>  	}

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261027-netlink-dump-livelock-v2-0-c4bb05352a33%40gmail.com

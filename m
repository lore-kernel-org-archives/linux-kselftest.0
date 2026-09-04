Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77E85328C7;
	Fri,  4 Sep 2026 22:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788560741; cv=none; b=qaocKPryKu3WvP2b2bdrbzltWDSuUCvyEh57UqhIJZ4bMR32LaUKmZr8G9pn8Pcp+6blSzKeayzNBGuyGiDnZzdbfSf3V7pZzSKkt+mUif02no7UEQYZljHD5JGA9rDMmHZtMgTfvNnvlGinHhA8uhEuohtNNf5ZwYQFTIJFI18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788560741; c=relaxed/simple;
	bh=qvsT0W+v5bzqv6EBQ6wEE6IZX3pigF4LBvlOFMiTfXI=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z6RT2vmexYDJbcNSbK9DWQYL7/fdzRfzZwsPZt5N6ociOVAgjWeN7+GBZHPLBAlDmv8fBctxc2W/gYlVvyuMjWjwEvWqMZVPrABuDSMo3VMEaDkJBjTqg8dQbMb7ypA735KoJNaDRHHKFZ4M99KtKyhzlQjn2vmqMSN9U/7alcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OK2UNyrC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OK2UNyrC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2810F1F00A3D;
	Fri,  4 Sep 2026 22:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788560738;
	bh=BODUg4diNtAxt2eo94DXsAxAYTsQqkqw87fLf07CnyY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=OK2UNyrCd2VmypIPMDK1eVKp8GX/FxDc9eVLE6bCYGShkrSAsHMwiy4xAqx4k9V5f
	 +y7+XFYBg4lu34ACFtV1l/WCnEjtO0m4qBVoZmdX8voFMrYa2jzJC5rSQdIue4GJSt
	 NMpre8kV5Slds1jbvD4wkBQdoP8zrgLXZxhRWabtMNzFJqBIhwQvlGKdnDCwSRaJeQ
	 CGVt54c8nLBlIGAZDaHJ2jh9I25A4v2avyqqJQJTgGoC8tkShDnrDA2qjKfKjbI2S+
	 novY6YSXEh1diE0Dh+ylhzc561JzXvrpATZzgh8/eeSxGIoKPvR210qcF1hkL5W2Zs
	 C7jIrrPOnBbIA==
Subject:
 Re: [PATCH net-next v1 1/2] netdevsim: add TLS device offload emulation
From: netdev-bot+sashiko@kernel.org
To: jiayuan.chen@linux.dev
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Fri, 04 Sep 2026 22:25:37 +0000
Message-ID: <178856073774.219967.3771752588848719293@kernel.org>
In-Reply-To: <20260901154914.11637-2-jiayuan.chen@linux.dev>
References: <20260901154914.11637-2-jiayuan.chen@linux.dev>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 2 · Low: 3

- [Medium] The whole RX half of the emulation is a dead decision: every
  frame nsim_tls_rx() inspects already has skb->decrypted == 1 set by…
- [Medium] nsim_tls_tx_zero_tags() aborts the whole record walk with
  'break' as soon as tls_get_record() returns NULL or a start-marker…
- [Low] Claim that the new TLS emulation has no in-tree consumer / no
  selftest, so the commit message's stated purpose (code coverage and…
- [Low] The lock-scope annotation on the new struct nsim_tls in
  drivers/net/netdevsim/netdevsim.h ('spinlock_t lock; /* protects conns…
- [Low] nsim_tls_tx_zero_tags() rewrites tag_size payload bytes (the
  auth-tag placeholder, memset at drivers/net/netdevsim/tls.c:188) from…

--

netdevsim: add TLS device offload emulation

This adds an emulated kTLS device offload to netdevsim: tlsdev_ops plus
NETIF_F_HW_TLS_TX/RX so kTLS sockets over netdevsim take the device path,
with TX zeroing the auth tag placeholder and RX marking skbs decrypted.
A per-port debugfs "tls" file exposes the connection list and counters.

A few questions below.

> diff --git a/drivers/net/netdevsim/netdev.c b/drivers/net/netdevsim/netdev.c
> index b4a99f3ceac60..b9e0a2f5b18fc 100644
> --- a/drivers/net/netdevsim/netdev.c
> +++ b/drivers/net/netdevsim/netdev.c
> @@ -151,6 +151,8 @@ static netdev_tx_t nsim_start_xmit(struct sk_buff *skb, struct net_device *dev)
>  	if (dr)
>  		goto out_drop_free;
>  
> +	nsim_do_tls(skb, ns, peer_ns);
> +
>  	rxq = skb_get_queue_mapping(skb);
>  	if (rxq >= peer_dev->num_rx_queues)
>  		rxq = rxq % peer_dev->num_rx_queues;

[ ... ]

> diff --git a/drivers/net/netdevsim/netdevsim.h b/drivers/net/netdevsim/netdevsim.h
> index 55aec41237b9b..b4646c7061bd0 100644
> --- a/drivers/net/netdevsim/netdevsim.h
> +++ b/drivers/net/netdevsim/netdevsim.h
> @@ -56,6 +56,20 @@ struct nsim_ipsec {
>  	u32 tx;
>  };
>  
> +struct nsim_tls {
> +	struct list_head conns;
> +	spinlock_t lock;	/* protects conns and the counters below */
> +	struct dentry *dfile;
> +	u32 count;
> +	u32 tx_conn;
> +	u32 rx_conn;
> +	atomic64_t tx_packets;
> +	atomic64_t tx_bytes;
> +	atomic64_t rx_packets;
> +	atomic64_t rx_bytes;
> +	atomic64_t resyncs;
> +};

[Severity: Low]
This isn't a bug, but does the annotation match the code?  Of the fields
below the lock, only count, tx_conn and rx_conn are updated under
ns->tls.lock (nsim_tls_dev_add(), nsim_tls_dev_del(),
nsim_tls_teardown()).

The five atomic64_t counters are only ever touched from the lockless xmit
path, in nsim_tls_tx(), nsim_tls_rx() and nsim_tls_dev_resync():

	atomic64_inc(&ns->tls.tx_packets);
	atomic64_add(skb->len, &ns->tls.tx_bytes);

and count is additionally read with no lock held in nsim_tls_rx():

	if (!READ_ONCE(ns->tls.count))
		return;

Would "protects conns, count, tx_conn and rx_conn" describe the actual
contract better, so nobody later adds a plain counter there and updates it
from the xmit path?

[ ... ]

> diff --git a/drivers/net/netdevsim/tls.c b/drivers/net/netdevsim/tls.c
> new file mode 100644
> index 0000000000000..079d30a86b5d6
> --- /dev/null
> +++ b/drivers/net/netdevsim/tls.c
> @@ -0,0 +1,482 @@

[ ... ]

> +static bool nsim_tls_rx_offloaded(struct netdevsim *ns,
> +				  const struct nsim_tls_tuple *t)
> +{
> +	struct nsim_tls_conn *conn;
> +
> +	list_for_each_entry_rcu(conn, &ns->tls.conns, list) {
> +		if (conn->dir != TLS_OFFLOAD_CTX_DIR_RX ||
> +		    conn->lport != t->dport || conn->rport != t->sport ||
> +		    !ipv6_addr_equal(&conn->laddr, &t->daddr) ||
> +		    !ipv6_addr_equal(&conn->raddr, &t->saddr))
> +			continue;
> +
> +		/* Anything before start_sn predates the offload and has to
> +		 * stay encrypted.  Only worth asking once: TCP sequence
> +		 * numbers wrap, and a stream that has moved 2G past a
> +		 * sequence it is still compared against looks like it went
> +		 * backwards.
> +		 */
> +		if (!READ_ONCE(conn->started)) {
> +			if (before(t->seq, conn->start_sn))
> +				return false;
> +			WRITE_ONCE(conn->started, true);
> +		}
> +
> +		return true;
> +	}
> +
> +	return false;
> +}

[ ... ]

> +static void nsim_tls_tx_zero_tags(struct sk_buff *skb)
> +{

[ ... ]

> +	spin_lock_irqsave(&tx_ctx->lock, flags);
> +	while (before(seq, end)) {
> +		struct tls_record_info *record;
> +		skb_frag_t *frag;
> +		u64 rcd_sn;
> +
> +		record = tls_get_record(tx_ctx, seq, &rcd_sn);
> +		if (!record || tls_record_is_start_marker(record))
> +			break;

[Severity: Medium]
Can this break put un-zeroed tag placeholders on the wire?

tls_get_record() returns the start marker record for any sequence before
start_offload_tcp_sn:

net/tls/tls_device.c:tls_get_record() {
	...
	if (likely(!tls_record_is_start_marker(info))) {
	...
}

include/net/tls.h:
static inline bool tls_record_is_start_marker(struct tls_record_info *rec)
{
	return rec->len == 0;
}

So for a segment that starts with pre-offload bytes and continues into the
first offloaded record, the walk breaks on the very first iteration and no
record in that skb gets its tag placeholder cleared, even though the start
marker's end_seq gives the boundary to continue from.

The helper returns void, nsim_tls_tx() still returns true and
nsim_start_xmit() forwards the frame, so the uninitialized page frag bytes
reach the peer's receive path where AF_PACKET, tc/BPF or XDP in that netns
can read them.  That is the leak the commit message says it closes:

    "the placeholder the stack leaves for it comes from a page frag that is
    never zeroed, so clear it instead of putting stale page contents on the
    wire"

Would it be better for this helper to report failure and have the skb
dropped, or to skip past the start marker via record->end_seq and keep
walking?

> +
> +		frag = &record->frags[record->num_frags - 1];
> +		memset(skb_frag_address(frag) + skb_frag_size(frag) - tag_size,
> +		       0, tag_size);

[Severity: Low]
This isn't a bug in the supported setup, but the memset rewrites tag_size
payload bytes from inside ndo_start_xmit without touching the L4 checksum.

netdevsim has NETIF_F_HW_CSUM in hw_features (nsim_setup()), so "ethtool -K
nsimX tx off" is accepted.  netdev_fix_features() then also clears
NETIF_F_HW_TLS_TX, but tls_dev_event() only re-checks that tlsdev_ops
exist, so a live socket keeps ctx->netdev pointing at this device and keeps
taking the device TX path.  With csum offload gone, skb_checksum_help()
runs before ndo_start_xmit and computes over the un-zeroed placeholder;
nsim_tls_tx_zero_tags() then changes those bytes, and since netdevsim never
sets CHECKSUM_UNNECESSARY on receive the peer's TCP drops every segment and
the connection stalls.

The sibling emulation in the same driver repairs this, nsim_do_psp():

		uh->check = udp_v4_check(udplen, iph->saddr, iph->daddr, csum);
		...
		skb->ip_summed	= CHECKSUM_NONE;

Would skipping (or compensating for) the memset when skb->ip_summed !=
CHECKSUM_PARTIAL be worth doing here?

> +
> +		seq = record->end_seq;
> +	}
> +	spin_unlock_irqrestore(&tx_ctx->lock, flags);
> +}

[ ... ]

> +static bool nsim_tls_tx(struct netdevsim *ns, struct sk_buff *skb)
> +{
> +	if (!tls_is_skb_tx_device_offloaded(skb))
> +		return false;
> +
> +	/* The question tls_validate_xmit_skb() asks: on anything other than
> +	 * the device the context is attached to, the core has already
> +	 * encrypted the record in software, so it is real ciphertext and none
> +	 * of our business.
> +	 */
> +	if (rcu_dereference_bh(tls_get_ctx(skb->sk)->netdev) != ns->netdev)
> +		return false;

[ ... ]

> +static void nsim_tls_rx(struct netdevsim *ns, struct sk_buff *skb)
> +{
> +	struct nsim_tls_tuple t;
> +
> +	/* Not every port registers the offload, and one that does not never
> +	 * initializes the list head, so gate on the count.  It is the
> +	 * cheaper test anyway.
> +	 */
> +	if (!READ_ONCE(ns->tls.count))
> +		return;
> +
> +	if (!nsim_tls_parse(skb, &t))
> +		return;
> +
> +	if (!nsim_tls_rx_offloaded(ns, &t))
> +		return;
> +
> +	skb->decrypted = 1;

[Severity: Medium]
Is skb->decrypted already 1 by the time this runs, making the whole RX
decision unobservable?

For a device-offloaded kTLS socket the TX side sets it:

net/tls/tls_device.c:tls_push_data() {
	...
	flags |= MSG_SENDPAGE_DECRYPTED;
	...
}

net/ipv4/tcp.c:tcp_sendmsg_locked() {
	...
	skb->decrypted = !!(flags & MSG_SENDPAGE_DECRYPTED);
	...
}

netdevsim hands that same skb to the peer via nsim_forward_skb() ->
__dev_forward_skb() -> skb_scrub_packet(), which clears pkt_type, iif, dst,
extensions, ct, mark and tstamp but not decrypted.  On the peer,
tls_device_decrypted() reads skb->decrypted whenever rx_conf == TLS_HW.

If so, the tuple match and the "predates the offload" rejection in
nsim_tls_rx_offloaded():

		if (!READ_ONCE(conn->started)) {
			if (before(t->seq, conn->start_sn))
				return false;

cannot have any effect, and the mid-stream behaviour the commit message
describes does not happen:

    "Anything else - a peer with no matching context, a context installed
    mid stream - has the core run the software AEAD over plaintext, which
    fails the connection with -EBADMSG."

The same inheritance also seems to defeat the ctx->netdev != ns->netdev
bail-out in nsim_tls_tx().  If the sending port goes down, tls_device_down()
clears ctx->netdev while tx_conf stays TLS_HW, so subsequent sends go
through tls_validate_xmit_skb() and the software fallback.  decrypted lives
inside struct_group(headers, ...) in struct sk_buff, so the fallback skb
built by complete_skb()/skb_copy_header() inherits the bit.  Would that
deliver real ciphertext to a peer that still has a matching RX connection,
with tls_device_decrypted() returning 1, the software AEAD skipped and
userspace handed ciphertext rather than plaintext or -EBADMSG?

Should the emulation clear skb->decrypted for frames it does not claim, the
way a real wire drops an in-kernel-only bit?

> +	atomic64_inc(&ns->tls.rx_packets);
> +	atomic64_add(skb->len, &ns->tls.rx_bytes);
> +}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260901154914.11637-1-jiayuan.chen%40linux.dev

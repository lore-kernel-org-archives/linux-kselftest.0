Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795012340;
	b=WMX53giwYGVuxC0g72zfTG9HNchd+ZTSOoQ5LDBB64JMtpIzyWkaPLevEb5plSv8+zpS
	 9kniqCfJx+d77Nm6s2XdRfu0SQgnuz1sEu3hDcrYkcjwNWVZmaOnQmvHdmuMRf+TmR3N7
	 XcVyns99HojOq0z4Gs2tHVsgblBvZFlr+o8GFX1LOMSL3qJ7dPS6Si72jd2NLPOVOdleg
	 AErFtONWMslcPXIVLPSMG8oAmDtMQXf088su39YEK93gdZivn+X4U4/mh9iMfzhwdxtFf
	 JkTnNsFMpppZwysIFWpqKHUbr9iLBrmCXex7aB2ihgkXsaagzIS13SbVvDplO+ZbZXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012340;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=7jQT3dfpLYqeUK4DoTAQSzaDXb+f3HOv+YBt8ur6KBI=;
	b=h6RmMQkslm0QXPsE7bViUzBTjzn7uc8uTJKip1CzZ3Te1/NROnRx04wT29reELZcQ8SZ
	 8a7dt+R+HeYwP/JETw9Dz+Ey+EDb2+5t4ELF7skp7hf+CWeJNMqjoDRMboigUmw3FZXbh
	 fnN80WmHGveH172CQRBlBwgj99GX1BnwUXxt3AuNxht8RqnKdCBXv33C2ow1BpbYcQJr+
	 9qiGkUzKGaPC4+ba5rxQneTTwggPbocYiVYc5zSrBnXM7YAorZud2rq9oxmKR/ZrPDm13
	 ZRiMoB918xBYYa/ZC8V6vwwwM3JJtIeIctcgN5S73K5Shm2fpyVx3lL1QLqRcxa7y3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VySfDEcB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999DD606A31C;
	Wed, 18 Nov 2026 14:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VySfDEcB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF9A41F000C4;
	Wed, 18 Nov 2026 14:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795012340;
	bh=7jQT3dfpLYqeUK4DoTAQSzaDXb+f3HOv+YBt8ur6KBI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VySfDEcBcNGbFF+rpI4yHodTmFw50soCkCJgjkGJGjLWZYcNts3AorVeo1LGcWXaw
	 7DoYFjgtsKr55eavX5lfDSka9rk4aPY1dwYTNszLo/VXYUnczghpL/8giNhAEqmb9B
	 DGU67WcwEaL+EGkx3k6uwOZ5Rg7URJLGSj507Z3UFg3EDt1yMYWIBzkFQF0gBxqLxQ
	 OTQgRbV5f5ARaShw+5QWFFLBgrJaeM4MsPI/7vJGGU2p2CKUbTOMljQ0S+5q22bnRq
	 x8KzAzL9Sgo5L+q8tKOKiCxmnEAPS2+6Jc5chh8XaZ5V12yiDyEqXM5bRvgox8dDp7
	 EBGwJlYJLYMaQ==
Subject:
 Re: [PATCH net-next v2 1/2] netdevsim: add TLS device offload emulation
From: netdev-bot+sashiko@kernel.org
To: jiayuan.chen@linux.dev
Cc: netdev@vger.kernel.org, kuba@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
 john.fastabend@gmail.com, sd@queasysnail.net, shuah@kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Wed, 18 Nov 2026 14:32:19 +0000
Message-ID: <179501233933.3136.12728860174259324524@kernel.org>
In-Reply-To: <20261117140642.4008-2-jiayuan.chen@linux.dev>
References: <20261117140642.4008-2-jiayuan.chen@linux.dev>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 3 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The RX-side 'decryption' emulation does not decide whether the
  peer sees skb->decrypted=1 for offloaded TLS records.
- [Medium] netdevsim: unguarded IPv6 sock fields in nsim_tls_dev_add()
  break IPV6=n build
- [Medium] netdevsim: non-TLS TCP segments treated as TLS records in
  nsim_tls_tx()
- [Low] The comment on struct nsim_tls's lock in
  drivers/net/netdevsim/netdevsim.h:61 reads 'protects conns and the…
- [Low] nsim_tls_tx_zero_tags() rewrites payload bytes (the auth-tag
  placeholder at the end of each record's last frag) without checking…

--

netdevsim: add TLS device offload emulation

This adds kTLS device offload emulation to netdevsim. It implements
tlsdev_ops and advertises NETIF_F_HW_TLS_TX/RX. TX passes plaintext
records through and zeroes the auth tag placeholder. RX marks skbs
decrypted when they match the tuple installed at ->tls_dev_add().

> diff --git a/drivers/net/netdevsim/netdevsim.h b/drivers/net/netdevsim/netdevsim.h
> index 2aa7ea924396e..5c14033ab507f 100644
> --- a/drivers/net/netdevsim/netdevsim.h
> +++ b/drivers/net/netdevsim/netdevsim.h
> @@ -56,6 +56,19 @@ struct nsim_ipsec {
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
> +};

[Severity: Low]
This isn't a bug, but is this comment accurate?

The lock doesn't cover the datapath:

  - nsim_tls_tx() and nsim_tls_rx() update the atomic64 counters below it
    without ns->tls.lock.
  - nsim_tls_rx() reads count with READ_ONCE().
  - nsim_tls_rx_offloaded() walks conns under RCU with
    list_for_each_entry_rcu().

The lock seems to serialize only the writers (nsim_tls_dev_add(),
nsim_tls_dev_del() and nsim_tls_teardown()) and the debugfs snapshot.

Could the comment say that instead?

[ ... ]

> diff --git a/drivers/net/netdevsim/tls.c b/drivers/net/netdevsim/tls.c
> new file mode 100644
> index 0000000000000..cad9b262da441
> --- /dev/null
> +++ b/drivers/net/netdevsim/tls.c
> @@ -0,0 +1,477 @@

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
> +
> +		frag = &record->frags[record->num_frags - 1];
> +		memset(skb_frag_address(frag) + skb_frag_size(frag) - tag_size,
> +		       0, tag_size);

[Severity: Low]
Can this memset leave a bad TCP checksum when the checksum has already
been computed in software?

netdevsim puts NETIF_F_HW_CSUM in hw_features. So "ethtool -K <dev> tx
off" can be run while TLS TX offloads are installed. That leads to:

  - netdev_fix_features() drops NETIF_F_HW_TLS_TX and TSO.
  - tls_dev_event() does not tear down existing contexts on
    NETDEV_FEAT_CHANGE.
  - tls_validate_xmit_skb() keeps passing the skb through, because dev
    still matches tls_ctx->netdev.

validate_xmit_skb() then computes the checksum in software, through
skb_csum_hwoffload_help() or software GSO, over the stale placeholder
bytes. After that, this path rewrites them:

nsim_start_xmit()
  nsim_do_tls()
    nsim_tls_tx()
      nsim_tls_tx_zero_tags()
        memset(..., 0, tag_size)

The skb is no longer CHECKSUM_PARTIAL, and the netdevsim RX path does not
mark it CHECKSUM_UNNECESSARY. The peer's TCP would see a checksum mismatch
and drop the segment that carries the tag.

The retransmit would have a correct checksum, since the pages already
hold zeros. The result is one drop and retransmit per record whenever
the stale bytes were non-zero.

Should this only touch the tag when skb->ip_summed == CHECKSUM_PARTIAL,
or fix up the checksum after the memset?

[ ... ]

> +static bool nsim_tls_tx(struct netdevsim *ns, struct sk_buff *skb)
> +{
> +	/* Not ours: the software fallback has already encrypted it.  Clear
> +	 * the decrypted mark the sending stack left so the peer's stack
> +	 * decrypts it.
> +	 */
> +	if (!tls_is_skb_tx_device_offloaded(skb) ||
> +	    rcu_dereference_bh(tls_get_ctx(skb->sk)->netdev) != ns->netdev) {
> +		skb->decrypted = 0;
> +		return false;
> +	}
> +
> +	nsim_tls_tx_zero_tags(skb);
> +	atomic64_inc(&ns->tls.tx_packets);
> +	atomic64_add(skb->len, &ns->tls.tx_bytes);
> +
> +	return true;
> +}
> +
> +/* Stand in for the inline decryption the peer's hardware would do, since we
> + * are about to hand the skb to its stack.
> + */
> +static void nsim_tls_rx(struct netdevsim *ns, struct sk_buff *skb)
> +{
> +	struct nsim_tls_tuple t;
> +

[Severity: Medium]
Does this treat every skb from the offloaded socket as a TLS record?

Once tls_set_device_offload() installs tls_validate_xmit_skb,
tls_is_skb_tx_device_offloaded() is true for anything the socket
sends. That includes pure ACKs, bare FINs, window probes and
keepalives with no TCP payload. It also includes retransmits of bytes
that were queued before TLS_TX was set up.

nsim_tls_tx_zero_tags() detects these cases (off >= skb->len, or
tls_get_record() returning NULL or the start marker), but it just
returns. nsim_tls_tx() still bumps tx_packets/tx_bytes and returns
true:

nsim_do_tls()
  nsim_tls_tx()            <- counts it, returns true
  nsim_tls_rx(peer_ns)
    nsim_tls_parse()       <- no payload length check
    nsim_tls_rx_offloaded()
      WRITE_ONCE(conn->started, true)
    skb->decrypted = 1

On the peer, a zero length segment with seq at or after start_sn is
enough to latch conn->started. The one-shot start_sn check can then be
used up by an ACK that carries no record bytes at all.

Pre-offload segments can also be marked decrypted and counted in
rx_packets/rx_bytes. Their bytes are not device records, and the
sending stack built them with skb->decrypted == 0.

The debugfs counters on both ports therefore count control segments as
offloaded TLS traffic.

Real drivers skip these. For example, mlx5e_ktls_handle_tx_skb()
returns early when there is no TCP payload. Could
nsim_tls_tx_zero_tags() report whether it found a device record, with
nsim_tls_tx() returning false otherwise? Or would checking the
sender's skb->decrypted, together with a payload length check, be
enough here?

[ ... ]

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
Does the peer-side match here decide whether the peer sees
skb->decrypted set on offloaded records?

On the device-offloaded TX path, tls_push_data() adds
MSG_SENDPAGE_DECRYPTED:

net/tls/tls_device.c:tls_push_data() {
    ...
	flags |= MSG_SENDPAGE_DECRYPTED;
    ...
}

tcp_sendmsg_locked() then turns that into the skb bit:

net/ipv4/tcp.c:tcp_sendmsg_locked() {
    ...
			skb->decrypted = !!(flags & MSG_SENDPAGE_DECRYPTED);
    ...
}

nsim_tls_tx() clears the bit only on the "not ours" path. nsim_tls_rx()
only ever sets it and never clears it. skb_scrub_packet(), called from
__dev_forward_skb(), doesn't touch it either.

So every record skb from an offloaded sender seems to reach the peer
stack with decrypted = 1, even when:

  - the peer has ns->tls.count == 0 (no RX offload installed, or the RX
    feature is off)
  - the tuple does not match in nsim_tls_rx_offloaded()
  - the seq is before conn->start_sn

For example, records that reach the peer before its TLS_RX offload is
installed would already be marked decrypted.

That doesn't match the comment in nsim_do_tls():

	/* Only what this port just "encrypted" may skip decryption on the
	 * peer.  ...

or the one in nsim_tls_rx_offloaded():

		 * ...  The check only keeps a pre-offload stream
		 * from being reported decrypted, ...

The commit message also says:

    on RX, where there is no socket yet, connections are matched on the
    tuple from ->tls_dev_add() the way the hardware does.

For record skbs, the tuple match and the start_sn/started logic seem to
change only the debugfs rx counters. The gate still applies to "ours"
skbs that were built with decrypted = 0, such as retransmits of bytes
queued before TX offload was installed.

Would it make sense for nsim_do_tls() to clear skb->decrypted on its own
records, and for nsim_tls_rx() to set it only on a match?

[ ... ]

> @@ -0,0 +1,477 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/ipv6.h>
> +#include <linux/list.h>
> +#include <linux/skbuff.h>
> +#include <linux/slab.h>
> +#include <linux/tcp.h>
> +#include <net/ip.h>
> +#include <net/ipv6.h>
> +#include <net/tcp.h>
> +#include <net/tls.h>
> +
> +#include "netdevsim.h"
> +
> +/* Emulated kTLS offload.  No crypto is performed: TX puts the record on the
> + * wire as plaintext and RX marks it decrypted, so the RX side has to be
> + * offloaded on netdevsim as well, otherwise the core runs the software AEAD
> + * over plaintext and fails the connection with -EBADMSG.  The other way
> + * round, software TX into an offloaded RX, is real ciphertext and works.
> + */
> +
> +#define NSIM_TLS_MAX_CONN	32
> +
> +/* netdev_fix_features() drops NETIF_F_HW_TLS_RX unless the device also does
> + * RX checksums, which every offload capable NIC does.
> + */
> +#define NSIM_TLS_FEATURES	(NETIF_F_HW_TLS_TX | NETIF_F_HW_TLS_RX | \
> +				 NETIF_F_RXCSUM)
> +
> +struct nsim_tls_conn {
> +	struct list_head list;
> +	struct rcu_head rcu;
> +
> +	/* Identity as seen on the wire, from the point of view of the port
> +	 * the offload was installed on: l* is this side, r* is the peer.
> +	 */
> +	struct in6_addr laddr;
> +	struct in6_addr raddr;
> +	__be16 lport;
> +	__be16 rport;
> +	u16 family;
> +
> +	enum tls_offload_ctx_dir dir;
> +	u32 start_sn;
> +	bool started;
> +	u16 cipher_type;
> +	const struct tls_context *tls_ctx;
> +};
> +
> +struct nsim_tls_tuple {
> +	struct in6_addr saddr;
> +	struct in6_addr daddr;
> +	__be16 sport;
> +	__be16 dport;
> +	u32 seq;
> +};
> +
> +/* Parse the tuple from the frame the way a NIC would.  The xmit skb is not
> + * always a well formed local TCP skb (AF_PACKET, tc redirect); use
> + * skb_header_pointer() so a non-linear or truncated header cannot be misread.
> + */
> +static bool nsim_tls_parse(const struct sk_buff *skb,
> +			   struct nsim_tls_tuple *t)
> +{
> +	int off = skb_network_offset(skb);
> +	const struct tcphdr *th;
> +	struct tcphdr _th;
> +
> +	switch (skb->protocol) {
> +	case htons(ETH_P_IP): {
> +		const struct iphdr *iph;
> +		struct iphdr _iph;
> +
> +		iph = skb_header_pointer(skb, off, sizeof(_iph), &_iph);
> +		if (!iph || iph->version != 4 || iph->ihl < 5 ||
> +		    iph->protocol != IPPROTO_TCP || ip_is_fragment(iph))
> +			return false;
> +		ipv6_addr_set_v4mapped(iph->saddr, &t->saddr);
> +		ipv6_addr_set_v4mapped(iph->daddr, &t->daddr);
> +		off += iph->ihl * 4;
> +		break;
> +	}
> +	case htons(ETH_P_IPV6): {
> +		const struct ipv6hdr *ip6h;
> +		struct ipv6hdr _ip6h;
> +		__be16 frag_off;
> +		u8 nexthdr;
> +		int thoff;
> +
> +		ip6h = skb_header_pointer(skb, off, sizeof(_ip6h), &_ip6h);
> +		if (!ip6h)
> +			return false;
> +
> +		nexthdr = ip6h->nexthdr;
> +		thoff = ipv6_skip_exthdr(skb, off + sizeof(_ip6h), &nexthdr,
> +					 &frag_off);
> +		if (thoff < 0 || nexthdr != IPPROTO_TCP || frag_off)
> +			return false;
> +
> +		t->saddr = ip6h->saddr;
> +		t->daddr = ip6h->daddr;
> +		off = thoff;
> +		break;
> +	}
> +	default:
> +		return false;
> +	}
> +
> +	th = skb_header_pointer(skb, off, sizeof(_th), &_th);
> +	if (!th)
> +		return false;
> +	t->sport = th->source;
> +	t->dport = th->dest;
> +	t->seq = ntohl(th->seq);
> +
> +	return true;
> +}
> +
> +/* No socket on RX yet, so match the tuple installed at ->tls_dev_add(), the
> + * way the hardware does.
> + */
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
> +		/* start_sn is the socket's copied_seq when the offload was
> +		 * installed, so a segment before it only carries bytes TCP
> +		 * has already received: tcp_data_queue() drops or trims those
> +		 * whatever we flag.  The check only keeps a pre-offload stream
> +		 * from being reported decrypted, so asking once is enough,
> +		 * and it also avoids the sequence space wrapping past a fixed
> +		 * start_sn 2G later.
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
> +
> +/* The stack leaves an uninitialized, tag sized gap at the tail of each record
> + * for the device to write the auth tag into.  We do not encrypt, so zero it
> + * to avoid leaking that memory onto the wire.  Nothing tells the device where
> + * the tag is, so walk the records with tls_get_record() and clear the end of
> + * each one's last frag.  Every segment of a record and any retransmit of it
> + * share these pages, which is why the record is cleared rather than the skb;
> + * nothing consumes the placeholder, so a clone seeing the write is harmless.
> + */
> +static void nsim_tls_tx_zero_tags(struct sk_buff *skb)
> +{
> +	struct tls_context *ctx = tls_get_ctx(skb->sk);
> +	const struct tcphdr *th = tcp_hdr(skb);
> +	struct tls_offload_context_tx *tx_ctx;
> +	u32 seq, end, tag_size;
> +	unsigned long flags;
> +	unsigned int off;
> +
> +	off = skb_transport_offset(skb) + __tcp_hdrlen(th);
> +	if (off >= skb->len)
> +		return;
> +
> +	tag_size = ctx->prot_info.tag_size;
> +	seq = ntohl(th->seq);
> +	end = seq + skb->len - off;
> +	tx_ctx = tls_offload_ctx_tx(ctx);
> +
> +	spin_lock_irqsave(&tx_ctx->lock, flags);
> +	while (before(seq, end)) {
> +		struct tls_record_info *record;
> +		skb_frag_t *frag;
> +		u64 rcd_sn;
> +
> +		record = tls_get_record(tx_ctx, seq, &rcd_sn);
> +		if (!record || tls_record_is_start_marker(record))
> +			break;
> +
> +		frag = &record->frags[record->num_frags - 1];
> +		memset(skb_frag_address(frag) + skb_frag_size(frag) - tag_size,
> +		       0, tag_size);
> +
> +		seq = record->end_seq;
> +	}
> +	spin_unlock_irqrestore(&tx_ctx->lock, flags);
> +}
> +
> +/* Stand in for the inline encryption the hardware would do on the way out.
> + * The stack has already framed the record and we do not encrypt, so
> + * skb->decrypted is not cleared for our own records and the tag is all that
> + * is left to deal with.  The socket is right here, so identify the connection
> + * the way the real drivers do.
> + */
> +static bool nsim_tls_tx(struct netdevsim *ns, struct sk_buff *skb)
> +{
> +	/* Not ours: the software fallback has already encrypted it.  Clear
> +	 * the decrypted mark the sending stack left so the peer's stack
> +	 * decrypts it.
> +	 */
> +	if (!tls_is_skb_tx_device_offloaded(skb) ||
> +	    rcu_dereference_bh(tls_get_ctx(skb->sk)->netdev) != ns->netdev) {
> +		skb->decrypted = 0;
> +		return false;
> +	}
> +
> +	nsim_tls_tx_zero_tags(skb);
> +	atomic64_inc(&ns->tls.tx_packets);
> +	atomic64_add(skb->len, &ns->tls.tx_bytes);
> +
> +	return true;
> +}
> +
> +/* Stand in for the inline decryption the peer's hardware would do, since we
> + * are about to hand the skb to its stack.
> + */
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
> +	atomic64_inc(&ns->tls.rx_packets);
> +	atomic64_add(skb->len, &ns->tls.rx_bytes);
> +}
> +
> +/* netdevsim has no wire: nsim_start_xmit() hands the skb straight to the
> + * peer's receive path, so this one call site stands in for the hardware of
> + * both ports.  It has to run before nsim_forward_skb() moves the skb over,
> + * which resets the headers.
> + */
> +void nsim_do_tls(struct sk_buff *skb, struct netdevsim *ns,
> +		 struct netdevsim *peer_ns)
> +{
> +	/* nsim_do_psp() ran first and may have wrapped the record stream, so
> +	 * this is no longer a plain TLS over TCP packet.  No NIC chains the
> +	 * two inline offloads either, so leave it alone.
> +	 */
> +	if (skb->encapsulation)
> +		return;
> +
> +	/* Only what this port just "encrypted" may skip decryption on the
> +	 * peer.  Everything else - a software kTLS sender because the TX
> +	 * feature is off, a frame injected on the tuple - really is
> +	 * ciphertext or not TLS at all, and the core has to deal with it.
> +	 */
> +	if (!nsim_tls_tx(ns, skb))
> +		return;
> +
> +	nsim_tls_rx(peer_ns, skb);
> +}
> +
> +static int nsim_tls_dev_add(struct net_device *netdev, struct sock *sk,
> +			    enum tls_offload_ctx_dir direction,
> +			    struct tls_crypto_info *crypto_info,
> +			    u32 start_offload_tcp_sn)
> +{
> +	struct netdevsim *ns = netdev_priv(netdev);
> +	struct nsim_tls_conn *conn;
> +	int ret = 0;
> +
> +	/* Mirror the cipher support of a typical offload capable NIC. */
> +	switch (crypto_info->cipher_type) {
> +	case TLS_CIPHER_AES_GCM_128:
> +	case TLS_CIPHER_AES_GCM_256:
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	conn = kzalloc_obj(*conn);
> +	if (!conn)
> +		return -ENOMEM;
> +
> +	if (sk->sk_family == AF_INET6) {
> +		conn->laddr = sk->sk_v6_rcv_saddr;
> +		conn->raddr = sk->sk_v6_daddr;
> +	} else {
> +		ipv6_addr_set_v4mapped(sk->sk_rcv_saddr, &conn->laddr);
> +		ipv6_addr_set_v4mapped(sk->sk_daddr, &conn->raddr);
> +	}
> +	conn->family = sk->sk_family;
> +	conn->lport = htons(inet_sk(sk)->inet_num);
> +	conn->rport = sk->sk_dport;
> +	conn->dir = direction;
> +	conn->start_sn = start_offload_tcp_sn;
> +	conn->cipher_type = crypto_info->cipher_type;
> +	conn->tls_ctx = tls_get_ctx(sk);
> +
> +	spin_lock_bh(&ns->tls.lock);
> +	if (ns->tls.count >= NSIM_TLS_MAX_CONN) {
> +		ret = -ENOSPC;
> +		goto out_unlock;
> +	}
> +	list_add_tail_rcu(&conn->list, &ns->tls.conns);
> +	WRITE_ONCE(ns->tls.count, ns->tls.count + 1);
> +	if (direction == TLS_OFFLOAD_CTX_DIR_TX)
> +		ns->tls.tx_conn++;
> +	else
> +		ns->tls.rx_conn++;
> +out_unlock:
> +	spin_unlock_bh(&ns->tls.lock);
> +
> +	if (ret)
> +		kfree(conn);
> +
> +	return ret;
> +}
> +
> +static void nsim_tls_dev_del(struct net_device *netdev,
> +			     struct tls_context *tls_ctx,
> +			     enum tls_offload_ctx_dir direction)
> +{
> +	struct netdevsim *ns = netdev_priv(netdev);
> +	struct nsim_tls_conn *conn;
> +
> +	spin_lock_bh(&ns->tls.lock);
> +	list_for_each_entry(conn, &ns->tls.conns, list) {
> +		if (conn->tls_ctx != tls_ctx || conn->dir != direction)
> +			continue;
> +
> +		list_del_rcu(&conn->list);
> +		WRITE_ONCE(ns->tls.count, ns->tls.count - 1);
> +		if (direction == TLS_OFFLOAD_CTX_DIR_TX)
> +			ns->tls.tx_conn--;
> +		else
> +			ns->tls.rx_conn--;
> +		spin_unlock_bh(&ns->tls.lock);
> +
> +		kfree_rcu(conn, rcu);
> +		return;
> +	}
> +	spin_unlock_bh(&ns->tls.lock);
> +
> +	netdev_err(netdev, "TLS %s context not found on del\n",
> +		   direction == TLS_OFFLOAD_CTX_DIR_TX ? "tx" : "rx");
> +}
> +
> +/* Never reached, the emulation never asks for a resync, but the core insists
> + * on it for NETIF_F_HW_TLS_RX.
> + */
> +static int nsim_tls_dev_resync(struct net_device *netdev, struct sock *sk,
> +			       u32 seq, u8 *rcd_sn,
> +			       enum tls_offload_ctx_dir direction)
> +{
> +	return 0;
> +}
> +
> +static const struct tlsdev_ops nsim_tlsdev_ops = {
> +	.tls_dev_add	= nsim_tls_dev_add,
> +	.tls_dev_del	= nsim_tls_dev_del,
> +	.tls_dev_resync	= nsim_tls_dev_resync,
> +};
> +
> +static ssize_t nsim_tls_dbg_read(struct file *filp, char __user *buffer,
> +				 size_t count, loff_t *ppos)
> +{
> +	struct netdevsim *ns = filp->private_data;
> +	struct nsim_tls_conn *conn;
> +	size_t bufsize;
> +	char *buf, *p;
> +	int len;
> +
> +	/* Two full IPv6 addresses and ports fit in 160 bytes a line. */
> +	bufsize = (NSIM_TLS_MAX_CONN * 160) + 200;
> +	buf = kzalloc(bufsize, GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	p = buf;
> +
> +	spin_lock_bh(&ns->tls.lock);
> +	p += scnprintf(p, bufsize - (p - buf),
> +		       "conn count=%u tx=%u rx=%u\n",
> +		       ns->tls.count, ns->tls.tx_conn, ns->tls.rx_conn);
> +	p += scnprintf(p, bufsize - (p - buf),
> +		       "tx_packets=%llu tx_bytes=%llu rx_packets=%llu rx_bytes=%llu\n",
> +		       atomic64_read(&ns->tls.tx_packets),
> +		       atomic64_read(&ns->tls.tx_bytes),
> +		       atomic64_read(&ns->tls.rx_packets),
> +		       atomic64_read(&ns->tls.rx_bytes));
> +
> +	list_for_each_entry(conn, &ns->tls.conns, list) {
> +		if (conn->family == AF_INET6)
> +			p += scnprintf(p, bufsize - (p - buf),
> +				       "%s [%pI6c]:%u -> [%pI6c]:%u cipher=%u sn=%u\n",
> +				       conn->dir == TLS_OFFLOAD_CTX_DIR_TX ?
> +				       "tx" : "rx",
> +				       &conn->laddr, ntohs(conn->lport),
> +				       &conn->raddr, ntohs(conn->rport),
> +				       conn->cipher_type, conn->start_sn);
> +		else
> +			p += scnprintf(p, bufsize - (p - buf),
> +				       "%s %pI4:%u -> %pI4:%u cipher=%u sn=%u\n",
> +				       conn->dir == TLS_OFFLOAD_CTX_DIR_TX ?
> +				       "tx" : "rx",
> +				       &conn->laddr.s6_addr32[3],
> +				       ntohs(conn->lport),
> +				       &conn->raddr.s6_addr32[3],
> +				       ntohs(conn->rport),
> +				       conn->cipher_type, conn->start_sn);
> +	}
> +	spin_unlock_bh(&ns->tls.lock);
> +
> +	len = simple_read_from_buffer(buffer, count, ppos, buf, p - buf);
> +
> +	kfree(buf);
> +
> +	return len;
> +}
> +
> +static const struct file_operations nsim_tls_dbg_fops = {
> +	.owner = THIS_MODULE,
> +	.open = simple_open,
> +	.read = nsim_tls_dbg_read,
> +	.llseek = default_llseek,
> +};
> +
> +void nsim_tls_init(struct netdevsim *ns)
> +{
> +	INIT_LIST_HEAD(&ns->tls.conns);
> +	spin_lock_init(&ns->tls.lock);
> +
> +	ns->netdev->tlsdev_ops = &nsim_tlsdev_ops;
> +	ns->netdev->features |= NSIM_TLS_FEATURES;
> +	ns->netdev->hw_features |= NSIM_TLS_FEATURES;
> +
> +	ns->tls.dfile = debugfs_create_file("tls", 0400,
> +					    ns->nsim_dev_port->ddir, ns,
> +					    &nsim_tls_dbg_fops);
> +}
> +
> +void nsim_tls_teardown(struct netdevsim *ns)
> +{
> +	struct nsim_tls_conn *conn, *tmp;
> +	u32 left;
> +
> +	debugfs_remove_recursive(ns->tls.dfile);
> +
> +	spin_lock_bh(&ns->tls.lock);
> +	left = ns->tls.count;
> +	list_for_each_entry_safe(conn, tmp, &ns->tls.conns, list) {
> +		list_del_rcu(&conn->list);
> +		kfree_rcu(conn, rcu);
> +	}
> +	WRITE_ONCE(ns->tls.count, 0);
> +	ns->tls.tx_conn = 0;
> +	ns->tls.rx_conn = 0;
> +	spin_unlock_bh(&ns->tls.lock);
> +
> +	if (left)
> +		netdev_err(ns->netdev,
> +			   "tearing down TLS offload with %u connections left\n",
> +			   left);
> +}

[Severity: Medium]
Does this build with CONFIG_IPV6=n?

sk_v6_rcv_saddr and sk_v6_daddr are aliases for skc_v6_rcv_saddr and
skc_v6_daddr in struct sock_common. include/net/sock.h only defines
those members inside #if IS_ENABLED(CONFIG_IPV6).

Neither NETDEVSIM nor TLS/TLS_DEVICE depends on IPV6. They only depend
on INET. So a config with INET=y, IPV6=n, TLS_DEVICE=y and NETDEVSIM=y
or m adds tls.o to netdevsim, and nsim_tls_dev_add() then fails to
compile.

Other users in the tree guard these fields, for example netdevsim's
own psp.c and nfp_net_tls_add() in the nfp kTLS code. Should the
AF_INET6 branch here be wrapped in #if IS_ENABLED(CONFIG_IPV6) the
same way?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117140642.4008-1-jiayuan.chen%40linux.dev

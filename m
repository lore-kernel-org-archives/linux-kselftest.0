Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.68
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924435;
	b=S6UkedWrGfZus+uv4VaQq/HgqgavPmg96jDKXEREcy6uSR/f9xK6qWE6fGeCBAn/5SUU
	 rKOSOVkoC2OYYAM4M25Gm3S5GVs8nS8Zvc6d4O/A0Zu6pO1DgXq3kR2YMU+sVgTHra867
	 fpzwddL4T5ZXH8CgKKA/JoajojVD87rfy/IqSKRPQ4lzoYjcwyPjWfbx0vS869mI/N4oz
	 35Rg4s+WeYICm19mbo1X2Q+NoOEfQNBCO27IuvEQviCpgIVXecgvDxRHbZRAzzaoNXEhZ
	 czV2sxx9ngcr+X4ul2zRlroOJR/4/1TVezhPtby2WZWf1SMzxc564ogDspJijfZJgTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924435;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=usmgKHg/CyvfNKWnXf/fOBbFqpCj7ZzztacD1wthWGw=;
	b=iBJU+pZmP4awX0x4fWlyIuiqenIOjyNKHZtXEVe9M9LhOQ0dwOAXfky4FbcBc3qxfs7L
	 3UIuznr41VlA0EcFjlOJ5ChUFcoKQBlfvhbOS29FUHWG7Z6cYEFoW7iQqaAevwdn9L8WI
	 rk8CP82AQ66Qtaq9M6SE7N/5DOVisi1FDBdQhQu6kGP/4PMU+H53mUReBmpdl8kuEZlNl
	 TNaXND+zFleKlInR6h6PqxQek7nrSOlGQT52Avbf7HgAQYP16tLGj4pCJ4OZ6X1HPGTv1
	 uVi9Slq0Ryqc+pTpJR3UWO3UBjUko0b0TIc7xRhxmR4V/RcQIp2W89J6yEHf3BWp4Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=e5ChFn+p;
	arc=none smtp.remote-ip=95.215.58.68
Received: from mta1.migadu.com (out-68.mta1.migadu.com [95.215.58.68])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F70606A323
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 14:07:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2F70606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=e5ChFn+p
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Bqt+m5a1sduVQfucTd8G4Cdgfugc90DmdKC7KluP89k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794924432; v=1; x=1795529232;
 b=e5ChFn+p5MHxsGyf2xggeU5wrBOrBwGCWvIdxuchBS5dxB0E7Seg4BQt9eS2GoUcl782ugRi
 jnblkVFSCloOiALr6RshbcDfPtL7FCLJ+cc73wt9kDjPc88YZ8vSPNrdrB+klSYtdfy6qyiZyL+
 hgZTrTIGzf2thlt0fT91/OZc=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1150bc13f980e02a;
	Tue, 17 Nov 2026 14:07:12 +0000
X-Mizu-Trace-ID: 1150bc13f980e02a
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org,
	kuba@kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	John Fastabend <john.fastabend@gmail.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v2 1/2] netdevsim: add TLS device offload emulation
Date: Tue, 17 Nov 2026 22:06:30 +0800
Message-ID: <20261117140642.4008-2-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117140642.4008-1-jiayuan.chen@linux.dev>
References: <20261117140642.4008-1-jiayuan.chen@linux.dev>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement tlsdev_ops and advertise NETIF_F_HW_TLS_TX/RX, so kTLS sockets
routed over netdevsim take the device path in net/tls/tls_device.c
instead of the software one.

The point of this is code coverage and control path testing.  Nothing is
actually encrypted or decrypted, and no guarantees are made for the
corner cases where the crypto would have had to be right.

TX puts the plaintext record on the wire and RX just sets skb->decrypted,
so the RX side has to be offloaded on netdevsim as well: otherwise the
core runs the software AEAD over plaintext and fails the connection with
-EBADMSG.  The other way round, software TX into an offloaded RX, is
real ciphertext and works.  A record the core has already encrypted
itself, through the software fallback, is left alone except for the
decrypted mark the sending stack put on the skb: with no wire in between
that would reach the peer as is, so it is cleared and the peer's stack
decrypts.  The one thing a device would still do is write the
authentication tag, and the placeholder the stack leaves for it comes
from a page frag that is never zeroed, so clear it instead of putting
stale page contents on the wire.  Records are located with
tls_get_record(), the way the real drivers do it; on RX, where there is
no socket yet, connections are matched on the tuple from ->tls_dev_add()
the way the hardware does.

NETIF_F_RXCSUM comes along because netdev_fix_features() drops
NETIF_F_HW_TLS_RX without it.  NETDEVSIM can't be built in with TLS as a
module since it calls tls_get_record().

Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
 drivers/net/Kconfig               |   1 +
 drivers/net/netdevsim/Makefile    |   4 +
 drivers/net/netdevsim/netdev.c    |   9 +-
 drivers/net/netdevsim/netdevsim.h |  34 +++
 drivers/net/netdevsim/tls.c       | 477 ++++++++++++++++++++++++++++++
 5 files changed, 523 insertions(+), 2 deletions(-)
 create mode 100644 drivers/net/netdevsim/tls.c

diff --git a/drivers/net/Kconfig b/drivers/net/Kconfig
index ff79c466712df..cb4d4bb87afc2 100644
--- a/drivers/net/Kconfig
+++ b/drivers/net/Kconfig
@@ -607,6 +607,7 @@ config NETDEVSIM
 	depends on INET
 	depends on PSAMPLE || PSAMPLE=n
 	depends on PTP_1588_CLOCK_MOCK || PTP_1588_CLOCK_MOCK=n
+	depends on TLS || TLS=n
 	select NET_DEVLINK
 	select PAGE_POOL
 	select NET_SHAPER
diff --git a/drivers/net/netdevsim/Makefile b/drivers/net/netdevsim/Makefile
index 87718204fb4de..c7f7621323b2b 100644
--- a/drivers/net/netdevsim/Makefile
+++ b/drivers/net/netdevsim/Makefile
@@ -25,3 +25,7 @@ endif
 ifneq ($(CONFIG_MACSEC),)
 netdevsim-objs += macsec.o
 endif
+
+ifneq ($(CONFIG_TLS_DEVICE),)
+netdevsim-objs += tls.o
+endif
diff --git a/drivers/net/netdevsim/netdev.c b/drivers/net/netdevsim/netdev.c
index 0372a9bd63bbb..8a6f16a318ccd 100644
--- a/drivers/net/netdevsim/netdev.c
+++ b/drivers/net/netdevsim/netdev.c
@@ -155,6 +155,8 @@ static netdev_tx_t nsim_start_xmit(struct sk_buff *skb, struct net_device *dev)
 	if (dr)
 		goto out_drop_free;
 
+	nsim_do_tls(skb, ns, peer_ns);
+
 	rxq = skb_get_queue_mapping(skb);
 	if (rxq >= peer_dev->num_rx_queues)
 		rxq = rxq % peer_dev->num_rx_queues;
@@ -1097,10 +1099,11 @@ static int nsim_init_netdevsim(struct netdevsim *ns)
 
 	nsim_macsec_init(ns);
 	nsim_ipsec_init(ns);
+	nsim_tls_init(ns);
 
 	err = register_netdevice(ns->netdev);
 	if (err)
-		goto err_ipsec_teardown;
+		goto err_teardown;
 	rtnl_unlock();
 
 	err = nsim_psp_init(ns);
@@ -1123,7 +1126,8 @@ static int nsim_init_netdevsim(struct netdevsim *ns)
 		RCU_INIT_POINTER(peer->peer, NULL);
 	RCU_INIT_POINTER(ns->peer, NULL);
 	unregister_netdevice(ns->netdev);
-err_ipsec_teardown:
+err_teardown:
+	nsim_tls_teardown(ns);
 	nsim_ipsec_teardown(ns);
 	nsim_macsec_teardown(ns);
 	nsim_bpf_uninit(ns);
@@ -1226,6 +1230,7 @@ void nsim_destroy(struct netdevsim *ns)
 	RCU_INIT_POINTER(ns->peer, NULL);
 	unregister_netdevice(dev);
 	if (nsim_dev_port_is_pf(ns->nsim_dev_port)) {
+		nsim_tls_teardown(ns);
 		nsim_macsec_teardown(ns);
 		nsim_ipsec_teardown(ns);
 		nsim_bpf_uninit(ns);
diff --git a/drivers/net/netdevsim/netdevsim.h b/drivers/net/netdevsim/netdevsim.h
index 2aa7ea924396e..5c14033ab507f 100644
--- a/drivers/net/netdevsim/netdevsim.h
+++ b/drivers/net/netdevsim/netdevsim.h
@@ -56,6 +56,19 @@ struct nsim_ipsec {
 	u32 tx;
 };
 
+struct nsim_tls {
+	struct list_head conns;
+	spinlock_t lock;	/* protects conns and the counters below */
+	struct dentry *dfile;
+	u32 count;
+	u32 tx_conn;
+	u32 rx_conn;
+	atomic64_t tx_packets;
+	atomic64_t tx_bytes;
+	atomic64_t rx_packets;
+	atomic64_t rx_bytes;
+};
+
 #define NSIM_MACSEC_MAX_SECY_COUNT 3
 #define NSIM_MACSEC_MAX_RXSC_COUNT 1
 struct nsim_rxsc {
@@ -143,6 +156,7 @@ struct netdevsim {
 	bool bpf_map_accept;
 	struct nsim_ipsec ipsec;
 	struct nsim_macsec macsec;
+	struct nsim_tls tls;
 	struct nsim_vlan vlan;
 	struct {
 		u32 inject_error;
@@ -436,6 +450,26 @@ static inline bool nsim_ipsec_tx(struct netdevsim *ns, struct sk_buff *skb)
 }
 #endif
 
+#if IS_ENABLED(CONFIG_TLS_DEVICE)
+void nsim_tls_init(struct netdevsim *ns);
+void nsim_tls_teardown(struct netdevsim *ns);
+void nsim_do_tls(struct sk_buff *skb, struct netdevsim *ns,
+		 struct netdevsim *peer_ns);
+#else
+static inline void nsim_tls_init(struct netdevsim *ns)
+{
+}
+
+static inline void nsim_tls_teardown(struct netdevsim *ns)
+{
+}
+
+static inline void nsim_do_tls(struct sk_buff *skb, struct netdevsim *ns,
+			       struct netdevsim *peer_ns)
+{
+}
+#endif
+
 #if IS_ENABLED(CONFIG_MACSEC)
 void nsim_macsec_init(struct netdevsim *ns);
 void nsim_macsec_teardown(struct netdevsim *ns);
diff --git a/drivers/net/netdevsim/tls.c b/drivers/net/netdevsim/tls.c
new file mode 100644
index 0000000000000..cad9b262da441
--- /dev/null
+++ b/drivers/net/netdevsim/tls.c
@@ -0,0 +1,477 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/ipv6.h>
+#include <linux/list.h>
+#include <linux/skbuff.h>
+#include <linux/slab.h>
+#include <linux/tcp.h>
+#include <net/ip.h>
+#include <net/ipv6.h>
+#include <net/tcp.h>
+#include <net/tls.h>
+
+#include "netdevsim.h"
+
+/* Emulated kTLS offload.  No crypto is performed: TX puts the record on the
+ * wire as plaintext and RX marks it decrypted, so the RX side has to be
+ * offloaded on netdevsim as well, otherwise the core runs the software AEAD
+ * over plaintext and fails the connection with -EBADMSG.  The other way
+ * round, software TX into an offloaded RX, is real ciphertext and works.
+ */
+
+#define NSIM_TLS_MAX_CONN	32
+
+/* netdev_fix_features() drops NETIF_F_HW_TLS_RX unless the device also does
+ * RX checksums, which every offload capable NIC does.
+ */
+#define NSIM_TLS_FEATURES	(NETIF_F_HW_TLS_TX | NETIF_F_HW_TLS_RX | \
+				 NETIF_F_RXCSUM)
+
+struct nsim_tls_conn {
+	struct list_head list;
+	struct rcu_head rcu;
+
+	/* Identity as seen on the wire, from the point of view of the port
+	 * the offload was installed on: l* is this side, r* is the peer.
+	 */
+	struct in6_addr laddr;
+	struct in6_addr raddr;
+	__be16 lport;
+	__be16 rport;
+	u16 family;
+
+	enum tls_offload_ctx_dir dir;
+	u32 start_sn;
+	bool started;
+	u16 cipher_type;
+	const struct tls_context *tls_ctx;
+};
+
+struct nsim_tls_tuple {
+	struct in6_addr saddr;
+	struct in6_addr daddr;
+	__be16 sport;
+	__be16 dport;
+	u32 seq;
+};
+
+/* Parse the tuple from the frame the way a NIC would.  The xmit skb is not
+ * always a well formed local TCP skb (AF_PACKET, tc redirect); use
+ * skb_header_pointer() so a non-linear or truncated header cannot be misread.
+ */
+static bool nsim_tls_parse(const struct sk_buff *skb,
+			   struct nsim_tls_tuple *t)
+{
+	int off = skb_network_offset(skb);
+	const struct tcphdr *th;
+	struct tcphdr _th;
+
+	switch (skb->protocol) {
+	case htons(ETH_P_IP): {
+		const struct iphdr *iph;
+		struct iphdr _iph;
+
+		iph = skb_header_pointer(skb, off, sizeof(_iph), &_iph);
+		if (!iph || iph->version != 4 || iph->ihl < 5 ||
+		    iph->protocol != IPPROTO_TCP || ip_is_fragment(iph))
+			return false;
+		ipv6_addr_set_v4mapped(iph->saddr, &t->saddr);
+		ipv6_addr_set_v4mapped(iph->daddr, &t->daddr);
+		off += iph->ihl * 4;
+		break;
+	}
+	case htons(ETH_P_IPV6): {
+		const struct ipv6hdr *ip6h;
+		struct ipv6hdr _ip6h;
+		__be16 frag_off;
+		u8 nexthdr;
+		int thoff;
+
+		ip6h = skb_header_pointer(skb, off, sizeof(_ip6h), &_ip6h);
+		if (!ip6h)
+			return false;
+
+		nexthdr = ip6h->nexthdr;
+		thoff = ipv6_skip_exthdr(skb, off + sizeof(_ip6h), &nexthdr,
+					 &frag_off);
+		if (thoff < 0 || nexthdr != IPPROTO_TCP || frag_off)
+			return false;
+
+		t->saddr = ip6h->saddr;
+		t->daddr = ip6h->daddr;
+		off = thoff;
+		break;
+	}
+	default:
+		return false;
+	}
+
+	th = skb_header_pointer(skb, off, sizeof(_th), &_th);
+	if (!th)
+		return false;
+	t->sport = th->source;
+	t->dport = th->dest;
+	t->seq = ntohl(th->seq);
+
+	return true;
+}
+
+/* No socket on RX yet, so match the tuple installed at ->tls_dev_add(), the
+ * way the hardware does.
+ */
+static bool nsim_tls_rx_offloaded(struct netdevsim *ns,
+				  const struct nsim_tls_tuple *t)
+{
+	struct nsim_tls_conn *conn;
+
+	list_for_each_entry_rcu(conn, &ns->tls.conns, list) {
+		if (conn->dir != TLS_OFFLOAD_CTX_DIR_RX ||
+		    conn->lport != t->dport || conn->rport != t->sport ||
+		    !ipv6_addr_equal(&conn->laddr, &t->daddr) ||
+		    !ipv6_addr_equal(&conn->raddr, &t->saddr))
+			continue;
+
+		/* start_sn is the socket's copied_seq when the offload was
+		 * installed, so a segment before it only carries bytes TCP
+		 * has already received: tcp_data_queue() drops or trims those
+		 * whatever we flag.  The check only keeps a pre-offload stream
+		 * from being reported decrypted, so asking once is enough,
+		 * and it also avoids the sequence space wrapping past a fixed
+		 * start_sn 2G later.
+		 */
+		if (!READ_ONCE(conn->started)) {
+			if (before(t->seq, conn->start_sn))
+				return false;
+			WRITE_ONCE(conn->started, true);
+		}
+
+		return true;
+	}
+
+	return false;
+}
+
+/* The stack leaves an uninitialized, tag sized gap at the tail of each record
+ * for the device to write the auth tag into.  We do not encrypt, so zero it
+ * to avoid leaking that memory onto the wire.  Nothing tells the device where
+ * the tag is, so walk the records with tls_get_record() and clear the end of
+ * each one's last frag.  Every segment of a record and any retransmit of it
+ * share these pages, which is why the record is cleared rather than the skb;
+ * nothing consumes the placeholder, so a clone seeing the write is harmless.
+ */
+static void nsim_tls_tx_zero_tags(struct sk_buff *skb)
+{
+	struct tls_context *ctx = tls_get_ctx(skb->sk);
+	const struct tcphdr *th = tcp_hdr(skb);
+	struct tls_offload_context_tx *tx_ctx;
+	u32 seq, end, tag_size;
+	unsigned long flags;
+	unsigned int off;
+
+	off = skb_transport_offset(skb) + __tcp_hdrlen(th);
+	if (off >= skb->len)
+		return;
+
+	tag_size = ctx->prot_info.tag_size;
+	seq = ntohl(th->seq);
+	end = seq + skb->len - off;
+	tx_ctx = tls_offload_ctx_tx(ctx);
+
+	spin_lock_irqsave(&tx_ctx->lock, flags);
+	while (before(seq, end)) {
+		struct tls_record_info *record;
+		skb_frag_t *frag;
+		u64 rcd_sn;
+
+		record = tls_get_record(tx_ctx, seq, &rcd_sn);
+		if (!record || tls_record_is_start_marker(record))
+			break;
+
+		frag = &record->frags[record->num_frags - 1];
+		memset(skb_frag_address(frag) + skb_frag_size(frag) - tag_size,
+		       0, tag_size);
+
+		seq = record->end_seq;
+	}
+	spin_unlock_irqrestore(&tx_ctx->lock, flags);
+}
+
+/* Stand in for the inline encryption the hardware would do on the way out.
+ * The stack has already framed the record and we do not encrypt, so
+ * skb->decrypted is not cleared for our own records and the tag is all that
+ * is left to deal with.  The socket is right here, so identify the connection
+ * the way the real drivers do.
+ */
+static bool nsim_tls_tx(struct netdevsim *ns, struct sk_buff *skb)
+{
+	/* Not ours: the software fallback has already encrypted it.  Clear
+	 * the decrypted mark the sending stack left so the peer's stack
+	 * decrypts it.
+	 */
+	if (!tls_is_skb_tx_device_offloaded(skb) ||
+	    rcu_dereference_bh(tls_get_ctx(skb->sk)->netdev) != ns->netdev) {
+		skb->decrypted = 0;
+		return false;
+	}
+
+	nsim_tls_tx_zero_tags(skb);
+	atomic64_inc(&ns->tls.tx_packets);
+	atomic64_add(skb->len, &ns->tls.tx_bytes);
+
+	return true;
+}
+
+/* Stand in for the inline decryption the peer's hardware would do, since we
+ * are about to hand the skb to its stack.
+ */
+static void nsim_tls_rx(struct netdevsim *ns, struct sk_buff *skb)
+{
+	struct nsim_tls_tuple t;
+
+	/* Not every port registers the offload, and one that does not never
+	 * initializes the list head, so gate on the count.  It is the
+	 * cheaper test anyway.
+	 */
+	if (!READ_ONCE(ns->tls.count))
+		return;
+
+	if (!nsim_tls_parse(skb, &t))
+		return;
+
+	if (!nsim_tls_rx_offloaded(ns, &t))
+		return;
+
+	skb->decrypted = 1;
+	atomic64_inc(&ns->tls.rx_packets);
+	atomic64_add(skb->len, &ns->tls.rx_bytes);
+}
+
+/* netdevsim has no wire: nsim_start_xmit() hands the skb straight to the
+ * peer's receive path, so this one call site stands in for the hardware of
+ * both ports.  It has to run before nsim_forward_skb() moves the skb over,
+ * which resets the headers.
+ */
+void nsim_do_tls(struct sk_buff *skb, struct netdevsim *ns,
+		 struct netdevsim *peer_ns)
+{
+	/* nsim_do_psp() ran first and may have wrapped the record stream, so
+	 * this is no longer a plain TLS over TCP packet.  No NIC chains the
+	 * two inline offloads either, so leave it alone.
+	 */
+	if (skb->encapsulation)
+		return;
+
+	/* Only what this port just "encrypted" may skip decryption on the
+	 * peer.  Everything else - a software kTLS sender because the TX
+	 * feature is off, a frame injected on the tuple - really is
+	 * ciphertext or not TLS at all, and the core has to deal with it.
+	 */
+	if (!nsim_tls_tx(ns, skb))
+		return;
+
+	nsim_tls_rx(peer_ns, skb);
+}
+
+static int nsim_tls_dev_add(struct net_device *netdev, struct sock *sk,
+			    enum tls_offload_ctx_dir direction,
+			    struct tls_crypto_info *crypto_info,
+			    u32 start_offload_tcp_sn)
+{
+	struct netdevsim *ns = netdev_priv(netdev);
+	struct nsim_tls_conn *conn;
+	int ret = 0;
+
+	/* Mirror the cipher support of a typical offload capable NIC. */
+	switch (crypto_info->cipher_type) {
+	case TLS_CIPHER_AES_GCM_128:
+	case TLS_CIPHER_AES_GCM_256:
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	conn = kzalloc_obj(*conn);
+	if (!conn)
+		return -ENOMEM;
+
+	if (sk->sk_family == AF_INET6) {
+		conn->laddr = sk->sk_v6_rcv_saddr;
+		conn->raddr = sk->sk_v6_daddr;
+	} else {
+		ipv6_addr_set_v4mapped(sk->sk_rcv_saddr, &conn->laddr);
+		ipv6_addr_set_v4mapped(sk->sk_daddr, &conn->raddr);
+	}
+	conn->family = sk->sk_family;
+	conn->lport = htons(inet_sk(sk)->inet_num);
+	conn->rport = sk->sk_dport;
+	conn->dir = direction;
+	conn->start_sn = start_offload_tcp_sn;
+	conn->cipher_type = crypto_info->cipher_type;
+	conn->tls_ctx = tls_get_ctx(sk);
+
+	spin_lock_bh(&ns->tls.lock);
+	if (ns->tls.count >= NSIM_TLS_MAX_CONN) {
+		ret = -ENOSPC;
+		goto out_unlock;
+	}
+	list_add_tail_rcu(&conn->list, &ns->tls.conns);
+	WRITE_ONCE(ns->tls.count, ns->tls.count + 1);
+	if (direction == TLS_OFFLOAD_CTX_DIR_TX)
+		ns->tls.tx_conn++;
+	else
+		ns->tls.rx_conn++;
+out_unlock:
+	spin_unlock_bh(&ns->tls.lock);
+
+	if (ret)
+		kfree(conn);
+
+	return ret;
+}
+
+static void nsim_tls_dev_del(struct net_device *netdev,
+			     struct tls_context *tls_ctx,
+			     enum tls_offload_ctx_dir direction)
+{
+	struct netdevsim *ns = netdev_priv(netdev);
+	struct nsim_tls_conn *conn;
+
+	spin_lock_bh(&ns->tls.lock);
+	list_for_each_entry(conn, &ns->tls.conns, list) {
+		if (conn->tls_ctx != tls_ctx || conn->dir != direction)
+			continue;
+
+		list_del_rcu(&conn->list);
+		WRITE_ONCE(ns->tls.count, ns->tls.count - 1);
+		if (direction == TLS_OFFLOAD_CTX_DIR_TX)
+			ns->tls.tx_conn--;
+		else
+			ns->tls.rx_conn--;
+		spin_unlock_bh(&ns->tls.lock);
+
+		kfree_rcu(conn, rcu);
+		return;
+	}
+	spin_unlock_bh(&ns->tls.lock);
+
+	netdev_err(netdev, "TLS %s context not found on del\n",
+		   direction == TLS_OFFLOAD_CTX_DIR_TX ? "tx" : "rx");
+}
+
+/* Never reached, the emulation never asks for a resync, but the core insists
+ * on it for NETIF_F_HW_TLS_RX.
+ */
+static int nsim_tls_dev_resync(struct net_device *netdev, struct sock *sk,
+			       u32 seq, u8 *rcd_sn,
+			       enum tls_offload_ctx_dir direction)
+{
+	return 0;
+}
+
+static const struct tlsdev_ops nsim_tlsdev_ops = {
+	.tls_dev_add	= nsim_tls_dev_add,
+	.tls_dev_del	= nsim_tls_dev_del,
+	.tls_dev_resync	= nsim_tls_dev_resync,
+};
+
+static ssize_t nsim_tls_dbg_read(struct file *filp, char __user *buffer,
+				 size_t count, loff_t *ppos)
+{
+	struct netdevsim *ns = filp->private_data;
+	struct nsim_tls_conn *conn;
+	size_t bufsize;
+	char *buf, *p;
+	int len;
+
+	/* Two full IPv6 addresses and ports fit in 160 bytes a line. */
+	bufsize = (NSIM_TLS_MAX_CONN * 160) + 200;
+	buf = kzalloc(bufsize, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	p = buf;
+
+	spin_lock_bh(&ns->tls.lock);
+	p += scnprintf(p, bufsize - (p - buf),
+		       "conn count=%u tx=%u rx=%u\n",
+		       ns->tls.count, ns->tls.tx_conn, ns->tls.rx_conn);
+	p += scnprintf(p, bufsize - (p - buf),
+		       "tx_packets=%llu tx_bytes=%llu rx_packets=%llu rx_bytes=%llu\n",
+		       atomic64_read(&ns->tls.tx_packets),
+		       atomic64_read(&ns->tls.tx_bytes),
+		       atomic64_read(&ns->tls.rx_packets),
+		       atomic64_read(&ns->tls.rx_bytes));
+
+	list_for_each_entry(conn, &ns->tls.conns, list) {
+		if (conn->family == AF_INET6)
+			p += scnprintf(p, bufsize - (p - buf),
+				       "%s [%pI6c]:%u -> [%pI6c]:%u cipher=%u sn=%u\n",
+				       conn->dir == TLS_OFFLOAD_CTX_DIR_TX ?
+				       "tx" : "rx",
+				       &conn->laddr, ntohs(conn->lport),
+				       &conn->raddr, ntohs(conn->rport),
+				       conn->cipher_type, conn->start_sn);
+		else
+			p += scnprintf(p, bufsize - (p - buf),
+				       "%s %pI4:%u -> %pI4:%u cipher=%u sn=%u\n",
+				       conn->dir == TLS_OFFLOAD_CTX_DIR_TX ?
+				       "tx" : "rx",
+				       &conn->laddr.s6_addr32[3],
+				       ntohs(conn->lport),
+				       &conn->raddr.s6_addr32[3],
+				       ntohs(conn->rport),
+				       conn->cipher_type, conn->start_sn);
+	}
+	spin_unlock_bh(&ns->tls.lock);
+
+	len = simple_read_from_buffer(buffer, count, ppos, buf, p - buf);
+
+	kfree(buf);
+
+	return len;
+}
+
+static const struct file_operations nsim_tls_dbg_fops = {
+	.owner = THIS_MODULE,
+	.open = simple_open,
+	.read = nsim_tls_dbg_read,
+	.llseek = default_llseek,
+};
+
+void nsim_tls_init(struct netdevsim *ns)
+{
+	INIT_LIST_HEAD(&ns->tls.conns);
+	spin_lock_init(&ns->tls.lock);
+
+	ns->netdev->tlsdev_ops = &nsim_tlsdev_ops;
+	ns->netdev->features |= NSIM_TLS_FEATURES;
+	ns->netdev->hw_features |= NSIM_TLS_FEATURES;
+
+	ns->tls.dfile = debugfs_create_file("tls", 0400,
+					    ns->nsim_dev_port->ddir, ns,
+					    &nsim_tls_dbg_fops);
+}
+
+void nsim_tls_teardown(struct netdevsim *ns)
+{
+	struct nsim_tls_conn *conn, *tmp;
+	u32 left;
+
+	debugfs_remove_recursive(ns->tls.dfile);
+
+	spin_lock_bh(&ns->tls.lock);
+	left = ns->tls.count;
+	list_for_each_entry_safe(conn, tmp, &ns->tls.conns, list) {
+		list_del_rcu(&conn->list);
+		kfree_rcu(conn, rcu);
+	}
+	WRITE_ONCE(ns->tls.count, 0);
+	ns->tls.tx_conn = 0;
+	ns->tls.rx_conn = 0;
+	spin_unlock_bh(&ns->tls.lock);
+
+	if (left)
+		netdev_err(ns->netdev,
+			   "tearing down TLS offload with %u connections left\n",
+			   left);
+}
-- 
2.43.0


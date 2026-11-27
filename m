Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772832;
	b=4iMETX05NWmrfc+czHXHVFeh3kCA/McUZzYn78IBZPy1dOXfo6zTlUFQy1rFFZx9KnLh
	 yW+1TZfF8RJIdSIhMzV5MKElmMb3iwOdCAO7wzIIlCR5KvW45cFZIh6U/NDVOR4RINtcc
	 1pQ5DIz7PZeLrUaqPlY49SHa4djwU6YDPbvzBqkm3A3FHSyJbPhncBaXASbSuabN7C0+d
	 1Cs1NCrd8KzDEa6hYa+oZ3KStnX2ViPEUoGFxlTMKEzjx9cjmnMHIZHx20b0o3UMmZqYk
	 A6AjgiudWxfnOTqkEp5iDJMRZC/gha/ntao9lZE4wr4vPK0+K+n3YW0za/POckk8N5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772832;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=I939LjG+YLgWKoI3f7zUtLuNd7cY8RJ19j4ppNVFzG0=;
	b=pQhC5H93PQu5JhQYhyZ0Xgaxq686IRqyW/+6Em8BX7rJBJE20PXTOqkyw08BBnXqGJkb
	 HVtXyUxyhqmOw2+ph3/3SLbOvyVXFVa0GDOOKlHFFeaIxK4I031doM1eFsv1+4XiMiBVq
	 qjlZX5nVR8EO2RM9aCWQPXjb42lkUKKgG2sDCaUzPMSNoNlZIlkUh6d5Mr0xUYG6Jhpls
	 KJiAKcNZG0NHTEVgRlpLca1Jbdr14KaL/YvmbQl7Y/baTign2FXzfcgPFCf/9eRoWNHKI
	 oAyDYbD3xRAD8BDARlepmawEvrg5SpStgetdZZZs4sjiUauTFppue2CyFSoliA97RIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=E6UPSQLo;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2181606A682
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 09:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2181606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=E6UPSQLo
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-170135e43c7so12275532c88.0
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 01:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795772831; x=1796377631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I939LjG+YLgWKoI3f7zUtLuNd7cY8RJ19j4ppNVFzG0=;
        b=E6UPSQLoqf8HmcWZoK1WRjBBceghtN/tKPJTEfIZtyKJcDNl5lRvT/FzKX9Q8pDyT9
         000k4roLSCri2nGygtj6+J5IFA0P7fT89zv7Wgm8AJl6nj0EbdDgMYEFBvSBKowAQpbs
         da3KGUAQZSzkvKeKnOLaFNrrs3BhFcmZdw2LAKJ2WPbfA+PGAKltS5MMzmuGHcX20mef
         TtHcCvPzihtKoPosrnCsJJl7qRjGRPGXjqLY4pRmsX2qGrn5iKZlQt1QkNLvFjhk6lR8
         Y+WrmU9bWuVOiZXxtxTtKdNCxYknAsY8CyPgoWs6RBJE+rx0DHZEbEVIRIclLsMdsDfT
         a25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772831; x=1796377631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I939LjG+YLgWKoI3f7zUtLuNd7cY8RJ19j4ppNVFzG0=;
        b=oQNQvkds/b9JdT2VGMxrsC0IwbIEFISUbhfI4QCziYqkWwB5LM9CPFHLvDKA/7kSn5
         7ZuKx7hOAiGrN6ZN/BsAGWDluVBikvp/1u3vx8ItoAC2/1UQQoquuImLuJwaBAdOwnO/
         gTmKvzR8B1GvyI5Mx4yMCA70jUZ/trdrbQHzeiU4xeDJeuRbLHV+PYgwt5427jBjYZun
         Xlvzcgab+Ofwbq3QPrtTJdbBnQ3LugH2mj1tvT5NRAosTfBFnT8yvwH0kC8+a9APkXup
         yacGKjzikFVHJguGpgzwKg64q36JS8qKflS/Y9GqkJxQVfO2pvpQKm0sdeGDGndD8aB6
         XbJA==
X-Forwarded-Encrypted: i=1; AL+hErFAlEbkbiOwKLoqPToOh96Wt4VZrWY0OeCqoSsMS1KfHcKd0m1AWDUbOoaLFN+ny22lUBVkjKsOzLQL15WGJq4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EcbI0BKwPLaOzRI9j46a+ZVDBemtUDy0HmSO99lGWxDGy8hk4
	R5BWomdNwKSiyPtfKaGutVriy975T0Pj0I6GkMOgEPcFGF4+vVOApnlpnjNIWgdwFm0=
X-Gm-Gg: AZFdTZdbwr9i8f70Vg4U+c/6ekr3JWU/ZjfPVoSf0uGz39NTckIGZyUFn12pfSdUygg
	chTfeBEsS/kx30n70JpydjKXEy6mqdBxhEbOUQTtEk70M/9EeO/mDdbeaThvyRz314b3gj0CbJu
	uGdkVowb0vmH36Hm5LZ+DvaonSPhvz1p0Yy9KL6LeDpiPo62VLnFkXVXsmPOFCU9f2ygD1sLgni
	Mje1YYlHUXOyTwxE6gkWWMs54Ez47oT16dgX6V3UF/AX4pI495OqaiekvRie8MdE+NfBPXhN0wm
	38hpOZiPBNY9j4xNgwx1wWK1O6Gjf8gXXnPPdrYI+vh2ADuzZocsNr7/6SUJ9bamaqc1EjiWFmo
	IPKQfel8z6m09w6EEcza6IMWTZJabHkvQ988ZfpscD8CJQw58M/lyqWcoC5bhMgOfFqTdi54sF0
	N5kG6KmBViPkPB2Hi2aJ/VJ/vf1auuF81IkE+mkolm7A6eSUShTfc+7SYCQ1s3d1HKaZlL0gEaM
	D7xbWX6yJQGSTQoiLzyl75SMITM0OcOIJsgIbLJ1Fph7BrJ1mQdFcwJMcDsi4qnhqAwNrhvIeWa
	ET6MDSKLWspuc/FHwjS0ScsW+SkZ+lAyWiphGxeILiwZLyib25jHPHf8sf51kTssmRjtZs9iofZ
	jeYb9Ij+QxsjcuoOOyu4INDcEe7Y=
X-Received: by 2002:a05:7022:b0c4:b0:1b3:b455:93db with SMTP id a92af1059eb24-1b5568eec9fmr22925923c88.24.1795772830872;
        Fri, 27 Nov 2026 01:47:10 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm55115194c88.1.2026.11.27.01.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:47:09 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH net-next v3 03/12] amt: key relay tunnels on a union amt_addr endpoint
Date: Fri, 27 Nov 2026 09:46:54 +0000
Message-ID: <20261127094703.3025517-4-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127094703.3025517-1-omar@blockcast.net>
References: <20261127094703.3025517-1-omar@blockcast.net>
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

A relay keeps one struct amt_tunnel_list per gateway endpoint and finds
it by the gateway's IPv4 address, stored as __be32 ip4 and taken from
ip_hdr(skb)->saddr, together with its UDP source port. On an IPv6 outer
transport that reads the traffic class and flow label of the IPv6
header as an address, and the field cannot hold the gateway's address
anyway.

Store the endpoint as a union amt_addr, which group and source nodes
already use, and move the union above struct amt_tunnel_list so the
tunnel can embed it. Its ip6 member is no longer under CONFIG_IPV6, so
code that only copies, compares or prints an endpoint compiles without
an #if and relies on amt_v6() being false. A kernel without IPv6 pays 12
bytes per group and source node, which it already zeroes. The tunnel
needs no family of its own: the relay's socket is bound to one family,
so every tunnel has the device's family, which amt_v6() reports.

amt_outer_saddr() copies the outer source address of a received message
by value into a zeroed union amt_addr. amt_update_handler() takes that
snapshot before pskb_may_pull() and iptunnel_pull_header() can
reallocate the header; amt_request_handler() takes it after its only
pskb_may_pull() and pulls nothing more. Both pass it to
amt_tunnel_lookup(), amt_tunnel_get_or_create() and amt_update_tunnel().
Tunnels are matched on their endpoint with the existing
amt_addr_equal(); the union is zero-padded for IPv4, so one memcmp()
serves both families.

The per-source tunnel cap counts differently. An IPv6 host normally owns
a whole /64, so a count per address would let it open the cap's worth of
tunnels from each of its addresses and keep the table full.
amt_request_handler() and amt_tunnel_get_or_create() count the tunnels
of one source with amt_same_source(), which compares the whole address
for IPv4 and the /64 for IPv6. Gateways that share a /64 share the cap;
each still has its own tunnel, found by its full endpoint.

The Membership Update MAC becomes amt_relay_mac(), one siphash() over the
packed {address, port, nonce} tuple instead of siphash_3u32() over the
IPv4 address. The Request and Update handlers both compute it with the
helper. Only the relay computes and checks the MAC; the gateway echoes it
verbatim, so the different IPv4 value is not visible on the wire.

The IPv4 senders and the relay status debug message are converted to
tunnel->addr.ip4, and the debug message prints an IPv6 endpoint with
%pI6c. amt_v6() is still false for every device, so there is no
functional change.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 116 +++++++++++++++++++++++++++++++++-------------
 include/net/amt.h |  20 ++++----
 2 files changed, 95 insertions(+), 41 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 52ccaca08..83e666a02 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -98,6 +98,32 @@ static bool amt_v6(const struct amt_dev *amt)
 	return IS_ENABLED(CONFIG_IPV6) && !ipv6_addr_any(&amt->local_ipv6);
 }
 
+/* Snapshot the outer source address of a received AMT message. */
+static void amt_outer_saddr(const struct amt_dev *amt,
+			    const struct sk_buff *skb, union amt_addr *addr)
+{
+	memset(addr, 0, sizeof(*addr));
+	if (amt_v6(amt))
+		addr->ip6 = ipv6_hdr(skb)->saddr;
+	else
+		addr->ip4 = ip_hdr(skb)->saddr;
+}
+
+/* The Membership Update MAC for a gateway endpoint.  The gateway only echoes
+ * it, so one siphash() over the zero-padded endpoint serves both families.
+ */
+static u64 amt_relay_mac(const union amt_addr *addr, __be16 port, __be32 nonce,
+			 const siphash_key_t *key)
+{
+	struct {
+		union amt_addr	addr;
+		__be16		port;
+		__be32		nonce;
+	} __packed in = { .addr = *addr, .port = port, .nonce = nonce };
+
+	return siphash(&in, sizeof(in), key) >> 16;
+}
+
 static void __amt_source_gc_work(void)
 {
 	struct amt_source_node *snode;
@@ -189,6 +215,23 @@ static bool amt_addr_equal(union amt_addr *a, union amt_addr *b)
 	return !memcmp(a, b, sizeof(union amt_addr));
 }
 
+/* Bytes of an IPv6 source that make up its /64. */
+#define AMT_SRC_PREFIX6_LEN	8
+
+/* Whether @a and @b are one source for the per-source tunnel cap. An IPv6
+ * host normally owns a whole /64, so counting per address would let it
+ * reach the cap from each of its addresses and fill the table; the cap
+ * therefore counts per /64. For IPv4 a source is an address. Tunnels
+ * themselves are still found by their full endpoint.
+ */
+static bool amt_same_source(const struct amt_dev *amt,
+			    const union amt_addr *a, const union amt_addr *b)
+{
+	if (amt_v6(amt))
+		return !memcmp(&a->ip6, &b->ip6, AMT_SRC_PREFIX6_LEN);
+	return a->ip4 == b->ip4;
+}
+
 static u32 amt_source_hash(struct amt_tunnel_list *tunnel, union amt_addr *src)
 {
 	u32 hash = jhash(src, sizeof(*src), tunnel->amt->hash_seed);
@@ -701,10 +744,16 @@ static void __amt_update_relay_status(struct amt_tunnel_list *tunnel,
 {
 	if (validate && tunnel->status >= status)
 		return;
-	netdev_dbg(tunnel->amt->dev,
-		   "Update Tunnel(IP = %pI4, PORT = %u) status %s -> %s",
-		   &tunnel->ip4, ntohs(tunnel->source_port),
-		   status_str[tunnel->status], status_str[status]);
+	if (amt_v6(tunnel->amt))
+		netdev_dbg(tunnel->amt->dev,
+			   "Update Tunnel(IP = %pI6c, PORT = %u) status %s -> %s",
+			   &tunnel->addr.ip6, ntohs(tunnel->source_port),
+			   status_str[tunnel->status], status_str[status]);
+	else
+		netdev_dbg(tunnel->amt->dev,
+			   "Update Tunnel(IP = %pI4, PORT = %u) status %s -> %s",
+			   &tunnel->addr.ip4, ntohs(tunnel->source_port),
+			   status_str[tunnel->status], status_str[status]);
 	tunnel->status = status;
 }
 
@@ -1292,12 +1341,12 @@ static void amt_send_multicast_data(struct amt_dev *amt,
 
 	memset(&fl4, 0, sizeof(struct flowi4));
 	fl4.flowi4_oif         = amt->stream_dev->ifindex;
-	fl4.daddr              = tunnel->ip4;
+	fl4.daddr              = tunnel->addr.ip4;
 	fl4.saddr              = amt->local_ip;
 	fl4.flowi4_proto       = IPPROTO_UDP;
 	rt = ip_route_output_key(amt->net, &fl4);
 	if (IS_ERR(rt)) {
-		netdev_dbg(amt->dev, "no route to %pI4\n", &tunnel->ip4);
+		netdev_dbg(amt->dev, "no route to %pI4\n", &tunnel->addr.ip4);
 		kfree_skb(skb);
 		return;
 	}
@@ -2728,20 +2777,22 @@ static bool amt_membership_query_handler(struct amt_dev *amt,
  * race with amt_tunnel_expire() creates the replacement.
  */
 static struct amt_tunnel_list *amt_tunnel_lookup(struct amt_dev *amt,
-						 __be32 saddr, __be16 sport)
+						 union amt_addr *saddr,
+						 __be16 sport)
 {
 	struct amt_tunnel_list *tunnel;
 
 	list_for_each_entry_rcu(tunnel, &amt->tunnel_list, list) {
-		if (tunnel->ip4 == saddr && tunnel->source_port == sport &&
+		if (amt_addr_equal(&tunnel->addr, saddr) &&
+		    tunnel->source_port == sport &&
 		    !READ_ONCE(tunnel->dead))
 			return tunnel;
 	}
 	return NULL;
 }
 
-/* Most tunnels one source address may hold: an eighth of the table, at
- * least one and at most AMT_MAX_TUNNELS_PER_SRC.
+/* Most tunnels one source (an IPv4 address or an IPv6 /64) may hold: an
+ * eighth of the table, at least one and at most AMT_MAX_TUNNELS_PER_SRC.
  */
 static u32 amt_max_tunnels_per_src(const struct amt_dev *amt)
 {
@@ -2759,7 +2810,7 @@ static u32 amt_max_tunnels_per_src(const struct amt_dev *amt)
  * verified source address may hold.
  */
 static struct amt_tunnel_list *amt_tunnel_get_or_create(struct amt_dev *amt,
-							__be32 saddr,
+							union amt_addr *saddr,
 							__be16 sport)
 {
 	struct amt_tunnel_list *tunnel;
@@ -2779,9 +2830,11 @@ static struct amt_tunnel_list *amt_tunnel_get_or_create(struct amt_dev *amt,
 	 * against its address.
 	 */
 	list_for_each_entry(tunnel, &amt->tunnel_list, list) {
-		if (tunnel->ip4 != saddr || READ_ONCE(tunnel->dead))
+		if (!amt_same_source(amt, &tunnel->addr, saddr) ||
+		    READ_ONCE(tunnel->dead))
 			continue;
-		if (tunnel->source_port == sport) {
+		if (amt_addr_equal(&tunnel->addr, saddr) &&
+		    tunnel->source_port == sport) {
 			spin_unlock_bh(&amt->lock);
 			return tunnel;
 		}
@@ -2808,7 +2861,7 @@ static struct amt_tunnel_list *amt_tunnel_get_or_create(struct amt_dev *amt,
 	}
 
 	tunnel->source_port = sport;
-	tunnel->ip4 = saddr;
+	tunnel->addr = *saddr;
 	tunnel->amt = amt;
 	spin_lock_init(&tunnel->lock);
 	for (i = 0; i < amt->hash_buckets; i++)
@@ -2838,7 +2891,7 @@ static struct amt_tunnel_list *amt_tunnel_get_or_create(struct amt_dev *amt,
  * second amt_tunnel_get_or_create() call, which creates its replacement.
  */
 static bool amt_update_tunnel(struct amt_dev *amt, struct sk_buff *skb,
-			      __be32 saddr, __be16 sport, bool v6)
+			      union amt_addr *saddr, __be16 sport, bool v6)
 {
 	struct amt_tunnel_list *tunnel;
 	int i;
@@ -2878,12 +2931,13 @@ static bool amt_update_handler(struct amt_dev *amt, struct sk_buff *skb)
 	struct ethhdr *eth;
 	struct iphdr *iph;
 	unsigned int seq;
+	union amt_addr saddr;
 	u64 response_mac;
-	__be32 saddr;
 	__be32 nonce;
 	__be16 sport;
 
-	saddr = ip_hdr(skb)->saddr;
+	/* Snapshot the outer source before any pull can move the header. */
+	amt_outer_saddr(amt, skb, &saddr);
 
 	hdr_size = sizeof(*amtmu) + sizeof(struct udphdr);
 	if (!pskb_may_pull(skb, hdr_size))
@@ -2910,10 +2964,7 @@ static bool amt_update_handler(struct amt_dev *amt, struct sk_buff *skb)
 	} while (read_seqcount_retry(&amt->key_seq, seq));
 
 	for (i = 0; i < ARRAY_SIZE(key); i++) {
-		u64 mac = siphash_3u32((__force u32)saddr,
-				       (__force u32)sport,
-				       (__force u32)nonce,
-				       &key[i]) >> 16;
+		u64 mac = amt_relay_mac(&saddr, sport, nonce, &key[i]);
 
 		if (response_mac == mac) {
 			verified = true;
@@ -2947,7 +2998,7 @@ static bool amt_update_handler(struct amt_dev *amt, struct sk_buff *skb)
 			return true;
 		}
 
-		if (!amt_update_tunnel(amt, skb, saddr, sport, false))
+		if (!amt_update_tunnel(amt, skb, &saddr, sport, false))
 			return true;
 
 		skb_push(skb, sizeof(struct ethhdr));
@@ -2966,7 +3017,7 @@ static bool amt_update_handler(struct amt_dev *amt, struct sk_buff *skb)
 			return true;
 		}
 
-		if (!amt_update_tunnel(amt, skb, saddr, sport, true))
+		if (!amt_update_tunnel(amt, skb, &saddr, sport, true))
 			return true;
 
 		skb_push(skb, sizeof(struct ethhdr));
@@ -3165,8 +3216,8 @@ static bool amt_request_handler(struct amt_dev *amt, struct sk_buff *skb)
 	struct amt_header_request *amtrh;
 	struct amt_tunnel_list *tunnel;
 	bool full, have = false;
+	union amt_addr saddr;
 	struct udphdr *udph;
-	struct iphdr *iph;
 	siphash_key_t key;
 	u32 per_src = 0;
 	u64 mac;
@@ -3174,7 +3225,7 @@ static bool amt_request_handler(struct amt_dev *amt, struct sk_buff *skb)
 	if (!pskb_may_pull(skb, sizeof(*udph) + sizeof(*amtrh)))
 		return true;
 
-	iph = ip_hdr(skb);
+	amt_outer_saddr(amt, skb, &saddr);
 	udph = udp_hdr(skb);
 	amtrh = (struct amt_header_request *)(udp_hdr(skb) + 1);
 
@@ -3198,10 +3249,12 @@ static bool amt_request_handler(struct amt_dev *amt, struct sk_buff *skb)
 	 */
 	rcu_read_lock();
 	list_for_each_entry_rcu(tunnel, &amt->tunnel_list, list) {
-		if (tunnel->ip4 != iph->saddr || READ_ONCE(tunnel->dead))
+		if (!amt_same_source(amt, &tunnel->addr, &saddr) ||
+		    READ_ONCE(tunnel->dead))
 			continue;
 		per_src++;
-		if (tunnel->source_port == udph->source)
+		if (amt_addr_equal(&tunnel->addr, &saddr) &&
+		    tunnel->source_port == udph->source)
 			have = true;
 	}
 	rcu_read_unlock();
@@ -3210,15 +3263,12 @@ static bool amt_request_handler(struct amt_dev *amt, struct sk_buff *skb)
 	if (!have && (full || per_src >= amt_max_tunnels_per_src(amt)))
 		return true;
 
-	mac = siphash_3u32((__force u32)iph->saddr,
-			   (__force u32)udph->source,
-			   (__force u32)amtrh->nonce,
-			   &key) >> 16;
+	mac = amt_relay_mac(&saddr, udph->source, amtrh->nonce, &key);
 	if (!amtrh->p)
-		amt_send_igmp_gq(amt, iph->saddr, udph->source, amtrh->nonce,
+		amt_send_igmp_gq(amt, saddr.ip4, udph->source, amtrh->nonce,
 				 mac);
 	else
-		amt_send_mld_gq(amt, iph->saddr, udph->source, amtrh->nonce,
+		amt_send_mld_gq(amt, saddr.ip4, udph->source, amtrh->nonce,
 				mac);
 
 	return false;
diff --git a/include/net/amt.h b/include/net/amt.h
index 52d77bc6b..245947113 100644
--- a/include/net/amt.h
+++ b/include/net/amt.h
@@ -252,6 +252,14 @@ struct amt_relay_headers {
 	};
 } __packed;
 
+/* ip6 is present without CONFIG_IPV6 too, so that code which only copies
+ * or compares addresses needs no #if; amt_v6() is then false.
+ */
+union amt_addr {
+	__be32			ip4;
+	struct in6_addr		ip6;
+};
+
 struct amt_tunnel_list {
 	struct list_head	list;
 	/* Protect All resources under an amt_tunne_list */
@@ -273,18 +281,14 @@ struct amt_tunnel_list {
 	 */
 	bool			dead;
 	__be16			source_port;
-	__be32			ip4;
+	/* Outer source address of the gateway endpoint, in the device's
+	 * outer family (amt_v6()).
+	 */
+	union amt_addr		addr;
 	struct rcu_head		rcu;
 	struct hlist_head	groups[];
 };
 
-union amt_addr {
-	__be32			ip4;
-#if IS_ENABLED(CONFIG_IPV6)
-	struct in6_addr		ip6;
-#endif
-};
-
 /* RFC 3810
  *
  * When the router is in EXCLUDE mode, the router state is represented

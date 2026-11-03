Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.63
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793697688;
	b=A/TonyRhC0r8CtApU53HVaGfvpSj5z+ZRpJF7qCVy1XEehDwGs7sR4HPjhRPr6rM8p/L
	 xLm7nJNZMd9X+IsVTK1MsJyrPRSYJHgDYGiGua2jB1K9PLzWriXMS1NOg5tCOB3J/9RPZ
	 ACRIVNqmP327aPCo5FC42y3D2kZfz/1bg37myuit5vQpblWrHO3NxNGjRnDRiGEjRwpcB
	 73kIjpgAB1cEIkIiEOii1mB0+nkIKAZ1Kluy5C0+MS1eWLHEQ85gdEuudyWh6oz3XdfS8
	 oIiNu/TFhGuDPNvriLdYb3VaSZ1qU1/mJHZC71vG8zWY+cq5wZIVV9WNOV+b4y/Vz/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793697688;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=r/NLJg4vJ0VL0uH532EoW2UyxnY2RyMyx2aIEVHR6N0=;
	b=dyZLrh0z5wT12WHCfFfD4PZ3Cu5N9yOYL4+1C2IiWiCM/COFm8B6rC1qcc8fuSrnTx7B
	 xuouGvPHn8lQsLnG2oiuSqJ35P4GQzsVFbzmY72EHQd5fZTpUV5Yn9qqH0DMPJm9JeBnE
	 gVuG0DPomECl50kQlDPtBy5B2TQTxFVzxo4VsNCPqafT9qHEeDd823c4/aSxLHmdt7YlB
	 S4YhKduc2DZ4aau1dI3HRWJ2599Pf+F/KHB8F4s91gqZ2k3Fp1PajZWpDq5Jg722y0HIc
	 XKKLiSSaHPpc9qyk0Em7bLILzmrj3Iw8HqTJI2accyVtjhRrB+kcPOY63jDsOMg41Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xWS9gbBo;
	arc=none smtp.remote-ip=95.215.58.63
Received: from mta1.migadu.com (out-63.mta1.migadu.com [95.215.58.63])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72760606D801
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 09:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72760606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xWS9gbBo
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=0/fxzrCQ92Apr1mEQOQvTl03/XJiS4ZIEfcL3kMkgho=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793697685; v=1; x=1794302485;
 b=xWS9gbBorvsO8ZBgXXyYwSCltq+7J0Wcnq/0BaAvG9bI2ZMzniUETn5i/lelXz5QOyUFh8ft
 KO0KO0egvzLlw9JOu5aSbDzALbU4S4cZVCL9EZ0ttsI8dgN9QcAwlUGVT7NZrZ/A05iBztOdzQ5
 jG8Bi4BNlwbzlCwRySndeXQU=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id a8325ab392601fc8;
	Tue, 03 Nov 2026 09:21:24 +0000
X-Mizu-Trace-ID: a8325ab392601fc8
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Tue, 03 Nov 2026 17:20:50 +0800
Subject: [PATCH net v2 1/3] ipv6: route: consider IOAM options in ECMP hash
 policy 0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-ipv6_ioam_ecmp-v2-1-6ef0318bdb5e@kylinos.cn>
References: <20261103-ipv6_ioam_ecmp-v2-0-6ef0318bdb5e@kylinos.cn>
In-Reply-To: <20261103-ipv6_ioam_ecmp-v2-0-6ef0318bdb5e@kylinos.cn>
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Justin Iurman <justin.iurman@gmail.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Hangbin Liu <liuhangbin@kylinos.cn>
X-Mailer: b4 0.16.0

From: Hangbin Liu <liuhangbin@kylinos.cn>

RFC 9486 (C2) requires that the ECMP hash of a packet carrying IOAM
options is the same as the hash of the identical packet without them.

The default multipath hash policy (0) hashes basic.ip_proto, which
ip6_multipath_l3_keys() fills from the raw IPv6 nexthdr. An IOAM
Hop-by-Hop option is inserted ahead of the original next header, so a
transit router sees NEXTHDR_HOP (0) instead of e.g. IPPROTO_TCP and
may pick a different ECMP sibling than for the same packet without
IOAM.

Recover the nexthdr the packet would have had if its Hop-by-Hop
header carried only IOAM options (0x31, and 0x11 for DEX) plus
padding, and use it for the policy-0 key and for the ICMPv6-error
check, so errors that quote a flow keep hashing that flow. Any other
Hop-by-Hop option (Router Alert, Jumbo, ...) keeps hashing exactly as
before. The walk runs for both the nexthdr == NEXTHDR_HOP case and
ICMPv6-quoted inner headers (with fallback if truncated).

Fixes: 3edede08ff37 ("ipv6: ioam: Support for IOAM injection with lwtunnels")
Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
The ECMP path with and without IOAM is verified by
tools/testing/selftests/net/ioam6_ecmp.sh in the next patch.
---
 include/uapi/linux/in6.h |  1 +
 net/ipv6/route.c         | 95 +++++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 91 insertions(+), 5 deletions(-)

diff --git a/include/uapi/linux/in6.h b/include/uapi/linux/in6.h
index 5a47339ef7d7..2e66dc37e1e5 100644
--- a/include/uapi/linux/in6.h
+++ b/include/uapi/linux/in6.h
@@ -145,6 +145,7 @@ struct in6_flowlabel_req {
 #define IPV6_TLV_PADN		1
 #define IPV6_TLV_ROUTERALERT	5
 #define IPV6_TLV_CALIPSO	7	/* RFC 5570 */
+#define IPV6_TLV_IOAM_DEX	17	/* RFC 9486 */
 #define IPV6_TLV_IOAM		49	/* RFC 9486 */
 #define IPV6_TLV_JUMBO		194
 #define IPV6_TLV_HAO		201	/* home address option */
diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 616b86f89f63..675cf2e8ed35 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -2342,6 +2342,71 @@ struct dst_entry *ip6_route_input_lookup(struct net *net,
 }
 EXPORT_SYMBOL_GPL(ip6_route_input_lookup);
 
+/* RFC 9486 (C2) requires that the ECMP hash of a packet carrying IOAM
+ * options is the same as the hash of the identical packet without them.
+ * Recover the nexthdr if its Hop-by-Hop header carried only IOAM options
+ * and padding, every other packet is hashed exactly as before.
+ *
+ * iph_off: offset of the IPv6 header from skb->data
+ * nexthdr: iph->nexthdr (NEXTHDR_HOP or not)
+ */
+static u8 ip6_nexthdr_without_ioam(const struct sk_buff *skb,
+				   int iph_off, u8 nexthdr)
+{
+	const struct ipv6_opt_hdr *hhdr;
+	struct ipv6_opt_hdr hbuf;
+	bool has_ioam = false;
+	u8 obuf[2], *opt;
+	int off, len, i;
+
+	if (likely(nexthdr != NEXTHDR_HOP))
+		return nexthdr;
+
+	off = iph_off + sizeof(struct ipv6hdr);
+	hhdr = skb_header_pointer(skb, off, sizeof(hbuf), &hbuf);
+	if (!hhdr)
+		return nexthdr;
+
+	len = (hhdr->hdrlen + 1) << 3;
+
+	for (i = 2; i < len; ) {
+		const u8 *type;
+		u8 type_buf;
+
+		/* Always check PAD1 first as ip6_parse_tlv() accepts Pad1
+		 * as the last byte of the HBH header
+		 */
+		type = skb_header_pointer(skb, off + i, 1, &type_buf);
+		if (!type)
+			return has_ioam ? hhdr->nexthdr : nexthdr;
+		if (*type == IPV6_TLV_PAD1) {
+			i++;
+			continue;
+		}
+
+		opt = skb_header_pointer(skb, off + i, sizeof(obuf), obuf);
+		if (!opt)
+			return nexthdr;
+
+		if (opt[0] == IPV6_TLV_PADN) {
+			i += opt[1] + 2;
+			continue;
+		}
+		if (opt[0] != IPV6_TLV_IOAM && opt[0] != IPV6_TLV_IOAM_DEX)
+			return nexthdr;
+
+		has_ioam = true;
+
+		/* Keep searching for the next TLV. As long as non-IOAM
+		 * options (Router Alert, Jumbo, etc.) exist in the HBH
+		 * header, we should preserve the original NEXTHDR_HOP.
+		 */
+		i += opt[1] + 2;
+	}
+
+	return has_ioam ? hhdr->nexthdr : nexthdr;
+}
+
 static void ip6_multipath_l3_keys(const struct sk_buff *skb,
 				  struct flow_keys *keys,
 				  struct flow_keys *flkeys)
@@ -2349,15 +2414,34 @@ static void ip6_multipath_l3_keys(const struct sk_buff *skb,
 	const struct ipv6hdr *outer_iph = ipv6_hdr(skb);
 	const struct ipv6hdr *key_iph = outer_iph;
 	struct flow_keys *_flkeys = flkeys;
+	const struct ipv6_opt_hdr *opt_hdr;
 	const struct ipv6hdr *inner_iph;
 	const struct icmp6hdr *icmph;
+	struct ipv6_opt_hdr _opt_hdr;
 	struct ipv6hdr _inner_iph;
 	struct icmp6hdr _icmph;
+	int extlen = 0;
+	int inner_off;
+	u8 nexthdr;
 
-	if (likely(outer_iph->nexthdr != IPPROTO_ICMPV6))
+	nexthdr = ip6_nexthdr_without_ioam(skb, skb_network_offset(skb),
+					   outer_iph->nexthdr);
+	if (likely(nexthdr != IPPROTO_ICMPV6))
 		goto out;
 
-	icmph = skb_header_pointer(skb, skb_transport_offset(skb),
+	/* Outer header has IOAM (NEXTHDR_HOP) and the recovered nexthdr is
+	 * IPPROTO_ICMPV6. transport_header may still point at the Hop-by-Hop
+	 * header (e.g. ipv6_hop_ioam() -> ip6_route_input() before
+	 * ipv6_parse_hopopts() advances it).
+	 */
+	if (outer_iph->nexthdr == NEXTHDR_HOP) {
+		opt_hdr = skb_header_pointer(skb, skb_transport_offset(skb),
+					     sizeof(_opt_hdr), &_opt_hdr);
+		if (opt_hdr && opt_hdr->nexthdr == IPPROTO_ICMPV6)
+			extlen = (opt_hdr->hdrlen + 1) << 3;
+	}
+
+	icmph = skb_header_pointer(skb, skb_transport_offset(skb) + extlen,
 				   sizeof(_icmph), &_icmph);
 	if (!icmph)
 		goto out;
@@ -2365,14 +2449,15 @@ static void ip6_multipath_l3_keys(const struct sk_buff *skb,
 	if (!icmpv6_is_err(icmph->icmp6_type))
 		goto out;
 
-	inner_iph = skb_header_pointer(skb,
-				       skb_transport_offset(skb) + sizeof(*icmph),
+	inner_off = skb_transport_offset(skb) + extlen + sizeof(*icmph);
+	inner_iph = skb_header_pointer(skb, inner_off,
 				       sizeof(_inner_iph), &_inner_iph);
 	if (!inner_iph)
 		goto out;
 
 	key_iph = inner_iph;
 	_flkeys = NULL;
+	nexthdr = ip6_nexthdr_without_ioam(skb, inner_off, inner_iph->nexthdr);
 out:
 	if (_flkeys) {
 		keys->addrs.v6addrs.src = _flkeys->addrs.v6addrs.src;
@@ -2383,7 +2468,7 @@ static void ip6_multipath_l3_keys(const struct sk_buff *skb,
 		keys->addrs.v6addrs.src = key_iph->saddr;
 		keys->addrs.v6addrs.dst = key_iph->daddr;
 		keys->tags.flow_label = ip6_flowlabel(key_iph);
-		keys->basic.ip_proto = key_iph->nexthdr;
+		keys->basic.ip_proto = nexthdr;
 	}
 }
 

-- 
2.56.0


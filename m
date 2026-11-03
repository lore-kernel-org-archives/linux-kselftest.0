Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.80
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793697696;
	b=pPM3aPBwtgbXoAmtTDJEXB1odkZ5ndCY553vMwhA4uJ0oHT8ap2cvU/QPTU+DAuGRzf2
	 tcfwRzaa04QUkZLDIWhuzkqCNqumUJwAoQboOk266blReFba/OkSKurOXiy3hF2+mwYmN
	 L+ZyC8AjR7HDNh7NUwbrBG9/H0Ob0FNhA5Z3wkNyaJixJAGvbWp2LxaurA4Dmt9cBaYAH
	 qIZdb5p5jilVS3SjlhPYUnLGCgxUbk+IcZ+RIpcKB7RQDJfRjPfFmkOE65L/q2ewie57R
	 klQ/H2MBL2ryRFdEwlbrnNaPd/Jy0P/ayf7XlgX4m+ScQfQ6trc7HI2L8OttRM9wBYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793697696;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=gZHsMDdpmPsnd9fVKQ5HXshg/Ennof29jt+F+15lfj0=;
	b=D5tsgIK99LG73KKTZ8nx3nfywZd6M+ubCMWL9mIbaVgz5OwZRxINZTZxtNgeJMPEJ3XD
	 rWbfVXXTjMsB4v92zExQQvn2qqF/kTB4FPFxiztwcpYGlv+QBvfwWgue4mkpF4tEIJmsv
	 B6gcFxeSs2Fg2rgByS3tnnbU8JNLn0RR7Z6lfE8pmN9YJ7kuldpgnL1RNATVVdturJbpL
	 mdGgQq3w2nNA+5RqAbGhJel2UiXNOum/FeR/KZbeD1ZXTEakFfI0vVVZCYCAWhxr2nabV
	 2HEgbx/gCBOb9sd9uk02mHbfDwfbA30ejdd+Si57EuZKS+V7jM/qasM9t7CzmdVDU1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="K3tC/zFB";
	arc=none smtp.remote-ip=95.215.58.80
Received: from mta1.migadu.com (out-80.mta1.migadu.com [95.215.58.80])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46269606A334
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 09:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46269606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=K3tC/zFB
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+cX65HWUnORHAEQhsq35CFgzfw7YbOZo0pOLpUvDick=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793697694; v=1; x=1794302494;
 b=K3tC/zFBBRu4ADhoe1N2zLREOqd3FVjNSxtKLe0SuRZRBOxT2XDSserV5nj0LFXrncQ7KbyB
 sFaC5V24BpTtlNrl43iEJNiK6UNAt3Lnl7DwaCuN4LjvlRLc6zWUB80zfuHUuzT7OimvJeNGY90
 M0+RziEd0Rb4k6S9T/6qMLK8=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id a7b269fb289dbe95;
	Tue, 03 Nov 2026 09:21:34 +0000
X-Mizu-Trace-ID: a7b269fb289dbe95
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Tue, 03 Nov 2026 17:20:51 +0800
Subject: [PATCH net v2 2/3] ipv6: ioam6: use transformed packet nexthdr for
 ECMP re-lookup
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261103-ipv6_ioam_ecmp-v2-2-6ef0318bdb5e@kylinos.cn>
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

On a destination-cache miss the old code always re-looked up the
transformed packet under hash policy 0 with NEXTHDR_HOP (and, for
local flows, keys that do not match the original socket lookup), so
it could pick a different ECMP sibling.

Inline insertion leaves the destination unchanged: reuse orig_dst and
cache the fake null_rt, keeping the sibling from the original lookup.

Encapsulation may switch the destination to tundst, so it still
re-looks up. Take flowi6_proto from the transformed packet HBH (41
after encap, so ipproto rules match as for plain ip6ip6) and
precompute fl6.mp_hash from the packet, since ip6_route_output()
carries no skb and would otherwise drop ICMPv6 quoted-flow and L4
keys.

Depends on patch "ipv6: route: consider IOAM options in ECMP hash
policy 0".

Fixes: 8cb3bf8bff3c ("ipv6: ioam: Add support for the ip6ip6 encapsulation")
Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
For AI review:

The mp_hash precompute makes policy-2 hash inner keys while plain ip6ip6
baseline hashes outer — pre-patch also diverged (proto 0 vs 41);
C2 for policy 2 was broken before and after, no new violation class, and
the patches claim/test policy 0 only.
---
 net/ipv6/ioam6_iptunnel.c | 79 +++++++++++++++++++++++++++++++----------------
 1 file changed, 53 insertions(+), 26 deletions(-)

diff --git a/net/ipv6/ioam6_iptunnel.c b/net/ipv6/ioam6_iptunnel.c
index cfb2c41634a0..246533276be8 100644
--- a/net/ipv6/ioam6_iptunnel.c
+++ b/net/ipv6/ioam6_iptunnel.c
@@ -405,34 +405,61 @@ static int ioam6_output(struct net *net, struct sock *sk, struct sk_buff *skb)
 
 	if (unlikely(!dst)) {
 		struct ipv6hdr *hdr = ipv6_hdr(skb);
-		struct flowi6 fl6;
-
-		memset(&fl6, 0, sizeof(fl6));
-		fl6.daddr = hdr->daddr;
-		fl6.saddr = hdr->saddr;
-		fl6.flowlabel = ip6_flowinfo(hdr);
-		fl6.flowi6_mark = skb->mark;
-		fl6.flowi6_proto = hdr->nexthdr;
-
-		dst = ip6_route_output(net, NULL, &fl6);
-		if (dst->error) {
-			err = dst->error;
-			goto drop;
-		}
 
-		/* If the destination is the same after transformation (which is
-		 * a valid use case for IOAM), then we don't want to add it to
-		 * the cache in order to avoid a reference loop. Instead, we add
-		 * our fake dst_entry to the cache as a way to detect this case.
-		 * Otherwise, we add the resolved destination to the cache.
+		/* Inline insertion does not change the destination. Keep
+		 * orig_dst so the ECMP sibling from the original lookup is
+		 * preserved (RFC 9486 C2 for locally generated traffic).
+		 * Cache the fake null_rt so later packets take the same path.
 		 */
-		local_bh_disable();
-		if (orig_dst->lwtstate == dst->lwtstate)
-			dst_cache_set_ip6(&ilwt->cache,
-					  &ilwt->null_rt.dst, &fl6.saddr);
-		else
-			dst_cache_set_ip6(&ilwt->cache, dst, &fl6.saddr);
-		local_bh_enable();
+		if (ilwt->mode == IOAM6_IPTUNNEL_MODE_INLINE ||
+		    (ilwt->mode == IOAM6_IPTUNNEL_MODE_AUTO && !skb->dev)) {
+			dst = orig_dst;
+			dst_hold(dst);
+
+			local_bh_disable();
+			dst_cache_set_ip6(&ilwt->cache, &ilwt->null_rt.dst,
+					  &hdr->saddr);
+			local_bh_enable();
+		} else {
+			/* Encapsulation may change the destination (tundst);
+			 * re-lookup with the transformed packet keys so the
+			 * outer hash matches the identical packet without IOAM.
+			 */
+			const struct ipv6_opt_hdr *hhdr;
+			struct flowi6 fl6;
+
+			hhdr = (const struct ipv6_opt_hdr *)skb_transport_header(skb);
+
+			memset(&fl6, 0, sizeof(fl6));
+			fl6.daddr = hdr->daddr;
+			fl6.saddr = hdr->saddr;
+			fl6.flowlabel = ip6_flowinfo(hdr);
+			fl6.flowi6_mark = skb->mark;
+			fl6.flowi6_proto = hhdr->nexthdr;
+			fl6.mp_hash = rt6_multipath_hash(net, &fl6, skb, NULL);
+
+			dst = ip6_route_output(net, NULL, &fl6);
+			if (dst->error) {
+				err = dst->error;
+				goto drop;
+			}
+
+			/* If the destination is the same after transformation
+			 * (which is a valid use case for IOAM), then we don't
+			 * want to add it to the cache in order to avoid a
+			 * reference loop. Instead, we add our fake dst_entry
+			 * to the cache as a way to detect this case.
+			 * Otherwise, we add the resolved destination to the
+			 * cache.
+			 */
+			local_bh_disable();
+			if (orig_dst->lwtstate == dst->lwtstate)
+				dst_cache_set_ip6(&ilwt->cache,
+						  &ilwt->null_rt.dst, &fl6.saddr);
+			else
+				dst_cache_set_ip6(&ilwt->cache, dst, &fl6.saddr);
+			local_bh_enable();
+		}
 
 		err = skb_cow_head(skb, LL_RESERVED_SPACE(dst_dev(dst)));
 		if (unlikely(err))

-- 
2.56.0


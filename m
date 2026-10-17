Received: from outbound.qs.icloud.com (qs-2001g-snip4-6.eps.apple.com [57.103.87.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBD93D25AF
	for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 21:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.87.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792271154; cv=none; b=SjPmjwAaR3PyuRtNaCn3CKL6bbGFvWNIvDnXoqkV0n78HQezI0uvGPpyi7Cc1Q5eWa7qgCoWbXSeMrzl5QzVkOdQOAcxH2+k/8X/6fmpAlWqK6l6tV3GLtg6I5gaW3DIGX+Ui10D6BF+cXyBSTID1lE8UfeqLRbA+lhGwUlVNtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792271154; c=relaxed/simple;
	bh=UDPQCQ/tm1Mq5nfd3BVB2V9j9uUnqCPSinOniZhjzas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IO8LLO5M/WCwg0mCcxPhpJ4U8mnoIKN4Av5i4MARazRG0rqnFqKZVwm7qIt9O4w6BM2jk6eOBeFpctlM4JOfx5PCWv40eu/OE76uoXN03m/Nx+XfdOs9nA9jhHUyQDkJjHNBkcDEWn6rrXB4Jj7Os2vmxvX8lrTl3iLbzE4u3io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=verdict.gg; spf=pass smtp.mailfrom=verdict.gg; dkim=pass (2048-bit key) header.d=verdict.gg header.i=@verdict.gg header.b=Ecmk43QR; arc=none smtp.client-ip=57.103.87.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=verdict.gg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=verdict.gg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=verdict.gg header.i=@verdict.gg header.b="Ecmk43QR"
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-2d-100-percent-3 (Postfix) with ESMTPS id 434B91817E88;
	Sat, 17 Oct 2026 21:05:49 +0000 (UTC)
X-ICL-RepId: 01a14baf-6896-742e-b7d1-30132f0788d3
X-ICL-Out-Info: HUtFAUMEWwJACUgATUQeDx5WFlZNRAJCTQ1OHVwORQFEF0oBTVIPDxRcFFofVgVyBlwKVwRUHxwXXlhVCQodVwJdEVAZGQxVUEsbDlwFS1oVVRcOAkIfUB9MFldDRhgcGVoUXBhTRVEfVFhDGUVWaUELTx1dGVscQmRYVwkKHVcCXRFQGRkMVVBUEVdQC1kCQg9JA1wAWQNADEgLQwBaCkQAVQFAUw5eGUsZXS1BDkAUUBtHQ1AMDFBNAUMICghHA00XXjJTBF8RUBY=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verdict.gg; s=sig1; t=1792271150; x=1823807150; bh=OXkywacKsBlJITstSqBw0C20L132JfqRvaQ3LiKzmn8=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=Ecmk43QR+1oxTDucfPeDAfbHPRUCuc4oqbrhvocTTyNuypc3P2X2+w2xQlvUhLHV92rhxK7f6iEdtZHNqVWxJ1H2Bn+35uuQr6lTCOrXmdIej3NXY7FTiemOkd+tM1i0XTzV5Z8DvtbcaFPxJMATEJyXx+G+B41nGaMJCH5vIH9roAqo/UAznS+ObU1hG/cxDxE3BDHkNDTBWSJvFLyK+cV9LQwBzOFAFZrXwR0/eeHk7huc/9DESe3dEbAPJ+uNAMDMgp7BmobIfhSWGhhvQd6y9NLJyTYONX5AiBYSPWF6fSHzx7fiTXeYHV049GjQPu/MIU07hBkFiTS1Yzkh9A==
mail-alias-created-date: 1621344842221
Received: from DelNac.mail.msk (unknown [17.57.155.37])
	by p00-icloudmta-asmtp-us-east-2d-100-percent-3 (Postfix) with ESMTPSA id CB351180020D;
	Sat, 17 Oct 2026 21:05:46 +0000 (UTC)
From: Vladimir Vdovin <deliran@verdict.gg>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladimir Vdovin <deliran@verdict.gg>
Subject: [PATCH net-next 1/2] ipv6: Cache pmtu for all paths of a multipath route
Date: Sun, 18 Oct 2026 00:05:07 +0300
Message-ID: <20261017210508.71849-2-deliran@verdict.gg>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261017210508.71849-1-deliran@verdict.gg>
References: <20261017210508.71849-1-deliran@verdict.gg>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZBh63JwAdTfUHE2y72bFZCtNmGZ64hZm
X-Proofpoint-ORIG-GUID: ZBh63JwAdTfUHE2y72bFZCtNmGZ64hZm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA4NCBTYWx0ZWRfX+jyQ+X9z/0nA
 qcwA98dUh68kmQ4TQ6p8U+AnlVKrhKCW2yyv4ch9S4hQv60LO+tajrlsmMJVDRqOX4lr2xm2RgF
 ENLkEj/yO+EfLYPWHTEgBCLHd+AWryFwF2ZKw3A2sLg2k1ahfSnlCOnnkWnqHpVKcpseBPPKcIa
 RVvH/R1LmTYpf2e0nLnf4UmFtOkLN3AR8Gtc+HMnuaDB/1s4u3GhDX3mXghq/cfwn2zqL6AwJDw
 nLm4ENOmUfqMkJaJeoBvtm8Tf7YzeM2Wdg5WWX09d2dWp/m3Ko7l7A1xF5Y7UDbzcjN0C2uTGUP
 jCwUyJFo/aq00mAIh8MdQIdSqN9dg/+mk3Lt448+LGBlmWWyi3OKp/qUJ+EuRs=
X-Authority-Info-Out: v=2.4 cv=NtzcssdJ c=1 sm=1 tr=0 ts=6ad3e32e
 cx=c_apl:c_pps:t_out a=bsP7O+dXZ5uKcj+dsLqiMw==:117
 a=bsP7O+dXZ5uKcj+dsLqiMw==:17 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=RL2efRYtI3CUIBQEIwUA:9
X-JNJ: AAAAAAABS9CXybIC93M1eVs4t0pKC5jil0bYl8Eb7X/m0I0fcetHJ8Kduw24+crS1+83fPMOOc0nazQvpTbOeIvKxCcXIYHDKSRW1GkSoOCcCTaBJoKOd4v0+u271B0F0SqS1eg/WE6uigBt0NSJVLIi2gMzcdgaKlE4/Yd8/9cbG/M4NjbQ6efWO6D9nrY3suoLPjqeA3MOwOOeA+PSP4M3AA+hnRz6nJrDXGLlsS00b1CbEmt+LRePBjFutK9y7nNhKuPX9XKGXhXWR4aCH2NASw6CFX8JbwBm27fp5FfvhFrIeQRvAQ8lq2jtEL//cO2iM08BmNrxhaBIJhyHXnNPZE2BJI56auganhrxZxDbb71mSAF2n1313Wbu7geUUc9x8yH9zGIexi8rY0tu5tzbcZiuyturvEKw0j+sYcfb2jXggEkiDh+bYHhADcSAwFZKPYSG0QVaCRb8PFXwREE5Ki4rGOmFVr3Hjydh8kiK+4AFxIO+g04YaLF/IuuI9JFNJmKgssvz9ZGuwo2Ocywi3ds5N+eEPmUy4M09o2izznCgyoBw0l3siC5ine8wrsVFyJ9ac2TBJ9ONZgQORehhBjapQIYyRm0B6/zDMLy8JSYx8/3CGj1u+9RwFjIOsUGyRPJoOvcqPZPZLRW7Rf5CUvU3u97Karex0jCkRjDfMkqfxGtlhUhb1KJhSVtoflBNVEfwStLeQhX3jBiE3wXT1GJqQmriQKr+++FGuBuAKxvLGrZA3q2CVJp+aCQ+RqnfI99Lz7FAXXfblyWW8ObqshIUl4PJ3dMAvfbyiia/MMDzjXn7BloilU800wW/4YPVPJk1lR6r13ZrxWgJlnIdbEM80sBOtn0H5v4JS0o/VvXPhJA=

__ip6_rt_update_pmtu() creates the exception route only on the nexthop
the Packet Too Big came in through. With a multipath route the other
paths never see that ICMP error and keep sending with the link MTU, so
flows hashed to them blackhole.

Same problem and same fix as for IPv4 in commit 7d3f3b4367f3 ("net:
ipv4: Cache pmtu for all packet paths if multipath enabled"): create
the exception on every path. For a nexthop object walk all of its
fib6_nh, for a legacy multipath route walk the siblings of the selected
fib6_info.

Link: https://lore.kernel.org/netdev/ad29493c-9e48-4a94-b327-e47af3a9d137@kernel.org/
Signed-off-by: Vladimir Vdovin <deliran@verdict.gg>
---
 net/ipv6/route.c | 88 +++++++++++++++++++++++++++++++++---------------
 1 file changed, 61 insertions(+), 27 deletions(-)

diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 34ab7f330540..d870c20f2728 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -2888,6 +2888,30 @@ static bool rt6_cache_allowed_for_pmtu(const struct rt6_info *rt)
 		(rt->rt6i_flags & RTF_PCPU || rcu_access_pointer(rt->from));
 }
 
+struct rt6_pmtu_exception_arg {
+	struct fib6_result	*res;
+	const struct in6_addr	*daddr;
+	const struct in6_addr	*saddr;
+	u32			mtu;
+};
+
+static int rt6_nh_insert_pmtu_exception(struct fib6_nh *nh, void *_arg)
+{
+	struct rt6_pmtu_exception_arg *arg = _arg;
+	struct fib6_result *res = arg->res;
+	struct rt6_info *nrt6;
+
+	res->nh = nh;
+	nrt6 = ip6_rt_cache_alloc(res, arg->daddr, arg->saddr);
+	if (nrt6) {
+		rt6_do_update_pmtu(nrt6, arg->mtu);
+		if (rt6_insert_exception(nrt6, res))
+			dst_release_immediate(&nrt6->dst);
+	}
+
+	return 0;
+}
+
 static void __ip6_rt_update_pmtu(struct dst_entry *dst, const struct sock *sk,
 				 const struct ipv6hdr *iph, u32 mtu,
 				 bool confirm_neigh)
@@ -2925,42 +2949,52 @@ static void __ip6_rt_update_pmtu(struct dst_entry *dst, const struct sock *sk,
 		if (rt6->rt6i_flags & RTF_CACHE)
 			rt6_update_exception_stamp_rt(rt6);
 	} else if (daddr) {
+		struct fib6_info *f6i, *sibling;
 		struct fib6_result res = {};
-		struct rt6_info *nrt6;
+		struct rt6_pmtu_exception_arg arg = {
+			.res = &res,
+			.daddr = daddr,
+			.saddr = saddr,
+			.mtu = mtu,
+		};
 
 		rcu_read_lock();
-		res.f6i = rcu_dereference(rt6->from);
-		if (!res.f6i)
+		f6i = rcu_dereference(rt6->from);
+		if (!f6i)
 			goto out_unlock;
 
-		res.fib6_flags = res.f6i->fib6_flags;
-		res.fib6_type = res.f6i->fib6_type;
+		res.f6i = f6i;
+		res.fib6_flags = f6i->fib6_flags;
+		res.fib6_type = f6i->fib6_type;
 
-		if (res.f6i->nh) {
-			struct fib6_nh_match_arg arg = {
-				.dev = dst_dev_rcu(dst),
-				.gw = &rt6->rt6i_gateway,
-			};
-
-			nexthop_for_each_fib6_nh(res.f6i->nh,
-						 fib6_nh_find_match, &arg);
+		/* A Packet Too Big only ever arrives through the path the
+		 * offending packet took, so cache the pmtu on every path of a
+		 * multipath route: the other paths will not get their own
+		 * ICMP error and would keep sending with the link MTU.
+		 */
+		if (f6i->nh) {
+			nexthop_for_each_fib6_nh(f6i->nh,
+						 rt6_nh_insert_pmtu_exception,
+						 &arg);
+			goto out_unlock;
+		}
 
-			/* fib6_info uses a nexthop that does not have fib6_nh
-			 * using the dst->dev + gw. Should be impossible.
-			 */
-			if (!arg.match)
-				goto out_unlock;
+		rt6_nh_insert_pmtu_exception(f6i->fib6_nh, &arg);
 
-			res.nh = arg.match;
-		} else {
-			res.nh = res.f6i->fib6_nh;
-		}
+		if (!READ_ONCE(f6i->fib6_nsiblings))
+			goto out_unlock;
 
-		nrt6 = ip6_rt_cache_alloc(&res, daddr, saddr);
-		if (nrt6) {
-			rt6_do_update_pmtu(nrt6, mtu);
-			if (rt6_insert_exception(nrt6, &res))
-				dst_release_immediate(&nrt6->dst);
+		/* fib6_del_route() zeroes fib6_nsiblings before unlinking
+		 * f6i, stop then as its list_head may no longer be reached.
+		 */
+		list_for_each_entry_rcu(sibling, &f6i->fib6_siblings,
+					fib6_siblings) {
+			res.f6i = sibling;
+			res.fib6_flags = sibling->fib6_flags;
+			res.fib6_type = sibling->fib6_type;
+			rt6_nh_insert_pmtu_exception(sibling->fib6_nh, &arg);
+			if (!READ_ONCE(f6i->fib6_nsiblings))
+				break;
 		}
 out_unlock:
 		rcu_read_unlock();
-- 
2.56.0


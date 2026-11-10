Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.68.214
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304831;
	b=SqQbVXzSWvd0jy9lHhKtgOVxS0xYWvbKAwZIK/kpJyhySiiIvEvw2lJNrXSplWi0SqE6
	 DSkRp4X5uXraGKmuNWLWLD2maPDEJjpJExjxGt5Dg3yFaM6+fZKtq2WWRKWHQJCLVeMZq
	 3l+cUTyugbqt8OX9VloNI/8SBUWR7kj/O69fFPZsv5gXRwqzpMqACHqZIqyD7oszEcHwy
	 6jwYwFMnZoGK7P52yHeojZyopGZ1oJ4cmGuqtn1Rj3qcwmcs9KVCnWYtojfHQw4/Ft/jV
	 OWQoGblFSiFGRY4qAOMIMcygKsI/Rbe2mO1zWUuEVUmhJC2w4n8pqIwpnjOam0/omLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304831;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 mail-alias-created-date:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Info-Out:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-JNJ;
	bh=MQj0QwuCrYtM4se9tYqwRptO8SmEOXvj2K8pv59RLX8=;
	b=LCjh9lPgE+4mxJQINoh94BAnlCPRvcDq+qS2YGWvj4so0mg73HUNf1cfihh+h5xFt+JH
	 48ZLg+IoLYywT2L+eg0c82sd1tZFx8cxp09c1PQtdpHWci9RjST9R0PcGviuYsoNw87Nk
	 n8vwL7T2H3z1pTQxPykXxiXL3R2vV8IfiVqTGGh/ZCkrwlkObOIObY3jIRZ9GPkvEE1bV
	 U5JiG4mUXHPukX1Q0bD/OHxY0ydGq0DUEALHw2BLYFM0c+FFaaEOR7s0JvSAiqQK8yF5i
	 xS5lRO562g29mlyFHp50FRad0jufijL9qocJl4p9ltZcNP2homvVjaZYhTJNnUFfAGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=verdict.gg;
	spf=pass smtp.mailfrom=verdict.gg;
	dkim=pass header.d=verdict.gg header.i=@verdict.gg header.a=rsa-sha256 header.s=sig1 header.b=gbkkEG3m;
	arc=none smtp.remote-ip=57.103.68.214
Received: from outbound.mr.icloud.com (mr-2002l-snip4-1.eps.apple.com [57.103.68.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C58B60A262C
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 10:00:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C58B60A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=verdict.gg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=verdict.gg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=verdict.gg header.i=@verdict.gg header.a=rsa-sha256 header.s=sig1 header.b=gbkkEG3m
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-20-percent-1 (Postfix) with ESMTPS id DF0191800246;
	Tue, 10 Nov 2026 10:00:28 +0000 (UTC)
X-ICL-RepId: 01a1c4e6-e5ac-710f-9701-c1c61ca3c460
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQ1OHVwORQFEF0oBTVIPDxRcFFofVgVyBlwKVwRUHxwXXlhVCQodVwJdEVAZGQxVUEsbDlwFS1oVVRcOAkIfUB9MFldDWhkcGVoUXBhTRVEfVFhDGUVWaUELTx1dGVscQmRYVwkKHVcCXRFQGRkMVVBUEVdQC1kCQg9JAlwHWwtFAEgAQw9fCkEKVQBAUw5eGUsZXS1BDkAUUBtHQ1AMDFBNAUMICghHA00XXjJTBF8RUBY=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verdict.gg; s=sig1; t=1794304830; x=1825840830; bh=MQj0QwuCrYtM4se9tYqwRptO8SmEOXvj2K8pv59RLX8=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=gbkkEG3mKdrfeamnXDYB86ScqeST05aRpuM0k61A4HY73UbIE9KGUD4OoyfIrIqa896RhAkCoxpSoz512vrggVTlFxZBWLe+2sP4Hi9Nht9zpc8nmfXUk2Xr5zBY4+qMIussF9BI8t2XnSFvQ5Txtwum4A5HyigxqB+zjYDWfqxhgoD+kZFR2ZFrUXpA4Z9Xdf158BItWBy6pRSQwSxujPcXIiWl96enbyPEV7EKPlMvodyS4Aj1NyFL8Z55SPQWqdAngfSxn8cm9makPVe5drRcANBD+1p1R9ktYLTC8k88IonpUeaL04n+MnlqMX2U38wdAZIufoKi9vCzPLV1QA==
mail-alias-created-date: 1621344842221
Received: from DelNac.mail.msk (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-20-percent-1 (Postfix) with ESMTPSA id DCF1C1800100;
	Tue, 10 Nov 2026 10:00:25 +0000 (UTC)
From: Vladimir Vdovin <deliran@verdict.gg>
To: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Vladimir Vdovin <deliran@verdict.gg>
Subject: [PATCH net-next v2 2/3] ipv6: Cache pmtu for all paths of a multipath route
Date: Tue, 10 Nov 2026 12:59:02 +0300
Message-ID: <20261110095903.84813-3-deliran@verdict.gg>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110095903.84813-1-deliran@verdict.gg>
References: <20261110095903.84813-1-deliran@verdict.gg>
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
X-Authority-Info-Out: v=2.4 cv=QYprf8bv c=1 sm=1 tr=0 ts=6af2eb3d
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=yd4jPb-wh16-Q3oM4EAA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfX020w+geYTy8S
 7NYtrvh73AhfptRgbKNBgtMRgnVgHr6wOuy9sOKAxd2V2Sg/LErJBkV4I9m4EB9qdaVf4XGqHCs
 wvAnSY1oLxyHYZenV3JlBalDTDugjhGg7jdc/Yaa1Ii4bJO2qv04x3+7Xel3yu117Z1JX4C4K/K
 /OTFVcaTjm9L8lEWxKJ4SHnlxQuEZfr6CHxlZontQzY9NCvgAH8YZ042ktRiuDlbH51+a3sNXES
 D0n8WCPWFb1P9alqbLx2Eq0cQuyEEOBCqtZLl676H2GK5OSoBw95/2SLVlH2M/7BBCXo+KUDYD+
 ugrXlvSKDFr2gd3K8u9PK2R1QAeJvx5WBcP8cGUppkxxz8fZ8E4pc/5Xishrpo=
X-Proofpoint-GUID: 5aFPLlcuAcD_1e8xGZYOOmtzNIeyVUYI
X-Proofpoint-ORIG-GUID: 5aFPLlcuAcD_1e8xGZYOOmtzNIeyVUYI
X-JNJ: AAAAAAABElknjHfav/h7JEi1N4W45cDUWyLfuwZ5b9q9qR8K171WJNSvGvMYCBJ/qggTSf
 SSzUg2GbNuZ913yj+xlYdFnDX4IiRoMkK3w+hv1ViqFTYS8+q//KoShf9VXIJs9oHG6jwJ
 23KkdTJGhQBf2xfPQVAOMjNtwFqIQR8/8bdGzKSBnBeaJS2NqIrOu8OBraqW706Zo26dsB
 99IQLuT6Ep2C5DHspP25WJZX9nRXFLjYftm3udsE29yfYe/9ZY0ZG2uxvSa5Ng6pzGzWZg
 LlNaocbJNoF3VxsHHKD4ZVJUb/Anbn4rD5biGeN2lga8IQP38xNJ3bUqtWq8Og1Tsw7sB+
 wv68Dqn75+zXuLUZIff9hDFT+6rAHpiZy4YCq94pVUVJThBtfI6r0sbHl5n7D0kfN3gCwr
 g97CwPr7fmVmGXhHcU2QeHD+6dLwc78LwTkLz7w7/JKVIpj0d9vbxOVwHkDhyNKf0P6pdH
 I/1gT4r6uOnlQiDMyrnmmXtINIlqhg2LQ0cn/f2t5VPtLRR3c8a/qCaWWAxDna35I6EaiA
 A5rk4K3BsKvWECn1+ebK4CasIdwcF5zM4jV2cGt1Y/VKfaj4qRcpMbqQmWPe6pNvy0SH1L
 xKx0sVhYNbQblvZGMHghLZ+z3bjGtf0dWnZyJp2rccxgtVKZX9rDgF7baMIHNG2HXS5fPr
 LGpK8OeY5mXqSkqvqeh7KLEosKBQhvWlTFSBT2FdLDGT5fJkMh9ZirRbQrXFymMrx1GZLd
 0dF9cxTG/wcqDjuW50dxYae2A7jHEbHyr5Ukgw3mHNFLL0QFSOnpz/ATWGzfKrbaPfWElw
 PDYTKJ3d7g7TmsCp+VccjQjKfMsAZtoFNqcykHn3aXs=

ip6_update_pmtu() looks the destination up without the protocol and
ports the offending packet was hashed on, so with a multipath route the
exception may be created on another path than the one the packet took.
The flow then keeps sending too big packets on its path, every Packet
Too Big lands on the same wrong path, and the flow blackholes.

Same problem and same fix as for IPv4 in commit 7d3f3b4367f3 ("net:
ipv4: Cache pmtu for all packet paths if multipath enabled"): cache the
pmtu on every path of the route. For a nexthop object walk all of its
fib6_nh, for a legacy multipath route walk the siblings of the fib6_info
the dst came from. A path that already has an exception for the
destination gets it updated in place, so its gateway from a redirect
stays and its pmtu never goes up, and that also covers a dst that is
itself a cached exception, which used to be updated alone.

Link: https://lore.kernel.org/netdev/ad29493c-9e48-4a94-b327-e47af3a9d137@kernel.org/
Signed-off-by: Vladimir Vdovin <deliran@verdict.gg>
---
 net/ipv6/route.c | 124 +++++++++++++++++++++++++++++++----------------
 1 file changed, 82 insertions(+), 42 deletions(-)

diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 04098cf32eab..dc982400fbab 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -2911,12 +2911,52 @@ static bool rt6_cache_allowed_for_pmtu(const struct rt6_info *rt)
 		(rt->rt6i_flags & RTF_PCPU || rcu_access_pointer(rt->from));
 }
 
+struct rt6_pmtu_arg {
+	struct fib6_result	res;
+	const struct in6_addr	*daddr;
+	const struct in6_addr	*saddr;
+	u32			mtu;
+};
+
+/* Cache a pmtu on one path of a route: update the exception the path already
+ * has for daddr, keeping its gateway and never raising its pmtu, or create one.
+ */
+static int rt6_nh_update_pmtu(struct fib6_nh *nh, void *_arg)
+{
+	struct rt6_pmtu_arg *arg = _arg;
+	struct fib6_result *res = &arg->res;
+	struct rt6_info *rt;
+
+	res->nh = nh;
+	rt = rt6_find_cached_rt(res, arg->daddr, arg->saddr);
+	if (rt) {
+		u32 mtu = dst_metric_raw(&rt->dst, RTAX_MTU);
+
+		if (!mtu || arg->mtu < mtu) {
+			rt6_do_update_pmtu(rt, arg->mtu);
+			fib6_nh_update_exception(nh, res->f6i->fib6_src.plen, rt);
+		}
+		return 0;
+	}
+
+	rt = ip6_rt_cache_alloc(res, arg->daddr, arg->saddr);
+	if (rt) {
+		rt6_do_update_pmtu(rt, arg->mtu);
+		if (rt6_insert_exception(rt, res))
+			dst_release_immediate(&rt->dst);
+	}
+
+	return 0;
+}
+
 static void __ip6_rt_update_pmtu(struct dst_entry *dst, const struct sock *sk,
 				 const struct ipv6hdr *iph, u32 mtu,
 				 bool confirm_neigh)
 {
-	const struct in6_addr *daddr, *saddr;
+	struct rt6_pmtu_arg arg = { .mtu = mtu };
 	struct rt6_info *rt6 = dst_rt6_info(dst);
+	const struct in6_addr *daddr, *saddr;
+	struct fib6_info *f6i, *sibling;
 
 	/* Note: do *NOT* check dst_metric_locked(dst, RTAX_MTU)
 	 * IPv6 pmtu discovery isn't optional, so 'mtu lock' cannot disable it.
@@ -2942,52 +2982,52 @@ static void __ip6_rt_update_pmtu(struct dst_entry *dst, const struct sock *sk,
 	if (mtu >= dst6_mtu(dst))
 		return;
 
-	if (!rt6_cache_allowed_for_pmtu(rt6)) {
-		rt6_do_update_pmtu(rt6, mtu);
-		/* update rt6_ex->stamp for cache */
-		if (rt6->rt6i_flags & RTF_CACHE)
-			rt6_update_exception_stamp_rt(rt6);
-	} else if (daddr) {
-		struct fib6_result res = {};
-		struct rt6_info *nrt6;
-
-		rcu_read_lock();
-		res.f6i = rcu_dereference(rt6->from);
-		if (!res.f6i)
-			goto out_unlock;
-
-		res.fib6_flags = res.f6i->fib6_flags;
-		res.fib6_type = res.f6i->fib6_type;
-
-		if (res.f6i->nh) {
-			struct fib6_nh_match_arg arg = {
-				.dev = dst_dev_rcu(dst),
-				.gw = &rt6->rt6i_gateway,
-			};
+	rcu_read_lock();
+	f6i = rcu_dereference(rt6->from);
+	/* fib6_del_route() and a NLM_F_REPLACE clear fib6_node before the
+	 * route and its siblings are released, don't walk them then.
+	 */
+	if (!daddr || !f6i || !rcu_access_pointer(f6i->fib6_node)) {
+		if (!rt6_cache_allowed_for_pmtu(rt6)) {
+			rt6_do_update_pmtu(rt6, mtu);
+			/* update rt6_ex->stamp for cache */
+			if (rt6->rt6i_flags & RTF_CACHE)
+				rt6_update_exception_stamp_rt(rt6);
+		}
+		goto out;
+	}
 
-			nexthop_for_each_fib6_nh(res.f6i->nh,
-						 fib6_nh_find_match, &arg);
+	arg.daddr = daddr;
+	arg.saddr = saddr;
+	arg.res.f6i = f6i;
+	arg.res.fib6_flags = f6i->fib6_flags;
+	arg.res.fib6_type = f6i->fib6_type;
 
-			/* fib6_info uses a nexthop that does not have fib6_nh
-			 * using the dst->dev + gw. Should be impossible.
-			 */
-			if (!arg.match)
-				goto out_unlock;
+	/* ip6_update_pmtu() looks dst up without the protocol and ports the
+	 * too big packet was hashed on, so dst may be another path of a
+	 * multipath route than the one that packet took. Cache the pmtu on
+	 * every path, or that flow would keep sending too big packets.
+	 */
+	if (f6i->nh) {
+		nexthop_for_each_fib6_nh(f6i->nh, rt6_nh_update_pmtu, &arg);
+		goto out;
+	}
 
-			res.nh = arg.match;
-		} else {
-			res.nh = res.f6i->fib6_nh;
-		}
+	rt6_nh_update_pmtu(f6i->fib6_nh, &arg);
 
-		nrt6 = ip6_rt_cache_alloc(&res, daddr, saddr);
-		if (nrt6) {
-			rt6_do_update_pmtu(nrt6, mtu);
-			if (rt6_insert_exception(nrt6, &res))
-				dst_release_immediate(&nrt6->dst);
-		}
-out_unlock:
-		rcu_read_unlock();
+	/* fib6_del_route() zeroes fib6_nsiblings before unlinking f6i, stop
+	 * then as the walk would never get back to its head.
+	 */
+	list_for_each_entry_rcu(sibling, &f6i->fib6_siblings, fib6_siblings) {
+		arg.res.f6i = sibling;
+		arg.res.fib6_flags = sibling->fib6_flags;
+		arg.res.fib6_type = sibling->fib6_type;
+		rt6_nh_update_pmtu(sibling->fib6_nh, &arg);
+		if (!READ_ONCE(f6i->fib6_nsiblings))
+			break;
 	}
+out:
+	rcu_read_unlock();
 }
 
 static void ip6_rt_update_pmtu(struct dst_entry *dst, struct sock *sk,
-- 
2.56.0


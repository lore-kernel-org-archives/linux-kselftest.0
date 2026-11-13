Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.71.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572574;
	b=tEg8I/r1rayO7SbEOFTBbOHyJkisXavU/fBsyj9vBJV+JsDQ0sdujjPo/4LygNVfLVaU
	 AF6AUopCvy5em15LsgpuQwzKBv5AXo141xD+/w5ii42GP7j//w7LtNhjnoHti+ccgSnTZ
	 BYwGT2kgxJHbDOy8bpr1CzKBW3bXtDPGOCCB1/tACdDTXy7BbTf1xIVZkWldNbslSCPam
	 Op46e51xslm9LORQnChCTSvCutqSuex1kyNQUCz/0gpbDXLaLJhS+qV1SYvv2bNI9U0xo
	 1ylZnVj4MQ9eXjEirGqR0lqttzJfgvwoLm4e3k3etpYIjgGAnv9kRQYPiP9pmuzzWFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572574;
	h=DMARC-Filter:Received:X-ICL-RepId:Dkim-Signature:
	 mail-alias-created-date:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Info-Out:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-JNJ;
	bh=KGylqHnvsSTjU0nTqQedWOHt6q4bSFKygjVoGVm+fL0=;
	b=BfhpotiW1YHInLPqYTohnYiG5kjMN0s9BoJEVXp4OrONgr/eQ+EpKURUbNnrLGKyOWYK
	 LVfBqg3mmppMOBedvHeam+avqlQojjNTVMkphQTDjQWlOOORb5TKLmkPu/F4pWUS50cMA
	 cZwl7qpoivUHmjP8iEYTg+tiZ3p5RsWq7AhS8gViZwlsOo0q+V+4NdvTIn7A25jxGJaJ7
	 MYrPqJ8hT/D6K6PHwDdhhFcBT2LZsMu8c4gjmXFDLLJCxaesThb2sZpYiajUuSMhOOyFx
	 F/uxt0ZTCvK5EGgk3t3Lol5vFbNsyRGf9TjF9HtLwEhVxwpdbJIIG1ysjcYLUDsRaSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=verdict.gg;
	spf=pass smtp.mailfrom=verdict.gg;
	dkim=pass header.d=verdict.gg header.i=@verdict.gg header.a=rsa-sha256 header.s=sig1 header.b=celweJ6m;
	arc=none smtp.remote-ip=57.103.71.52
Received: from outbound.mr.icloud.com (mr-2005e-snip4-10.eps.apple.com [57.103.71.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B36760A3816
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 12:22:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B36760A3816
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=verdict.gg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=verdict.gg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=verdict.gg header.i=@verdict.gg header.a=rsa-sha256 header.s=sig1 header.b=celweJ6m
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-6 (Postfix) with ESMTPS id C5601180028F;
	Fri, 13 Nov 2026 12:22:52 +0000 (UTC)
X-ICL-RepId: 01a1d4dc-5868-72ed-ad0a-a4a493e58525
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verdict.gg; s=sig1; t=1794572573; x=1826108573; bh=KGylqHnvsSTjU0nTqQedWOHt6q4bSFKygjVoGVm+fL0=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=celweJ6mK1FlQK1y2dKTyF62gva5sO1VyDAek13vcfvszGBcHJHaftbHxwUaVVj/R7iAxD/tgyJ8EDN4lRJdSemiRH0bpDEYMk+D16jpeB624h+K1+4aST/YAQ/vLAoee43HOY01/gtz4hryI2zcFsIlWjDaksj+BMjjlrZCrFNYbZRPoSnEF63us/BtJKVY4TKewljjVZJ5oKxHKFz4xEkwO8+Wo4LiALpO6SAjvsamODyuXO+KZ1uz/b+CqH6dovq4RiGYRWAE+vFNqju93U1XzcplRn2StFcSLknSg9ihIwItF87gI9DWpt4czFRlQcKDqwtRCE59v3lS+R6TUw==
mail-alias-created-date: 1621344842221
Received: from DelNac.mail.msk (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-6 (Postfix) with ESMTPSA id F142B18002A1;
	Fri, 13 Nov 2026 12:22:49 +0000 (UTC)
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
Subject: [PATCH net-next v3 2/3] ipv6: Cache pmtu for all paths of a multipath route
Date: Fri, 13 Nov 2026 15:22:36 +0300
Message-ID: <20261113122237.88990-3-deliran@verdict.gg>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113122237.88990-1-deliran@verdict.gg>
References: <20261113122237.88990-1-deliran@verdict.gg>
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
X-Authority-Info-Out: v=2.4 cv=SM/Xx+vH c=1 sm=1 tr=0 ts=6af7011d
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EYaFdmsEC1CjpenOt5ir:22 a=ieB-HjlS9-5fP-wcyLUk:22 a=VwQbUJbxAAAA:8
 a=Om8ETnXUOpCeNUuhku8A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0OSBTYWx0ZWRfX5FUKNx3z/Fkm
 eyED/pBAKoew8zx1E/+eBVbzvcAQZlZlKd71Z9Ji3yF/gqN+854MFKQYREzMZwiIv35b87VB3e7
 YA46AwPNL7PS3Ag7xQo0MsGKaWIEFv8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0OSBTYWx0ZWRfX3pesGpu7Xku3
 Kb7QrRAPk5cQ2aWvd4VeaPzcVrB/ZqPCssOIOeMkN/ZE6WYMog7m5AKEOqmcKaMeIm0OdTdQw2E
 63osikHgk9IN88fro8R28gXp9iBcKI64yof+ViDMNqxTfHfmLV+oWRJXFjWF0FYxgbhbwVWRg2p
 bqDPtDm+r6hK1560RHfLnEapuvF/jyTZE2Akn3hcckmJ7g8NBDGdNw+gBEILJ1I4W2QgMujJ2g9
 7EpVeL9Ic1/T56nlpJ6JpgQBy3NNLLqUCWhSP/l2WAGkwp7YRuStwd4d4ZjHO9K1CPXtONn2/6Y
 YYoyl2MmRqIJcSDs+KYXTp6UG8c2gcDPOqx5JSdoS620luJ19RYpVdRawG3XH8=
X-Proofpoint-GUID: MLHMo0fI-mxQ55uNtw5KDWLOcgDLhJrB
X-Proofpoint-ORIG-GUID: MLHMo0fI-mxQ55uNtw5KDWLOcgDLhJrB
X-JNJ: AAAAAAABGNdUBIiINU6xVXvrsF8xMc622jB2Ll3zKOuhqqwpT+qsfGT0Tr3btbWuHNercb
 nOqySqE0diJw6oRm1lGHDTmJ1Z6bmlaWsMCU41QrkBoDEoefcQzluv3XgkD3NZuYUuGy9k
 oLluxKb0WDRWx494FrcX8azi7uZlCLXUJfmHQWI8OiEQQNJKUdYqaNYAev9uTVOYMuP8rK
 N8G752vdhQ708YM9yPfJ6A+qfTzA+XTME5+cTu9WcBwQ4zcUGfjf9GAk1hAa59h0+g70x5
 BmKc6w1vN+z/pjlu6fpOVIre6tKcgH8y4ywUxFDjJqsRYQcn7uGFynjC4RWo6zCcI9P2Yt
 HjG2Ts1XR1u9pNXuRa2tUBF18eU9TuRHxj27zyuHfP2fC5WQgk91jDGVc2nxtZzcyTdMZP
 QXjdLJlgoKi5ZrlAQlMXIl4FbE5RoQnGweac2L+5qk6BUFUUMDbMSGjBv2ctk9Cu51V3SJ
 zVEgojeBXkCGp2yZK4xJyJdVox8WoxGu/YjABEPGmW5a8RQ1ufkYSDoO4z0VgXU3enfqur
 U1Oy3EixGiqIh+1UHXcKOOEk6fpNwxyVGV8kmsUdk8BoyvQe9zxfZlaRkKyLPSa1Y/+OAB
 S/P0gv/UUP3SPSvGIE1H/QkYBDHWFITtqbCHtFFzRSurbGEx4u5FTXpeDnd3hrFLWWo3kS
 VLnbFYdOTPAIKDNfJdiG6bGu5LkPPrAcgeAWt0fy8o7tUHyNvab0rIkPuZ4oQfGiisBUdI
 f8ZowpDzUaQ8F+47q18nT0tfHvjaSyxW+Ye7cEpu8OXMMus7fQO294s02tQbZ6qhvCMgCZ
 io/x4wJuUbheEnhoEXgSRo1TN97OH9uRHni88EajbiLahO8=

ip6_update_pmtu() looks the destination up without the protocol and
ports the offending packet was hashed on, so with a multipath route the
exception may be created on another path than the one the packet took.
The flow then keeps sending too big packets on its path, every Packet
Too Big lands on the same wrong path, and the flow blackholes.

Same problem and same fix as for IPv4 in commit 7d3f3b4367f3 ("net:
ipv4: Cache pmtu for all packet paths if multipath enabled"): cache the
pmtu on every path of the route. For a nexthop object walk all of its
fib6_nh, for a legacy multipath route walk the siblings of the fib6_info
the dst came from.

A path only ever lowers what it uses: the pmtu of the exception it
already has for the destination, which is updated in place so that a
gateway from a redirect stays, the mtu of the device for an exception
without a pmtu, or the mtu of the route and the device when a new
exception is created. That check moves from the looked-up dst to each
path: the lookup may land on a path narrower than the Packet Too Big,
which used to end the update before the path the flow is on had learned
anything.

A dst that is a cached exception, or can't have one, is still updated
itself as before: the walk is keyed by the destination and would not
find the first hop dst of a socket with a routing header.

Link: https://lore.kernel.org/netdev/ad29493c-9e48-4a94-b327-e47af3a9d137@kernel.org/
Signed-off-by: Vladimir Vdovin <deliran@verdict.gg>
---
 net/ipv6/route.c | 121 ++++++++++++++++++++++++++++++++---------------
 1 file changed, 82 insertions(+), 39 deletions(-)

diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 04098cf32eab..ccb11a465528 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -2911,12 +2911,55 @@ static bool rt6_cache_allowed_for_pmtu(const struct rt6_info *rt)
 		(rt->rt6i_flags & RTF_PCPU || rcu_access_pointer(rt->from));
 }
 
+struct rt6_pmtu_arg {
+	struct fib6_result	res;
+	const struct in6_addr	*daddr;
+	const struct in6_addr	*saddr;
+	u32			mtu;
+};
+
+/* Cache a pmtu on one path of a route, never raising what the path
+ * uses for daddr. An existing exception is updated in place, a new
+ * one would lose a gateway learned from a redirect.
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
+		if (arg->mtu < dst6_mtu(&rt->dst)) {
+			rt6_do_update_pmtu(rt, arg->mtu);
+			fib6_nh_update_exception(nh, res->f6i->fib6_src.plen,
+						 rt);
+		}
+		return 0;
+	}
+
+	if (arg->mtu >= fib6_mtu(res))
+		return 0;
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
@@ -2939,55 +2982,55 @@ static void __ip6_rt_update_pmtu(struct dst_entry *dst, const struct sock *sk,
 
 	if (mtu < IPV6_MIN_MTU)
 		return;
-	if (mtu >= dst6_mtu(dst))
-		return;
 
-	if (!rt6_cache_allowed_for_pmtu(rt6)) {
+	rcu_read_lock();
+	/* A dst that is a cached exception, or can't have one, is updated
+	 * itself: the walk below is keyed by daddr and may not find it, a
+	 * socket with a routing header holds the dst of the first hop while
+	 * daddr is the final destination.
+	 */
+	if (!rt6_cache_allowed_for_pmtu(rt6) && mtu < dst6_mtu(dst)) {
 		rt6_do_update_pmtu(rt6, mtu);
 		/* update rt6_ex->stamp for cache */
 		if (rt6->rt6i_flags & RTF_CACHE)
 			rt6_update_exception_stamp_rt(rt6);
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
+	}
 
-		if (res.f6i->nh) {
-			struct fib6_nh_match_arg arg = {
-				.dev = dst_dev_rcu(dst),
-				.gw = &rt6->rt6i_gateway,
-			};
+	f6i = rcu_dereference(rt6->from);
+	/* Don't walk the siblings of a route being removed from the tree */
+	if (!daddr || !f6i || !rcu_access_pointer(f6i->fib6_node))
+		goto out;
 
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
+	/* The lookup in ip6_update_pmtu() doesn't hash on the protocol and
+	 * ports, dst may be another path than the too big packet took:
+	 * cache the pmtu on every path it lowers.
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


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.71.114
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572574;
	b=GMLJ/WisImivo4xlXOiObGE1AwRs80xuj+BZqvYwWDsEG5B2Vjt00t7ku6sxDAnNld3L
	 fHgRYQ1EkefYySUdaI73f5Zr89n1Uwxa1xlYAj+ZG7YzEE0J1PZNAfolFt+8AT64OlzS9
	 02wwvpPKrct7S9lK3jFZ9jYfH6gxVV06UJOA7ts4/O4YdY4l+fibgLEKKxH5NwPqoLOVg
	 Rgy4OTqN4x3A7TNNSEZuKA8tuLDjDa0OoCW6aCWh8mr16VLGz4FP8+LnLFE9CkB/s90vu
	 Nq/yhg3qSV5vD08Q+f+QsXr2eDk+KqeiVjUkRycPEa9Lr8FGzNknGKUQVLamvm1Sq4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572574;
	h=DMARC-Filter:Received:X-ICL-RepId:Dkim-Signature:
	 mail-alias-created-date:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Info-Out:X-JNJ;
	bh=CAPJTphDYYFKEENJOeATe0OoS3X41+ZOVJxvbKyL+Ow=;
	b=bJpDIpuuDMDO/9loPo2uTLRwUAla5C23A4poCU18lrC6dfpT/7gLqP5mqW4u2KlrpI7X
	 xDgtssf4xbaUnd22agR9s2H5MEDKDZrowWAoQPKYtnZEwmu/q+GwdO58VxSV4PkIBR714
	 21e6sCcHp+xwpf4HUtlRJU9XtZ6wyFrLKpPiLdPgrmUvS28VcBXCOxAspN7YVkkVwL2bH
	 B6Hd/QEaN+dh2qs1Jf8aqshIprhPvfgGFFI6tw80gWWhy3YR2Dccy/1zgyJtvayuRBFgH
	 MvtkcEohVUYduujzjKJReV91ErDXlhYwgGX5M4VdRmsvopBcEBxcHZdQhmyzpfXQkOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=verdict.gg;
	spf=pass smtp.mailfrom=verdict.gg;
	dkim=pass header.d=verdict.gg header.i=@verdict.gg header.a=rsa-sha256 header.s=sig1 header.b=KUMlAOWr;
	arc=none smtp.remote-ip=57.103.71.114
Received: from outbound.mr.icloud.com (mr-2005b-snip4-1.eps.apple.com [57.103.71.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C8460A3808
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 12:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8C8460A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=verdict.gg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=verdict.gg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=verdict.gg header.i=@verdict.gg header.a=rsa-sha256 header.s=sig1 header.b=KUMlAOWr
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-6 (Postfix) with ESMTPS id 2317A18002F0;
	Fri, 13 Nov 2026 12:22:49 +0000 (UTC)
X-ICL-RepId: 01a1d4dc-4dd5-7c87-9bb1-eb56a6bfed53
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verdict.gg; s=sig1; t=1794572573; x=1826108573; bh=CAPJTphDYYFKEENJOeATe0OoS3X41+ZOVJxvbKyL+Ow=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=KUMlAOWr6DV2m92RyUnR/G1u7oVsHeNmI9PIKh80FwQLG4n5/7rmmikoRcl/yda4wU0Y2cjAeeY+chb33t3yARRckwsmTY2T1NvDIstVXxh5rWzq0KcQSB+0NE9cb5izB16gyrva5QxNb2XhFIlry9W05YIJ32QlRhtcBVMJNMKL3QVdfHwY6GmgyTdbjVmltNNNDSUeXYj3shCnDiUGzPvr/4SgEqSwgfzBcZDAIwTMjMmwyY/IeSE6gaoOOEKTAbLevNPqv9epKYZht7kDlnQhqNF9ojo6rZjaSkWfFMBWH1xAGhvp+XW5fO42FR8HdmmNo7RPty4Zz3h+crsa7g==
mail-alias-created-date: 1621344842221
Received: from DelNac.mail.msk (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-6 (Postfix) with ESMTPSA id F054A18002EE;
	Fri, 13 Nov 2026 12:22:46 +0000 (UTC)
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
Subject: [PATCH net-next v3 1/3] ipv4: Only lower the pmtu of the other paths of a multipath route
Date: Fri, 13 Nov 2026 15:22:35 +0300
Message-ID: <20261113122237.88990-2-deliran@verdict.gg>
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
X-Proofpoint-GUID: iYPjl1fPsKEE3JDTr09BaKW-U0xrB-pa
X-Proofpoint-ORIG-GUID: iYPjl1fPsKEE3JDTr09BaKW-U0xrB-pa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0OSBTYWx0ZWRfX3ZuI9pm4zDZg
 3V56i7+rCEIIu1cyXBD1u3M7nF6LYS22bJYGXBiqUgVwawnPGZpu3/6p8KR8RfHYCTDaI4PI/bC
 hcO4Hs0wkDjZzTsGIIkkhmBuJX9rNacw8DA3u6+C5z5MIqvTh1dDSmZtZfVKV5hwWwimqllo4Yo
 5YAD9a2VULrGvv4Hfe/Ldg0N67pExXGjSDpCl8cuTMI6IdfNcAGhJoxtaoXPLUF2eUq1PgPf3xc
 rLB99GJ64iaQX2sLUGL1oC5qNTDT3aRzihjVYfeHm+TuXnJq5H0xbEyI+d/62rGE5RBo2nOuEfs
 UKwLx3bD88cir2hIazGWmmZ5eOr8LP1ID3KAlsSjDThJM86VtvTk+24YjC1Ic4=
X-Authority-Info-Out: v=2.4 cv=WrYm8Nfv c=1 sm=1 tr=0 ts=6af7011b
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=LRu4Mgyf0Pww-iI-pl8A:9
X-JNJ: AAAAAAAB4dz2jpGX6Y8hexPYNj6OFg2unHRmK+2Rvda4H/yTk1YfO3l4d9GDdMwTvTW0sk
 PMc87Ibp0SFXYpR3KdGLx3rBzb4qEWNTMyAFoMr+5HnD/9mSOIyUywHGk7drnJXEWKWFhY
 81oB2c3A4uSg8wnRRo4VbiCVth0FBKpAayYFXh56otv31g8s1hrVUcMDBWfsoS5gyba2TT
 fPJPjPnO5EoWD8UlL5Ekkmaxdu3ljRRThxnjk36vRMhuyMJinoG0hL/kFUd1c3s5B/9H0l
 NGfoRdcTeJWBV94Pc8H+MJwfn93tMCOxomVV0GiCjCKlsvOKSAINFVRV1eE88hp/DODMpL
 hb6y2IA+kUPep9cryGAkJhKDIptwW6Rlk2zNpa7dl3FzVr/+tQW4Ls3/J6d/7VnEnBSB62
 d7i2Uzw2Glc2NIZR1QvQJn4L0nl9zRtQIJlvEZsvx5N2FLOUhuVjQcafzy26ROTiaFy8Wl
 nNmyPmkmAxeLkifvS9e/l3rFQiVXVTzMdzWNUUsDKdg5t/X38zmVW4BSurFTz5rDn7/u2+
 X3nuXCar7PFdWWXCKTS8lSn4Plds4BxwMl0+X/sHdrzG7PdQNYzl6F2QJY72jk7Aumi6Pb
 uNjJYYGRq/kT7Eo+5zR+AWuinFQi4Aj7NyFKmwntFh8K+ib+8ab0aqk78HDJoGMWwZYId7
 ol+/56857PB/t8l3ayudTLJwerD/TV9kDH8Uoxqv4/8MZsrys3pWq266G6wvNgDrcP1Wz/
 UJ2+bEVxKd5Nc540lrlG4jETnron2PXsyiiErEeHEQHAxUHmGUiXd60NRNLE7aU+ZTd9Bs
 EaLq6EsD9i9prqokjqUfVMGaLPOF9wi0nB+MLvi2Fi6pBQ==

Since commit 7d3f3b4367f3 ("net: ipv4: Cache pmtu for all packet paths
if multipath enabled") __ip_rt_update_pmtu() caches the mtu of a
Fragmentation Needed on every path of a multipath route, as the lookup
there doesn't know the flow the message was sent for and may land on
another path than the one that flow is on. But only that path is
checked against the mtu, by the old_mtu early return, the others get it
as is. A path whose device or route mtu is below it, or that already
learned a lower pmtu, ends up with a pmtu above what it can carry: its
flows send packets of that size, which don't get through, and no
Fragmentation Needed comes back for them until the exception expires.

Skip a path when the mtu would not lower what that path uses now: the
pmtu of its live exception if it has one, else the mtu of the route or
the device, the way ipv4_mtu() would report them. A mtu locked because
it is below ip_rt_min_pmtu is still written everywhere, it clears DF
and has to reach the path the flow is on.

Fixes: 7d3f3b4367f3 ("net: ipv4: Cache pmtu for all packet paths if multipath enabled")
Signed-off-by: Vladimir Vdovin <deliran@verdict.gg>
---
 net/ipv4/route.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/net/ipv4/route.c b/net/ipv4/route.c
index d0a5f6d77094..f0da009f4115 100644
--- a/net/ipv4/route.c
+++ b/net/ipv4/route.c
@@ -150,6 +150,8 @@ static struct neighbour *ipv4_dst_neigh_lookup(const struct dst_entry *dst,
 					       struct sk_buff *skb,
 					       const void *daddr);
 static void ipv4_confirm_neigh(const struct dst_entry *dst, const void *daddr);
+static struct fib_nh_exception *find_exception(struct fib_nh_common *nhc,
+					       __be32 daddr);
 
 static struct dst_ops ipv4_dst_ops = {
 	.family =		AF_INET,
@@ -1046,6 +1048,26 @@ out:	kfree_skb_reason(skb, reason);
 	return 0;
 }
 
+#ifdef CONFIG_IP_ROUTE_MULTIPATH
+/* The mtu a path currently uses for daddr, as ipv4_mtu() would report it. */
+static u32 fib_nhc_mtu(struct fib_nh_common *nhc, const struct fib_info *fi,
+		       __be32 daddr)
+{
+	struct fib_nh_exception *fnhe = find_exception(nhc, daddr);
+	u32 mtu = 0;
+
+	if (fnhe && fnhe->fnhe_genid == fnhe_genid(dev_net(nhc->nhc_dev)))
+		mtu = fnhe->fnhe_pmtu;
+	if (!mtu)
+		mtu = fi->fib_mtu;
+	if (!mtu)
+		mtu = READ_ONCE(nhc->nhc_dev->mtu);
+	mtu = min(mtu, IP_MAX_MTU);
+
+	return mtu - lwtunnel_headroom(nhc->nhc_lwtstate, mtu);
+}
+#endif
+
 static void __ip_rt_update_pmtu(struct rtable *rt, struct flowi4 *fl4, u32 mtu)
 {
 	struct dst_entry *dst = &rt->dst;
@@ -1085,6 +1107,14 @@ static void __ip_rt_update_pmtu(struct rtable *rt, struct flowi4 *fl4, u32 mtu)
 				nhc = fib_info_nhc(res.fi, nhsel);
 				if (!nhc)
 					break;
+				/* old_mtu above is the mtu of the path dst
+				 * is on, don't raise what another path
+				 * uses. A locked mtu clears DF and goes
+				 * to every path.
+				 */
+				if (!lock &&
+				    mtu > fib_nhc_mtu(nhc, res.fi, fl4->daddr))
+					continue;
 				update_or_create_fnhe(nhc, fl4->daddr, 0, mtu, lock,
 						      jiffies + net->ipv4.ip_rt_mtu_expires);
 			}
-- 
2.56.0


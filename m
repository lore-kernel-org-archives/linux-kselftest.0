Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.68.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304826;
	b=YKmzJBibNflHeilf9m1LKnyrlRd2p5WDyjwkz1y2zONqBg5Or9pNjYw6CMpngCfWLik/
	 w6F/pkbzey41AoHIH4g/eGsjPDgl435TFPg89VtYVElT8jfOKmCZv9pwA4SxOVxnExxja
	 PtEhAyOdbrtuykITGgL1zpI7sKNlDB2Rvwa3gSVnZjZ/iEsYK4ErYGr9weNapfJ/kFqfn
	 xnZahzGxmb7UJ3RuDLrBdOTGKahgkUDCG/KCtPA1UXxeX6G517LzTJ12zO6f2K+j4xjwt
	 VYTVEHvQYbUeBnMsOMaeFOtUFv3PW99JbaR6K4zrgo904QKR3t0IHYjENTfhns7x9Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304826;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 mail-alias-created-date:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Info-Out:X-JNJ;
	bh=RN8ZkvlhX34Tk1dee4D/ugqq+fcGFGhyAbmyNwFLxn4=;
	b=ifHZDsa6qGdJm+/AE3Rrv3ICBVZKrxkl9FCnt0pgze0S5ZJeSl7CsNIMNCZUnp2Bep2y
	 j8DRgbwDkTr/bwxAx+RlpojNsQPIY1sikCANLeb5jvFjYQEACwKfWtEp5E3T0v2IbfF/8
	 7cDR0HMBvdH+lIRJCsrbBfx2SJK0Lddo1hgerqEGz0i9fGdXSM7+N81PtyU8FJNV3FkH8
	 T4ZEAtA4WjLElIvXdeZXlHm8XG4ZDLvlfHocBTVD9XRr8lDyklQOydNAoZzAkDiEM0mP2
	 pxRj4h+7idffRd8/D5vRHCIur++Fn4HALNPc463U8OcdErFxdqeeDiS1lE+iofevg2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=verdict.gg;
	spf=pass smtp.mailfrom=verdict.gg;
	dkim=pass header.d=verdict.gg header.i=@verdict.gg header.a=rsa-sha256 header.s=sig1 header.b=rQ6AT1Gf;
	arc=none smtp.remote-ip=57.103.68.145
Received: from outbound.mr.icloud.com (mr-2002c-snip4-2.eps.apple.com [57.103.68.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE55660A381B
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 10:00:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE55660A381B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=verdict.gg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=verdict.gg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=verdict.gg header.i=@verdict.gg header.a=rsa-sha256 header.s=sig1 header.b=rQ6AT1Gf
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-20-percent-1 (Postfix) with ESMTPS id AFD86180016F;
	Tue, 10 Nov 2026 10:00:24 +0000 (UTC)
X-ICL-RepId: 01a1c4e6-d587-7243-b878-885437dad5a5
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQ1OHVwORQFEF0oBTVIPDxRcFFofVgVyBlwKVwRUHxwXXlhVCQodVwJdEVAZGQxVUEsbDlwFS1oVVRcOAkIfUB9MFldDWhkcGVoUXBhTRVEfVFhDGUVWaUELTx1dGVscQmRYVwkKHVcCXRFQGRkMVVBUEVdQC1kCQg9JAlwHWwtFAEgAQw9fCkEKVQFAUw5eGUsZXS1BDkAUUBtHQ1AMDFBNAUMICghHA00XXjJTBF8RUBY=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verdict.gg; s=sig1; t=1794304825; x=1825840825; bh=RN8ZkvlhX34Tk1dee4D/ugqq+fcGFGhyAbmyNwFLxn4=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=rQ6AT1Gf0t57qpEl2ZWHtn6hQ3FjiblFOhOvc4NFw3WzG8TlH3uda19ETD4oC8DxNw2UPNaCFEIAk54nx7DuqQeKjLlFhm3lsFaNQnPJXUMdbA1rcIHHucPLsvIqBYlGShIsdcXvSOzZDOnpAHaE1SNovjAXWPWE01KFKF3GnK/HGMXNXJMQwKIVwh/pVudW+d/hHL5KtCJpvbTM/wlFPTa3ILYbudZxQsrsJ8MAbMs6eSGdxDzrSPP3L16rYU3ENHBwgTApjFpF0kB/IK+RjNIp8p4rLu+A/L9GVTL9ei2O9SuCRIi/2Gocviw4Lk59lLOheALXk6WzwotWfA8/kw==
mail-alias-created-date: 1621344842221
Received: from DelNac.mail.msk (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-20-percent-1 (Postfix) with ESMTPSA id 265FF180083B;
	Tue, 10 Nov 2026 10:00:21 +0000 (UTC)
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
Subject: [PATCH net-next v2 1/3] ipv4: Don't raise a cached pmtu from another path's Packet Too Big
Date: Tue, 10 Nov 2026 12:59:01 +0300
Message-ID: <20261110095903.84813-2-deliran@verdict.gg>
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
X-Proofpoint-GUID: nlOIsjE7nxGJL33fy_9iVp2aiTGawBs9
X-Proofpoint-ORIG-GUID: nlOIsjE7nxGJL33fy_9iVp2aiTGawBs9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfX2jI0py5DFVLB
 dceFmWrFtzbFdWlWP0Ng9YjA93kDJXKDsqFwLnhuNZVQKZOEm01AZQP2ljOX6hONRvvyagjopDB
 YXZTMS33SdhjayR9YqGOj8p+2DF7UffzQQ8MFCDYjL/nYfoxapomADeKs21258N6yPEhsLmQ1np
 /rcWrNypPQQ2h3hEmb7SlU2ggyMg5OyHVdR6YnWgHWu+e9dBo8QUclKmYxc4m6klWKIrmVxROQG
 Wdi2ucRyABtxnyMioaS4gsyAlt5i4SUM+xM1MZk/hbSM9cH848HDDifOKhN7TSpU2xZBN6/S1Cj
 5RN3LzDaoVsnhLcYfl9sE7Yre01EZyLSAj+msoX9TkUKUK/SQgRrrPzLmejz1E=
X-Authority-Info-Out: v=2.4 cv=Ft8IPmrq c=1 sm=1 tr=0 ts=6af2eb38
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=YTyG80iR5izhZJau:21 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=3mN7Y9myRci0mHi1Py4A:9
X-JNJ: AAAAAAABsT2+eNhVEwnPVesG6mJ3hxafhxnLf2Jnmn7EvRoNae92f/cRQl04YbOSu1r1Se
 FArW/MyQRwCYmPY8GgitHxHnBAIW5/WQ2vgmzq2bz2UruVOJ5yxgdHMohoK1S501B7ne00
 pEGrZfMXS6OQUdx5dXvuFm9yJtbcCVucUL1NjgzwuNneQVTybD68GGq2cnQ2TygEugzsUa
 oMCQivBJR6WycdFbySYfka0gJAm2BIITiZaC3RQYivXipWTjpwjh5n6JEeNI5yGOnKylf0
 t/yYJIQjtnO7eA1ZV78IiNHH0qRJCbhu4+IyLjyfe9QrOUBiRXbjE++Rd2PJ+5VAGyAe3w
 u0Xp/mrJrzq9pzYBBDf88+X/yRtVrK0CigLcL5n3IIQVFrCy7NpZop7G27TswiJoRRaWxU
 2QPBm6Fsd6uJVHVAFVa/Xdw3kcs53VEuRTzSzCGShp85clbg7jFHn7Jxg6kY2VJGeVSoSP
 o3RNszzjceG66mCivdp48xrwejK+P3wiUNgd6/jIwjdRhnojrKyf3s4PDUnIVJ4e7Ci2iZ
 mt7s9H4mHKnTeHWw52xo+1nqpvQkiSNd3teumc4/EJJiICq/D3GluMh8o2lXz+RbTn+vuF
 D22xCd3Lam9/Rl6mIJi+A4vdA0XH6bQj0GhqjP88Pj9YeHsl9YaOyFzu0tNHWweJ1u6tYq
 Wrl4mLMaxnuc/w2l84lRyp3THF6ui5XxCr0XEX67prDghXol32e5L+FreuSsa2nP/7/r82
 JQWkOZMJ6V3Sa8+K0P/yvt4Jp4S+L14dUotjMlGPSc4KY3HOqdGOh2KEdPmz6wRa0w6KPs
 FfRSQRug/kw86hb5juSagz0B+kIw+A1bZhmKSoO7DL1yROS7icvOssoVVBff5tds

Since commit 7d3f3b4367f3 ("net: ipv4: Cache pmtu for all packet paths
if multipath enabled") __ip_rt_update_pmtu() updates the exception of
every path of a multipath route, but update_or_create_fnhe() overwrites
whatever pmtu a path already has. A Packet Too Big from a wider path
thus raises the pmtu a narrower path has learned, and flows on that path
blackhole until it gets its own Packet Too Big again.

The early return in __ip_rt_update_pmtu() already keeps a pmtu from going
up on the path the Packet Too Big was looked up on. Do the same for the
other paths: leave an unexpired exception with a lower pmtu alone.

Signed-off-by: Vladimir Vdovin <deliran@verdict.gg>
---
 net/ipv4/route.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/net/ipv4/route.c b/net/ipv4/route.c
index d0a5f6d77094..596af782c1fb 100644
--- a/net/ipv4/route.c
+++ b/net/ipv4/route.c
@@ -676,6 +676,14 @@ static void update_or_create_fnhe(struct fib_nh_common *nhc, __be32 daddr,
 	}
 
 	if (fnhe) {
+		/* __ip_rt_update_pmtu() caches a pmtu on every path of a
+		 * multipath route, don't let a Packet Too Big from one path
+		 * raise the pmtu another path already learned.
+		 */
+		if (pmtu && fnhe->fnhe_genid == genid && fnhe->fnhe_pmtu &&
+		    pmtu > fnhe->fnhe_pmtu &&
+		    time_before(jiffies, fnhe->fnhe_expires))
+			goto out_unlock;
 		if (fnhe->fnhe_genid != genid)
 			fnhe->fnhe_genid = genid;
 		if (gw)
-- 
2.56.0


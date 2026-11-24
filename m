Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.84.194
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534663;
	b=nmysj21qN4s48mT5+8bKOLQaSTZpVK9YAbbF/G4nKjI2P45f4+pT2n7BWKiUhrJHjqC7
	 TexcvdHectlUIReVLE3AUZvcY5Kqq8wv0DrSmV0kRO91QZ2+l81UTnz9hmSq7yHZGRe1q
	 VFWCM3KCXAyme1nIvxCTzXyjVl8wPM3/ESRv+wOPTjd+Ww8oNov5cI7AqlBKNOfNCtuf+
	 vQBXhwtOEw+JlQvFdEjGwHxMos04P8LCv9ZspD4BwfjiQ2Nv0wdBTycMTRQwUXzwt8ZQW
	 yFSmjWQn3G2R9jxULB/IYSo6hf949TVr2VImYurtjhi3nFZgfeizbmDqv8Nqxx3/6+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534663;
	h=DMARC-Filter:Received:X-ICL-RepId:Dkim-Signature:
	 mail-alias-created-date:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Info-Out:X-JNJ;
	bh=a4/TKQ+wKHrlBE/R2BQwO1pp5Mk2i+jmrSZqyGVPftI=;
	b=oMqPpz+0D71AFHawaTvcIHECdPEJs45aTMOzzNyAGcttE5krcvmU3CuGQ/LW4V8vNfXP
	 tZCJOL67ZgX3h5kAa7LzWbOiOTdDdRy97FjuXpiFESWB0Qja7oh06c3YE6kCtl/y/OcQ1
	 3dStPz7RN75i/BQwudYih0SZtN3jgzzBo0MUK79xWYE2eKCzB6w7M3d0L3arSCSpTCc9B
	 G7J6a/Z/ROvaeEQJIKdJ1jJcThaW5k87lvQMbSxcZw5AeZwiMMe8Tri73xP5+yu7Ox1vE
	 QS07K1pLa185niVf8dVm3Awa78XTM0lwtbSUvWLeRMmQ1hgPFcfcqksxvxj6e/KJT4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=verdict.gg;
	spf=pass smtp.mailfrom=verdict.gg;
	dkim=pass header.d=verdict.gg header.i=@verdict.gg header.a=rsa-sha256 header.s=sig1 header.b=NuMEq1tH;
	arc=none smtp.remote-ip=57.103.84.194
Received: from outbound.qs.icloud.com (qs-2007g-snip4-3.eps.apple.com [57.103.84.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E3A606A32D
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 15:37:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6E3A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=verdict.gg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=verdict.gg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=verdict.gg header.i=@verdict.gg header.a=rsa-sha256 header.s=sig1 header.b=NuMEq1tH
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-2d-60-percent-9 (Postfix) with ESMTPS id 1D245180029C;
	Tue, 24 Nov 2026 15:37:41 +0000 (UTC)
X-ICL-RepId: 01a20e34-a5e7-7768-926c-09d915193913
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verdict.gg; s=sig1; t=1795534661; x=1827070661; bh=a4/TKQ+wKHrlBE/R2BQwO1pp5Mk2i+jmrSZqyGVPftI=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=NuMEq1tHQtL2bFMonP/ptefWz59VB80MfCvlN1ik5Uw3c9sAuy27/EpJWFUgYjPsMTYyFgLAFwRBpvFnxqG5ChrJX/HLFkptxA3IRMni65qtvLPbmZJADMCFZ5TCRJMhF2i352+DjuqkJbuiir76xD94AaaqsU3D3Vq+TrqM2yByuWWB90BIPdORAW8hw/qps5rdYcS6JK4jO2apnpYYqPsZz4/6dMsfqSPIrX2YbomnVAhJSBNYetAcb+UwuYVTXzJuzzJ5oCUdenF2Hln1qFsnoVUlDkXbQbqZIJxeCIkPcbypCURHleNj1le5BECng83/l64o87wDGt5l8Iv2SQ==
mail-alias-created-date: 1621344842221
Received: from DelNac.mail.msk (unknown [17.57.155.37])
	by p00-icloudmta-asmtp-us-east-2d-60-percent-9 (Postfix) with ESMTPSA id 2210318002A7;
	Tue, 24 Nov 2026 15:37:39 +0000 (UTC)
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
	linux-kselftest@vger.kernel.org,
	Vladimir Vdovin <deliran@verdict.gg>
Subject: [PATCH net-next 1/2] ipv4: Don't cache a pmtu above the device mtu of a path
Date: Tue, 24 Nov 2026 18:37:29 +0300
Message-ID: <20261124153730.56549-2-deliran@verdict.gg>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261124153730.56549-1-deliran@verdict.gg>
References: <20261124153730.56549-1-deliran@verdict.gg>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2MSBTYWx0ZWRfX6bwSdr7J+Bsz
 OOHEog9q3oEMVQB80nAfbkFg/9jkFkVNVQUT6iza1uIQeN+8r9PX7OK9bcQrspSTw5KuD7v76FG
 T1mrrz5hsVl0qiVBKIt63jxiTHGqpnCPiZdr1byvlLj0r9+MzllqEnVFxJQDm2Qwg2YsKLliUet
 ZTwS2P9lEcafUTZx+KwRRm9fxlrtLipd6QRL1DQVgi8hau9BTQJWeeRd3eZw3CGmkigajSbsTzy
 B0NZsU4Sx1n3GwCUCScRxvIzwmRHekh96cy529467+/hHhYnltf7OCekibmrk4lVHn1PezVpzGc
 1QPV75RQIwz3cyUYCMJZbjzFZOS+xwHu/70FXa77zGEXMuMKnlxMfI4DO80szg=
X-Proofpoint-GUID: Ss7ZWyaXy2Gg7w-tLdGV8P_0Nu8TGoxK
X-Proofpoint-ORIG-GUID: Ss7ZWyaXy2Gg7w-tLdGV8P_0Nu8TGoxK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2MSBTYWx0ZWRfXzUtRMhFdQcLz
 FKGBtJ7lAQ9m0rKl89LryayFObVQupLR7i2ar5tR/03Ko3TtH6ty1O2pYbqyxkOedFOVOT1LCwi
 /BwelpDe98j0123b1PqAPNefqCpFjx8=
X-Authority-Info-Out: v=2.4 cv=XZAcX455 c=1 sm=1 tr=0 ts=6b05af45
 cx=c_apl:c_pps:t_out a=bsP7O+dXZ5uKcj+dsLqiMw==:117
 a=bsP7O+dXZ5uKcj+dsLqiMw==:17 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=wbbCu9YnSpm8ZdSLOl1R:22 a=_mclknXjrhVi08tC7Eh6:22 a=Ikd4Dj_1AAAA:8
 a=nEgrKjKUNF7mAgnr5RMA:9
X-JNJ: AAAAAAABTQRjrQ40IhbTpkO4CXHNIgwj9RwaoKJMn7w7dn8l9Kc0Wc5xhumSxLVSdXSABa
 6VaRf9BHfaTVmF3Oxo5SyxCRYUU8qrVgMu8PqhANLSn3zk8EVqv7SyrHo3t3hN6WkfpaZX
 RdDOCwx7nVaL502DwF0BsZjYp/+M7t9E/0QD1Iuu7Ev6vI6qGsPd+HYCsd5s7FNsAqd9AO
 diwVO0ZjrYXNoCXSl7ibVmoBPIuapTgNVcYSt3dYarHwKGBFLbTkT6Ax2mCtwvnLbl0ng2
 rzn2NHlMibaPV0ROXg04jrffDk2QH6QeldGRJgK9+U4nImGmA26az58MNwOJF1RO22mW/Q
 UE0bc0iFTh+6inYLhueKVhsQ740+HjCNnVD+OS1EzrCKjk2pRosuqAreXPZhWxCKdFESUL
 GwhPGqQH1Eo7n6j5pABKsJqIpNbGjtc1nOQ3obtxU3RmIe3MUR1S0bpIwK2DQpNBjXakbQ
 IddQ6IzGkTkAyH7i2ph+B8huuzBYH/D1EsPa2hHGnOPFBDwoy+vx8zrvE2alWpPlp0nW3W
 why5q5/1nA8K0Q0W8ANQW29VSiXKzu10fZxH+CrCCZM4r+YN5bJBa0ocAurE+ypQ1lI/BT
 2YMMO1FlIn83JVKzCaxSZG2C5EybFrM/A0o26731Hvc6HZY2SiGXKIQD2GNIHm9PSy3n+7
 B9EkFZ1w5INJBhdv5pUJvpDPRPcWMvQV3C85uuaDiPXwCo1+J1c2pwxLRUYQtRrWZCRMLh
 EdAHGxiNbxcblRGdgsEvKTvopxK2MxLCQQW7yx9nAf9OcPSVJq/ZOYTPS6P6Tomt6Iv+gX
 tK44SVwDTrWvE6RB2tMj25xjkwEFyZAOMw==

The mtu of a Fragmentation Needed is cached on every path of a multipath
route, checked against the path the lookup picked only. A path whose
device mtu is below it gets a pmtu it can't carry: packets above the
device mtu pass the pmtu check and are dropped at the device, no ICMP
comes back, and the flows on that path blackhole until the exception
expires.

Skip such a path.

Suggested-by: Ido Schimmel <idosch@nvidia.com>
Signed-off-by: Vladimir Vdovin <deliran@verdict.gg>
---
 net/ipv4/route.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/ipv4/route.c b/net/ipv4/route.c
index d0930ae4c5ae..0d992dc46c60 100644
--- a/net/ipv4/route.c
+++ b/net/ipv4/route.c
@@ -1094,6 +1094,8 @@ static void __ip_rt_update_pmtu(struct rtable *rt, struct flowi4 *fl4, u32 mtu)
 				nhc = fib_info_nhc(res.fi, nhsel);
 				if (!nhc)
 					break;
+				if (mtu > READ_ONCE(nhc->nhc_dev->mtu))
+					continue;
 				update_or_create_fnhe(nhc, fl4->daddr, 0, mtu, lock,
 						      jiffies + net->ipv4.ip_rt_mtu_expires);
 			}
-- 
2.56.0


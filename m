Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.68.141
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304818;
	b=hmwsma2thqp+uU65IlT3GZn+8dLZr+VASlifbkDEGeCWEhMYHZ0yse55ezhG9c4rXfog
	 qdnzuk5shZQBF21+NiOXjcdLegRktndKAJPX92Xaqn6tXey3F0QoNAkkQI/AbejMuNV69
	 I5nvl/1fWzGILkzwwS+T8hwvCu+/mwfSIisp3rx+mBldqTnb6rPbip20G5X24lxHaZEGA
	 Z+DINL6e/5ArtbzWYRxWNkpP9snIP8bpC+ufOAHawiXy2iPxjIbavI4ZeN8VrkA0xPzi7
	 AQwy1BiM3Z+heJ7+IGe1atqwpc9XHnSzxeVpUpk2OobweqJx8rPSymCbrEDo/4xkKlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304818;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 mail-alias-created-date:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Info-Out:X-JNJ;
	bh=M/aCqaw2Mtg6jB8h6UgcQAAQmJapC49Yy87oXq4XTbI=;
	b=W63jXAe/XJxAjPy2/W6ZKR9lAmB7zufCQ4WzS2MXhw0BA5wElCiDKD9Ivi6QI3SbapPR
	 MftNJr1p478OafRX8glrL6z9vd46aEdoFKDIkskdhf4H5ogSoSLSQHa/uV4F27GItTmD2
	 +6Szw82pBg/6D4iBRvRyn476U1OC0ScDKnUc4F1E9tA+WJ6zWH25WHiTqRZ9OHSLYtDKO
	 YWOdSEuKNTYuWPiXpJlvmmPxWmWcbdkgzjH7z5pzVGQe2i0BfhQS9okARzwnaxL8QV9Ur
	 BF0UigXB2Rxxky3AlomHBCmxWpDipJyW/7NFGK053rNxeSdBM9xaBQxHrjxSngJeyng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=verdict.gg;
	spf=pass smtp.mailfrom=verdict.gg;
	dkim=pass header.d=verdict.gg header.i=@verdict.gg header.a=rsa-sha256 header.s=sig1 header.b=n8pTp6Dg;
	arc=none smtp.remote-ip=57.103.68.141
Received: from outbound.mr.icloud.com (mr-2002h-snip4-11.eps.apple.com [57.103.68.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DDD606A334
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 10:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87DDD606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=verdict.gg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=verdict.gg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=verdict.gg header.i=@verdict.gg header.a=rsa-sha256 header.s=sig1 header.b=n8pTp6Dg
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-20-percent-1 (Postfix) with ESMTPS id E4F8518000BD;
	Tue, 10 Nov 2026 10:00:14 +0000 (UTC)
X-ICL-RepId: 01a1c4e6-ae8b-789c-9003-68e4323ba94d
X-ICL-Out-Info: HUtFAUMEWwJACUgATUQeDx5WFlZNRAJCTQ1OHVwORQFEF0oBTVIPDxRcFFofVgVyBlwKVwRUHxwXXlhVCQodVwJdEVAZGQxVUEsbDlwFS1oVVRcOAkIfUB9MFldDWhkcGVoUXBhTRVEfVFhDGUVWaUELTx1dGVscQmRYVwkKHVcCXRFQGRkMVVBUEVdQC1kCQg9JAlwHWwtFAEgAQw9fCkEKVQJAUw5eGUsZXS1BDkAUUBtHQ1AMDFBNAUMICghHA00XXjJTBF8RUBY=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verdict.gg; s=sig1; t=1794304815; x=1825840815; bh=M/aCqaw2Mtg6jB8h6UgcQAAQmJapC49Yy87oXq4XTbI=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=n8pTp6DgV7oIeUMPbJnpjTT0UOxj+xrNbZMFaLKQMoDx3mpGrpoZz1PakBrSDNcCvAF72ISbLqb+Q3XK3Y/y721m2SUJOhGoE7wmZAdhyfBV9MvNGBtQ0bw4qbw60xSi3+dQsyt0zla6CQy29LlnZcMs22t1ygBcMLiAV5wQhLPSaSBnHdeDFK3DAkWi6Yip/Ea3R6PkyHVlyiI72RHt2g8XTpTOiflhK5ogyhpiQ2J6j5XeoHdO2WVXuY/j5Od/PEfp69qECUy3L5b/Vg6ezk5JIjnI/+FhgWqYr6VdZwc0OuuA0jLhUJuhT1VfOG36zJiG1Lim+zH7hny69vhxUg==
mail-alias-created-date: 1621344842221
Received: from DelNac.mail.msk (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-20-percent-1 (Postfix) with ESMTPSA id 059C2180081E;
	Tue, 10 Nov 2026 10:00:11 +0000 (UTC)
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
Subject: [PATCH net-next v2 0/3] ipv4/ipv6: Cache pmtu on all paths of a multipath route
Date: Tue, 10 Nov 2026 12:59:00 +0300
Message-ID: <20261110095903.84813-1-deliran@verdict.gg>
X-Mailer: git-send-email 2.56.0
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
X-Proofpoint-GUID: YphijBkptA6mu8thNbD3KH-FA5vzny00
X-Proofpoint-ORIG-GUID: YphijBkptA6mu8thNbD3KH-FA5vzny00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfX6/4NysvmG//1
 O05+8IDpT5NMilmJnCSb+cBhEtESf34KeBReWOeCw9IVaT1MsScTFcOduhgHRk28WGNSNj0GiI5
 fQi48dyd5AEVfl6pP2TMlcWOyUqRXdt4mOI0fV/NAfzypvh9i7gvr0l2Yc6hkcFHyzFFokNv+mG
 qR1UpNoL4HAkEtUGJYimk1YP03Xq0u0NqGwEVCIb3+wBHeTcgaUJqmCrwKoFcMo+eeKs2j8Oejd
 3Mv0Zq5aEszk8A2vIEo84abkHzr0D6zMrtZsAzi2lfNlNcQfeDvQM4euIwaTfk0prwSAic6p2zz
 zDU6c7en1oP42gotFPE33H8ppoaIvE3Eo+aSDSNj/0mmTKmZWpjIW4Brp1pbnE=
X-Authority-Info-Out: v=2.4 cv=Ft8IPmrq c=1 sm=1 tr=0 ts=6af2eb2f
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=o5sbuWzAerGd3oVQC_MA:9
X-JNJ: AAAAAAABz5X8B44X4clrnTTzrSdSW6tMT63kzU4ZOFBrxCS6fFETCkE7oHSn5Hmsk27N/K
 UoLi6jUaZHCeUNL/rHaLzX6sHtfZmCEgD/zE3O3tbu2uQwPBXEMCYlYvnzoRhYEO2R47Ii
 qeEpGSEBbuX4IOk8l5penKA+n/twXwPvPAkdW+8t+OlNCOUykvxsKuhupPCYzEsev04+Hm
 xQM17Ie+ShfWpo3AF7CokGufJRSWSl3rh3EL/ipCbv5YvewI/+BmIxE+PzswkvgEzRBFYa
 UFeLir1TXzTb8Y3vjRrU9s+627FaPy1/pFw5jDSPVMZbkhkvgqA4C5nzNyK7klF6XfScuj
 n9WGlOjSNk8HEmTrBKdEuz5QPIL0P3NXilpqMnn+hoPiC3PuarL5DnIlU9993h1RX8pINR
 PTXd4Pf7wdJjrK3gzKaF4InMJqIoBsjrk5MWRQTTzaN1MPTycgifNFEybe42eUeEoROb7Y
 nI9zDQcxvh0uW8QKX5LR+3dPQ1ryllen+7BuTMGcmDkPPh8jzFgG7P4GsY+OmeIMflDEZ7
 mkZIyW7G2vOckJubsvI8McPw8xaiYtXzw1LBpuCRr8phSpIXpWk23fTv0oaqOxtlp6l85b
 Le8xibJSnp4ChiFiw1ojvyu/HXsX2FANFJPcpY7GchtKwR0sBPkiDdtirqCNsJQVpYDxtx
 DUjb/f8M3mJx75gCVtJevzcpxRHAUK/1rzsriiI9NObQytl6BO8YfVUN1ym5osYV9Bd/fz
 rdnF8muzSSiYV2rScozTPYz9BWSn/Zynf7NFSoBjx2LD5awji0jC397M/bnIgC6Sn04K5K
 ALK7ti1Ni50vFi2LDxA/Rw2JemmAlC0vusRGU1UFBtvcrOtof2+sKo+y/ISxJMjhdHr2Gn
 SG9qrEZNGO3Nn1YNAnZN74yeLYD5QPgrRqgDZ6xV4v3mjKMou+F1i9EeC1F09mqlPbZqq5
 ta21cKvO2jz7Z1/vWJL4kvuSrfHThdzollPUWSHhtT4uYquxNKLj/rVnz/NyrHfTJxFzzd
 YTGsIC1zu0hSp4spXuk+91JFDkxfkTBEoG8YhjZCnxzdP2lbX8SWL0KM0JMfO9IY+rzFhE
 eV1ALNxJdFTPTYBqq4jyb19DpaPWi9AGcO6yj9+E929Id5sPW8kjJN3N0d5uowZYEoy4dt
 oquNhZmU8xECPvpq4JR9FJN1ctDqmivt4dOhVMCqO4vPoXjrKe2t1oA3G3pNsVF/Em9yzG
 owKddZOPqKHyiQ7adAzEfE0UB4EAEpz70EEsjd1jjyzCaO3yDFC+lef6tvglPJ2JA8+4Gb
 h+MhVZQzKLREYsIYakh3FjsvZODnJ5geBicxMsDW+gxZ2I7w==

IPv6 counterpart of commit 7d3f3b4367f3 ("net: ipv4: Cache pmtu for
all packet paths if multipath enabled"), deferred back then:
https://lore.kernel.org/netdev/ad29493c-9e48-4a94-b327-e47af3a9d137@kernel.org/

Patch 1 keeps the IPv4 fan-out from raising a pmtu a path already has,
patch 2 creates or updates the PMTU exception on every path of an IPv6
multipath route, patch 3 adds the IPv6 variant of the pmtu.sh multipath
test and multipath tests with paths of different MTU for both families.
The IPv6 tests fail without patch 2.

Changes in v2, after the Sashiko review of v1:
- Update the PMTU exception a path already has instead of replacing
  it, so a lower pmtu or a gateway learned from a redirect on another
  path is kept. The pmtu is now propagated to the other paths on every
  Packet Too Big, not only on the first one, when the looked up dst is
  still a plain route and not a cached exception yet.
- Don't walk the siblings of a fib6_info that is no longer in the
  tree: after NLM_F_REPLACE the old route and its siblings are freed
  with the sibling list still linked.
- Describe the real mechanism in the commit message: ip6_update_pmtu()
  looks the destination up without the protocol and ports of the
  offending packet, so the multipath hash may pick another path than
  the one that packet took.
- New patch 1: the same "a cached pmtu never goes up" rule for the IPv4
  fan-out in update_or_create_fnhe().
- Add selftests with a different MTU behind each router, so a second,
  lower Packet Too Big is covered as well.
- Rebased on net-next.
v1: https://lore.kernel.org/netdev/20261017210508.71849-1-deliran@verdict.gg/

Vladimir Vdovin (3):
  ipv4: Don't raise a cached pmtu from another path's Packet Too Big
  ipv6: Cache pmtu for all paths of a multipath route
  selftests: net: pmtu: Add IPv6 and asymmetric multipath tests

 net/ipv4/route.c                    |   8 +
 net/ipv6/route.c                    | 124 ++++++++-----
 tools/testing/selftests/net/pmtu.sh | 276 ++++++++++++++++++++++++----
 3 files changed, 328 insertions(+), 80 deletions(-)


base-commit: d26955e57475434b59d43ba372b2a50d33d5e0ed
-- 
2.56.0


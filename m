Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.86.235
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943914;
	b=2c2k2nbRO5J8iGlcJ64+z+8F4OWm2/m5GbrfR49I+JPUIjfL5Q5CbKJ4ijK56XkKQFy9
	 5rttQKM4xd5QZtq+dUkrPbK9rQquV/oXwiS/a/22IzI3IouLDNly4H4Hqva3O7tLJei9V
	 6Psl7PveOEZYO7+XChlYug3G9bS3REJKeumKyGcKDiATsVR5pGclhrl/cLXDVUxV5Ln21
	 SMUVbwytV2u14fMpOUQ++Q87klcxR+ljG1pAoAMyLMjSYeFbTnfHAnSdV0AZIYODyksnP
	 je4jxrnqbVg3FfshpGwsq/9TpcxE3htz8EjlzGMJcFUjGOgS2edvLi26n5IwsLsn3gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943914;
	h=DMARC-Filter:Received:X-ICL-RepId:Dkim-Signature:
	 mail-alias-created-date:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Authority-Info-Out:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-JNJ;
	bh=tupyPMS6Ppn0golo5XSyKLtR6YNSo+CWY3qgLUPBzKE=;
	b=B22b3g+yeEq+gHn4JcTbY2FvwlwxVq9oUAJ+oeH6Uqk2g334GcW5ojkiCnTN52pI8qOW
	 2xE6L8REmw8WrZneo4fUuMdK1UF9HFu1fqBq/+7xmZHmCL/Aova7s7SHEzrTNKj9fGVeX
	 smqBYjOPzFMm+1B2P34jY1x6rpccVM/X5DJu8a1I2ujsW6awFcj4r1bwBsN33Ewr0ov0J
	 k/yXLPQL+Eur3hY+glxWHqluE+CEejT9q8ZGXTDROr30TjRCFTzxdfmmA6y6yUaIoHsyu
	 yJQBC78hGTxWCKkjWUIdJoZerEPyAy0cG4cGu3qBYwMgYmERnTYCst04gqv1SdAaLVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=verdict.gg;
	spf=pass smtp.mailfrom=verdict.gg;
	dkim=pass header.d=verdict.gg header.i=@verdict.gg header.a=rsa-sha256 header.s=sig1 header.b=Ih2ttrqP;
	arc=none smtp.remote-ip=57.103.86.235
Received: from outbound.qs.icloud.com (qs-2005k-snip4-4.eps.apple.com [57.103.86.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC58606A32F
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 19:31:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFC58606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=verdict.gg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=verdict.gg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=verdict.gg header.i=@verdict.gg header.a=rsa-sha256 header.s=sig1 header.b=Ih2ttrqP
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-2d-10-percent-2 (Postfix) with ESMTPS id 9641F3000142;
	Tue, 17 Nov 2026 19:31:50 +0000 (UTC)
X-ICL-RepId: 01a1eafe-8209-79a5-981c-e4fdfb0e56a6
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verdict.gg; s=sig1; t=1794943911; x=1826479911; bh=tupyPMS6Ppn0golo5XSyKLtR6YNSo+CWY3qgLUPBzKE=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=Ih2ttrqPnDmpiBxn+/eAIutck6i6j7u7rZqgPk9BKxQiQBVwiMavdAh2ecAnfXh4CBxa4xFNH+QIHapSdpPbmKWB3IOI7KJ1bNScKgXpRtLJL7iBM3GzGICy/1bHvdBycZIDlSS8I7njhLfZ5KnhvC63XIVMzWJ7hZkTXqR8z1o7f3pfTdwPO3ciYL3yjVfKHgVRNG0YFOp2dQHXwQnf7IyvW1w7Als9xrz1dqNEFCRqyatznmEKIpsi3/EFH0m5PAnlA2I+2rCuw0jFlERl7oN5VWKGUKglCCqHJHq7zLyAoCMLXpVgbXJOUIaizL7kcXuwwpwOAPz6UzJqpniV8w==
mail-alias-created-date: 1621344842221
Received: from DelNac.mail.msk (unknown [17.57.155.37])
	by p00-icloudmta-asmtp-us-east-2d-10-percent-2 (Postfix) with ESMTPSA id 1DBAF300019B;
	Tue, 17 Nov 2026 19:31:47 +0000 (UTC)
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
Subject: [PATCH net-next v4 0/3] ipv4/ipv6: Cache pmtu on all paths of a multipath route
Date: Tue, 17 Nov 2026 22:31:38 +0300
Message-ID: <20261117193141.27004-1-deliran@verdict.gg>
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
X-Authority-Info-Out: v=2.4 cv=YOsKWhGx c=1 sm=1 tr=0 ts=6afcaba7
 cx=c_apl:c_pps:t_out a=bsP7O+dXZ5uKcj+dsLqiMw==:117
 a=bsP7O+dXZ5uKcj+dsLqiMw==:17 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=HxOO8S7qDNDRVQTpMkN7:22 a=6uOZW5gG_GFTgJ11RZm6:22 a=VwQbUJbxAAAA:8
 a=bKHCur5yDY6pmIDHOTwA:9
X-Proofpoint-GUID: bFUYGdxpfn2VICFhM3OglcjlmOYcU8Dd
X-Proofpoint-ORIG-GUID: bFUYGdxpfn2VICFhM3OglcjlmOYcU8Dd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA3NyBTYWx0ZWRfX9GsAPuHikMFn
 YPexFgrmmH6KHO3Hi7cWq8G760J1OV0kmNfApr3/qGU5Io9Z+mGTNw+RL33ifkbCu1v6T5MvTnq
 Ivh3G6xbZfe/tRgXBYMxPRw3vtWQ8v0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA3NyBTYWx0ZWRfX5Cx0vPZc+YHN
 /d1cO1Cw/O+hOxdJJU9zKFrDjD8mLxrQ50kq1VWRp6Qj0UkdEL1rIS58fNjIaQfoQjr7iVxs68W
 n6gHJTf/UQn5Kj9GWGM/BcFaAjOKQG059AdxpuwksQzF1GAOw1gVxHBvvo1zZeBhAUWEGu7E8Pw
 OpHYN59tqr4cOzbS2GvGFKstSQ2vGQfW4HhNZ+qNEd6tDw9OHMHmQoI6COo1so+drYVCvHjFUsw
 BcEXnBLgsrW7SEQQy7yDFDcAZBrmofL2/4CMbcs54+OUGeJ7/HnfOqbA7rALkpGuZQOfL1XDLX2
 6NGMayTbZUwIdI7IRJscbfBOVPhifYagW0Le0Qi93qZe87sWRfdW9v6euUlBDA=
X-JNJ: AAAAAAABz/8voPgWdjHqiZOUkCs0T0TaIHLK2vUfivmCMGiu7Yp8/zK08BW1y0aOlLEl09
 xU/pjrCngwRrSnvQuUpQKJyCHbEKgEaf9+Pls9KSex9ijHM1K28H44wvgnLL74+Hmt5LCI
 RzaNZnd4RkGprGZMeA6JszYvLUfEdi5zsBYDM9Re83v6tHyHWivaVNmysKLUX7sOwX6vVl
 2QrMnDpcLiOsXV0+WtOun+K1U2DzhuihPrw5DRs5tKQ+dbVOoyjfGZVwP6YJDzjCEsXf+h
 3PnyRsJi+j0d4h6biD22Bh0swb8CgF/z0URxnNrVOcHKhA/GY3dU772FRb3YSFNvHXb6lb
 fBFaL9WIvcmQuTHSwOeku1P/ifIi5ismbfwH3y8cLwlntUJh37761iTQbV7OfKzisIM8JF
 +UcXQaq8tewdCyS/46AkhD1vkhjIs8o7pwaUEgs5geZWaqQjw0tc3Qp+56OgRxAnC8v6vJ
 OvoUb4JNYxZhLlz2wbQaZtegY2e6sQ8dIiSgBRX3sLYWn6LQLF32jbPjETY8PzLlLIaYDa
 0q98swTJKz3XjdTQo0p8TG4atLxVYfs8fvcr0zojCR38xqR0hnrgluGK9UUmvdj+kQJWLR
 FWTK2dkk9ZnBhR5+wJnWbZB03+qKWyNzCgmaKPSkotOnYM7cc7s0nyarMcv0oev9UKfQGh
 bGKKCGW8ScUkHF000NGUx2aZTKwTaAYEZjV8vbVOVC0G5wCT1sE+2fSwE9oNRxXRxoYaj2
 d4XBapdpJoehO+2zOU+wSYa7UTpv66zeb6ExTJsmmHC/Dljt5efLE7zfMQKFFKNQFtPMIc
 mRRF+wgBqKBYytD/O0hzxtfCVzv8yRgVfDd8q3PTyVsD2SKl20d48x5Ou8DaberbCNb1tz
 vQNrYuwNPptfaorqxDUcWBdL+l7zq/eUVLHqtqcPijw35gHZTSsWQiSreoD7bklybG35zp
 W1vbR2XCQXGqUEcQiR3B1aXUX0emp9Ly4uCJCz355A9CmzEXnDQ0AfHKQyMvCm7Mp0WSPV
 /KY2MM0bVHhH/QcVSbQyL2PFIBgIIMD3amPvAl10ZFRLVDWsEYsqFSvlUg1hZVcKH+hJu5
 +bb55TdoQSOoSf9rQFC0dzpOZF+EAnnF2e5V7gPDCMzuYqv4+aFg4fU28ZZ2vNY6eCSwhN
 Y1vmAIxpLX77VQoWN8Er7iXU3rwDqu0gEd2S7KAkcJoUVz7nuw1p8Jyb2hxth/0wcHevwL
 v+s+pY5y4fEF1M+q0w3QsBd/JiZ8mRW/xCjValhf2bm2AbzY9dZFDlErBuI44Tndwa+aCg
 8qeWnKR9M2r6Bdf5/pyFO1qH/LEqK2

IPv6 counterpart of commit 7d3f3b4367f3 ("net: ipv4: Cache pmtu for
all packet paths if multipath enabled"), deferred back then [1].

Patch 1 checks the mtu of a Fragmentation Needed against each path of
the IPv4 fan-out, not against the looked-up one, patch 2 does the IPv6
side, patch 3 adds the tests:
the IPv6 variant of the pmtu.sh multipath test and, for both families,
a multipath test with paths of different MTU. The IPv4 asymmetric
test fails without patch 1, the IPv6 tests without patch 2.

v4, after the Sashiko review of v3:
- ipv4: each path checks the mtu for itself, the early returns on the
  dst are skipped when it was looked up for the Fragmentation Needed;
  a locked mtu goes no higher than what a path uses, a path with a
  locked pmtu is left alone
- ipv6: walk the paths only from ip6_update_pmtu(), where dst comes
  from a lookup; sockets and tunnels update their own dst as before,
  a tunnel mtu no longer lands on the other paths of the inner route
- ipv6: skip a blackhole nexthop and siblings not in the tree
- tests: ping with ICMP sockets, a raw socket handles a Packet Too Big
  a second time and could pass the IPv6 tests without the fix
- tests: the IPv6 addresses on lo are added with nodad, the pings
  through R2 are 1280 bytes to stay below the 1350 link
v3: https://lore.kernel.org/netdev/20261113122237.88990-1-deliran@verdict.gg/

v3, after the Sashiko review of v2:
- compare the mtu with what each path uses now, not once with the
  looked-up dst, so no path gets a pmtu above what it can carry
- ipv6: keep updating a cached dst itself, the walk may not find it
- ipv4: Fixes: tag, Fragmentation Needed wording
- tests: MTU 1350 on the link to R2, so a Packet Too Big from R1 must
  not be cached on the path via R2
- tests: return routes on R1 and R2, hex flow labels, skip when
  "ip route get" has no flowlabel
v2: https://lore.kernel.org/netdev/20261110095903.84813-1-deliran@verdict.gg/

v2, after the Sashiko review of v1:
- update an existing exception in place, on every Packet Too Big
- don't walk the siblings of a fib6_info no longer in the tree
- commit message: the lookup in ip6_update_pmtu() hashes without
  protocol and ports
- new ipv4 patch, tests with paths of different MTU
v1: https://lore.kernel.org/netdev/20261017210508.71849-1-deliran@verdict.gg/

[1] https://lore.kernel.org/netdev/ad29493c-9e48-4a94-b327-e47af3a9d137@kernel.org/

Vladimir Vdovin (3):
  ipv4: Check a Fragmentation Needed against each path of a multipath
    route
  ipv6: Cache pmtu for all paths of a multipath route
  selftests: net: pmtu: Add IPv6 and asymmetric multipath tests

 net/ipv4/route.c                    |  90 ++++++---
 net/ipv6/route.c                    | 138 +++++++++----
 tools/testing/selftests/net/pmtu.sh | 290 ++++++++++++++++++++++++----
 3 files changed, 418 insertions(+), 100 deletions(-)


base-commit: d26955e57475434b59d43ba372b2a50d33d5e0ed
-- 
2.56.0


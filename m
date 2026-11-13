Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.71.109
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572569;
	b=xkFyRqZxOXnS6PJsYHYJ/P7QaDhCFAGkFzXmeSiVtmH3S5MnL4Y8zHD3Bzh8bWCEl3Wn
	 rIYOusdB5P6qAe985ozhokgcPBUiysgF2PH5ILGQMHZtTLgSv5wYVuSnGIFBt2CI5sepO
	 2VykOiMxYkhYGzyjn09EvblEkPPbi4yfVcGxfBa3QNBJJIWAaGOvZxBL/iu0DwRDaJWdQ
	 dbAiPnzlvaWxvLREAnbhwrL+M0ZbtPGPd6RLvZKunMM715atYlKfrmmLwFBO6dsgKkk4H
	 zoGnC+TyXuJNyAuALmOYKdy0Zzd4kiZvNNZOF8VzFM4Aa2pcnwjqBDN5SiNmDmONHTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572569;
	h=DMARC-Filter:Received:X-ICL-RepId:Dkim-Signature:
	 mail-alias-created-date:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Info-Out:X-JNJ;
	bh=bt0dRZvel7uCGiKOrOk3gqB3xIVVwQuehuV0zR22300=;
	b=evYRl4TbT+CX4dXroW8hmY+npE5B3ApCwnaUxfbjX2EshyUY5DG2VgcKsN8LPA1p+Fiu
	 xwgR2EJzFBbU+tTDfXbfG/9hWF2IclyQFqOxh2h6eYFYfAIfBdbFi1gXoCuir+VlSGdkf
	 5THWIaZmM8vE3kLPXnnVr/YSX4GncM2QZPlAOoTATnS25rVOit5pxuzQi1jYMcMPXZ5pR
	 niBFZzrAVaL8tfl6hKRYKkDY0NNeJAHSPgjkCKSVV+FCcwOP/rnGiac3+BkmlJFg+WP/t
	 tsdTYccBjwQ77mJnf5JcSb5hnY0G3Z9ehcxca6MMz+LqaPCoWF9x4w5YDrY3XAFwssQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=verdict.gg;
	spf=pass smtp.mailfrom=verdict.gg;
	dkim=pass header.d=verdict.gg header.i=@verdict.gg header.a=rsa-sha256 header.s=sig1 header.b=KbIVuJvT;
	arc=none smtp.remote-ip=57.103.71.109
Received: from outbound.mr.icloud.com (mr-2005a-snip4-6.eps.apple.com [57.103.71.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BCE60A260D
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 12:22:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06BCE60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=verdict.gg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=verdict.gg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=verdict.gg header.i=@verdict.gg header.a=rsa-sha256 header.s=sig1 header.b=KbIVuJvT
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-6 (Postfix) with ESMTPS id CF70118002ED;
	Fri, 13 Nov 2026 12:22:46 +0000 (UTC)
X-ICL-RepId: 01a1d4dc-4083-7683-8f3f-5ecbb7eb1538
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verdict.gg; s=sig1; t=1794572567; x=1826108567; bh=bt0dRZvel7uCGiKOrOk3gqB3xIVVwQuehuV0zR22300=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=KbIVuJvTWDzRrxv0TtF0zTvRlD329H308juooyl97wmdj7dzJSMyC+0D6aJD+X+f4XgKlOnMml5ps9CFnC7crUFdXCDB1LESGaTWOHaz3gGzW4bCECbEv/E48cqPTX78zD0bfcww9kcURdytXUl/8SptFzauDjt//7WvhDgrzQ+lHkOdS09mnd6XYRtgf+TtzliW5G7rFb3HybVrxQMgNObKQJWdakuTtHjRVYke9wmfOY4fDHjPeWTx2DEoA8ZrDlrpplIsRphxOvCbZkWxM4o06Z2dXM6YcQ2dSsqF1LrvdXoLrY+PYvMv3fVhAlKWdlsqrFf5xqNHwSNmz9a0Cg==
mail-alias-created-date: 1621344842221
Received: from DelNac.mail.msk (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-6 (Postfix) with ESMTPSA id D54831800280;
	Fri, 13 Nov 2026 12:22:43 +0000 (UTC)
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
Subject: [PATCH net-next v3 0/3] ipv4/ipv6: Cache pmtu on all paths of a multipath route
Date: Fri, 13 Nov 2026 15:22:34 +0300
Message-ID: <20261113122237.88990-1-deliran@verdict.gg>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0OSBTYWx0ZWRfX8HtkCB4+aRuh
 N1DFs7tkNlP9aUpqhJDn+FI6BAGNxHQuUKMgcvyKtLV8nGNWQ3jHLaY23fBaUPQ/c+T1BaBatP+
 Ln4wRMHOKiLoAU+l9fDsL1XsF/KVCt8=
X-Proofpoint-ORIG-GUID: cxBUL5emJaNB3-UsmY_rWg0nb10Jc8rY
X-Proofpoint-GUID: cxBUL5emJaNB3-UsmY_rWg0nb10Jc8rY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0OSBTYWx0ZWRfX1uF6+ceSGwNr
 PqnvXq3xjoSlDoWkP65kcuaphH55fWsCE6FvLJB6rw5g+ZYgdT9XAG2lZ7j0shBJAgEpk7SELV0
 g32/oTGa3HHJTmYC1FIHE/7UwVfzhovFEeswkgXbrPoPUk5hooeoc6W4P+g0em1y0sYt+s7tBZy
 W8a5TxlQB1TJPdHQgHd8vmvRkHiowhHDN9DUa5MeDEfBeSf4jKrrcdUi6x9wno59b7iyR9sErlo
 evQHd+27F0jnS8Y9/c/NIC1Mc2hRytMFG+G5/laVM5akLFJNZ/GZm3RPfYH/z1/IlLm21jmFF+K
 iMqjeExK8U7HxcQJQwA4wK36theTWNMI+DYpt2ElFxY5XNeXgk9dC2jWiBFaeY=
X-Authority-Info-Out: v=2.4 cv=O4SsLx9W c=1 sm=1 tr=0 ts=6af70117
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EYaFdmsEC1CjpenOt5ir:22 a=DQNyVv6Damu5ko3fWwIu:22 a=VwQbUJbxAAAA:8
 a=wNayiuiad2-6BH9Lc6QA:9
X-JNJ: AAAAAAABUiyGmFaQ2crbvPe+YUnXcpLFfEWtht9UkfyB6jKmN5seQXU9g68TQbpusbU/M7
 NEvUn8O9ilnMy0X5QGgjDSsv8e3DfnNuJac0WSM4Ju0nzMzueKMNFqW2MiqUzZdWlung9g
 Zx7lcRnmCcHy7paADvEVinn9mOsDZqHrhKxRDigQ7TRZzZFlteRaA1HoNNEeNKzRccw2WR
 kirRGp6MpabQRKFLBBhZOrIvOdnGDkK9Mb59qFYsbhIsCh2qnZuqp/9x4KM2UE8U2J8eSM
 ZRJDAoWnV+AKuHeOkLOEq1jLBGos2LJyOt6Gp4sYBb+4k4bixqVEnXo5nf8yb1xMm3NzLi
 6b0f3t/16PLLzjNEarZ/WPVUhaQihlXDJkzCydubKJGzP6m7YTbASulc09bGyVT5kB5sce
 JSoDSU/q7p4hh6fy++yHYDZFhFBvEfhObhBckw1kPwmMTAXKguLnHrTLXPz8cIYleKRisO
 hvosL48LYuFk/ehZ7aVofuAj7DiRaJuhUkT8fDbUsMzgeOTaoJdXL3fSPQRyL3gigEX893
 JuENFFnP9RF+w4WimxyWEwnRtzM6RNe10QgNpU4GU+0jSYUAhMYq168YwV/A5PgIVaaCII
 3fJleSdcU97mdRY6/kH3WWd8GXQr+Cxqn1Ydq+dieWvwKrf95L7VfPPuoMUyWm6wmD1XqB
 hFzxgAxZgHVTFJFXFsG39PEK2m1QRQIpYedrqP/OV9eWdvgvG0lAYn2TgWnsHHKKVrr2ZM
 6WGUzVryDMlkC3iNjyCQP6FDBzIU5CI7wY/fhZBm+yDjhmodIcQw6OJ/9WIqzUVpLKR/fV
 LenBj7ioJnpWoh+5JlVOQKdeUnrGDQzVCyacahgBJI3glugvHeKKS51CzxW7hlJxZkmmVg
 GFwskfEQ63yk7M5vIZ1d2hqeRqoDsoYAAeYckuBZu+UVglNlrmfQizK3tiNnZLFfsupHz+
 nOhZpYqcH+Oy3H3H2pmooZVcjQAJcicALkqNe2qFidqwarVMxZl1sqsDlHrTuWkRJWpdGw
 0OmtwYJM7imUQ/S2gxywIytP0k41NIlqbTxGPnikdedZUamMcN7HCdeUHzFrn+bL2qRnwc
 Y9GXL/VKYxbnIswmy/eChOXnIGTjzm+FFxo6txOrEydU57vazgZVA6zoQucDkqsXD91JuH
 V5fHityM3NV6MwfbwzeyqXhu+7iEpzEZa4QUaZkxJ82tUpTRMKxwzZiuVW9ItvAWM5aJ3B
 Xsdxr2uHiC8i4iGFtfOnrtJhQufZquSc2bhkFHFK+K4G/5Y8cPIDZggvZbuHAM4ZrctmX+
 mwBCYTT5FAZ3nJ+JS8a0NE7cR478Km8JeXu7AzvldD

IPv6 counterpart of commit 7d3f3b4367f3 ("net: ipv4: Cache pmtu for
all packet paths if multipath enabled"), deferred back then [1].

Patch 1 keeps the IPv4 fan-out from raising the pmtu of a path above
what it can carry, patch 2 does the IPv6 side, patch 3 adds the tests:
the IPv6 variant of the pmtu.sh multipath test and, for both families,
a multipath test with paths of different MTU. The asymmetric tests
fail without patch 1, the IPv6 ones without patch 2.

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
  ipv4: Only lower the pmtu of the other paths of a multipath route
  ipv6: Cache pmtu for all paths of a multipath route
  selftests: net: pmtu: Add IPv6 and asymmetric multipath tests

 net/ipv4/route.c                    |  30 +++
 net/ipv6/route.c                    | 121 ++++++++----
 tools/testing/selftests/net/pmtu.sh | 281 ++++++++++++++++++++++++----
 3 files changed, 355 insertions(+), 77 deletions(-)


base-commit: d26955e57475434b59d43ba372b2a50d33d5e0ed
-- 
2.56.0


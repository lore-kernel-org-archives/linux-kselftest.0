Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.84.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534662;
	b=4Jj3EM1VP+nRFWTxU+lgBRqzxyV8593SgNLdxFMN0qFCETWPhPXIUqA++aeOiNi4Q3dv
	 1QQkw74ohVMb79gp+PE/RPOJzETFj+Zkd8KWJHxOboi/UeqfAcB9sPLLcsteGyzkoeOhu
	 RXyEwmF2MrmFmi9AC/NmHcdXXQ8RSOAo/tao9rUcwoB3KmaHE2ykEadAZhoGtm5NpdbJF
	 V+7Rp0UwqgvZE1oBdxGpg7zLhx5WL7f/AXtfiB7OdkByGNeOedSMWn2MkLJCyoeoUvMg5
	 oOOFBj6Z7P/+/o8mMUBwKtsM6v1pUF4NeE/HfsyG5Lu7uZMw4elbq9j77g73Af0YpIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534662;
	h=DMARC-Filter:Received:X-ICL-RepId:Dkim-Signature:
	 mail-alias-created-date:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Info-Out:X-Proofpoint-GUID:X-JNJ;
	bh=bhdf1v0wsj9CrCELMW0lI9u0r3QAMP4ACiMym1bga+s=;
	b=EZGUBQYV3RY1kbw/xAfhAp545k+UQwNmjLQFj5mglXe8CtuO7+OaAyKRcYMd4cMlFGmP
	 7qT+6m1cpO34OX/NV2uQFe2JPWLlRWemB9E+XEWV2Q+0GwTZQFJ0tw6zYT7FuqsWGsfV/
	 P39xfVhup9YoV5HIMfBhqzY0GmsyW4wMgAUKZguQFx+/TCx6eWXM9wdnkdPxKjTxfZ3Cv
	 cCRhdLkZerrP+DP6aU0KSGoaE5cXIV2GSnsIk2BVEX27v1Nl4M/NlB2MFUwl5flKa4QPQ
	 MfktVGfaXS7qstEYjokVFwf5Vd2N4QGmNcQPiANrufIna5UUmMnp6ecaVai++9p8mWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=verdict.gg;
	spf=pass smtp.mailfrom=verdict.gg;
	dkim=pass header.d=verdict.gg header.i=@verdict.gg header.a=rsa-sha256 header.s=sig1 header.b=d9dK6ZBC;
	arc=none smtp.remote-ip=57.103.84.161
Received: from outbound.qs.icloud.com (qs-2007c-snip4-11.eps.apple.com [57.103.84.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09451606A321
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 15:37:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09451606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=verdict.gg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=verdict.gg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=verdict.gg header.i=@verdict.gg header.a=rsa-sha256 header.s=sig1 header.b=d9dK6ZBC
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-2d-60-percent-9 (Postfix) with ESMTPS id 3C47018000AF;
	Tue, 24 Nov 2026 15:37:39 +0000 (UTC)
X-ICL-RepId: 01a20e34-9e0a-7265-99b5-b11fd6108611
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verdict.gg; s=sig1; t=1795534659; x=1827070659; bh=bhdf1v0wsj9CrCELMW0lI9u0r3QAMP4ACiMym1bga+s=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=d9dK6ZBCepl4FyWf92pEB9Ds0cGQ55ZJjidU9VQh4+bS7JiepsDiRLWNiPCaFo/j06bQSkZYB0O/xjujgbags78q784U8B/TGFiWfkoeeXvb194rAMJs0/0SC01F/6soxc5ARtNuJt8PwngMnaqSmjVwNRr2YKhy6erGgT5LXC16bUrsFSceflJAw+oKKezEszU7ae6y4PtRVE3LO62O09zEf01iOXAMYY2pDTeHBgljZPP+MW3xy3RDHV/trt/kn1XKabEP8xr7LqunjDNPQAFvo3fNWZQ2kLYMgutnSvL3JxyJGTB7cte6loqwGyX3cc7X8mELpjpbqCJUhG0MRQ==
mail-alias-created-date: 1621344842221
Received: from DelNac.mail.msk (unknown [17.57.155.37])
	by p00-icloudmta-asmtp-us-east-2d-60-percent-9 (Postfix) with ESMTPSA id 2F57818001B6;
	Tue, 24 Nov 2026 15:37:37 +0000 (UTC)
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
Subject: [PATCH net-next 0/2] ipv4: Don't cache a pmtu above the device mtu of a path
Date: Tue, 24 Nov 2026 18:37:28 +0300
Message-ID: <20261124153730.56549-1-deliran@verdict.gg>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2MSBTYWx0ZWRfX2vpYCWwzXMWS
 /Rp+7EzZKL0yghKTVLbdTmjB43nCyqAHUzFJ2cxu+0q5uSmZL3f0YP9INqAiCT2Oi7mnjFLtZdp
 P/R0frCuTZJBgSkpm0Vge29ssJih56CsJyLCtVQPURnRw3ci5+8ELkzp/3xXlRf24/aLbVFcDCa
 SJQVQGS4450CsCKCFeIVMZo0KOLWogt/9o4fUQ+nQUspmhamBDVxGRweH8dPpW3proD2dbeKRNj
 Y2GgL9ldWtAePtmsarFhmZ2S7xJw4ONBpbIWE4RSp5/0g6QVKLZgW4JHTDLZ95fjt+IZFrLwLuz
 BDJzHb1/rmx5yxRinfSKa55klTDsbzcgcaICyFo5ZY+3yFyl2hCJWnwNY2ucyM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2MSBTYWx0ZWRfXyIqq/SPVx9pK
 23IDZxMKUjZfExNYJKFVQRjbdKXi8g+07HGqcj9TeZlM/Fz5vt4tMaJdsuB9XixbLIZUZZvuGcL
 wrtZvYkMp6GJBf8yQSgagNdSpz8cuKQ=
X-Proofpoint-ORIG-GUID: r0cUl477dfX7Q1oQfRxqCpOnZL34K4pe
X-Authority-Info-Out: v=2.4 cv=GMidgeNK c=1 sm=1 tr=0 ts=6b05af43
 cx=c_apl:c_pps:t_out a=bsP7O+dXZ5uKcj+dsLqiMw==:117
 a=bsP7O+dXZ5uKcj+dsLqiMw==:17 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=wbbCu9YnSpm8ZdSLOl1R:22 a=-FrFFRAKu6jp7n_x08k1:22 a=VwQbUJbxAAAA:8
 a=Xk5isCVez12B1eOcoLAA:9
X-Proofpoint-GUID: r0cUl477dfX7Q1oQfRxqCpOnZL34K4pe
X-JNJ: AAAAAAABdV++j2it7lugkEsVkWEmktGwlpJtWqKnRTU4bP2aL3hcfLX+147rfKBByeeBjo
 +SXOik3ZymrmjBQqUikVv7iODmBvrMkHxWRQeR8vD46LrnJrxtnUlYg4+TzPbcqbj7HJ6X
 Wvt/z3bEdA1Df1EC9K1NhjgOuBqtqkPlQUMR0wUfQFRa5eKYPFVhYzJScVyuCwuk//n5nC
 tbhrhTTO0x98g74tn4MHJ0oAsCyXb/GULj2HLBNsfmarnNyTykA+iuZLZBrkY7PFFslg1O
 tyPdcDHM9wkwc7dpGQRU9yl76VdaCvKFp5HZobBgIN6NUIQskxkOet4dLs5TAH4JOkFW08
 ZCtImolhb3d8fJ5LDoKTf/uP6NPA9dgfJiCwxihjoK6Ck5nqCrfXflbSWU6b0jsDxMpXDN
 UCltkELOpCUCBRh7MlDD0bR4aQdrYjSVb+kPRVIjG0/C+YuTlZ5485V+mxZczTrl6FdK8g
 bJRqr28ACqHcXqyQ9itvPWK6iCaWxDBhaZtiTOqeXVrBqQUIRJgrdZsUpEwgz1lSUGltxg
 YZN8/uPTjYXXxkG72YXIyNoeIAatkXMKvskldxlr2s87t+hznIGNB8v1kLZG19016vtI0j
 RvJI4nMxJC69eVmjmMu5FtXQvlRb8s4jARUx2V5IGmlusv/QUtHszQvWJyP0CTKZJJ7Y0F
 mYiV5NshNExnjDWXXZx2+3fU0tz89XFEE0weA5DfOkxDB/zowhYO+Lt5jQtQAzoUSB7zNZ
 h2GDhLV7kDliNiAQMVztneua6jxcXOUJpOpA6kuOehc7VU5L06PvpMjGIW3rDnchzHCv1K
 aE+u4OPXpU5Y83u8CLPw7Td2X8xGkcV0augcsCazQ9tp45hQK5tdIhw+AM2STkJZXyKNdx
 ph7EbahqaG/s8ZtZ2pCJNU5t30IEqfPaRIwr9Ki2/q2EHMbD9WWZqQvNhYDtTOb4rrc+qe
 SZNl+DRBG3F1uWXtBFI2Ze/1l7XoMCakPUOiSNbiiQUbaXkqMzwNMFfKP3OBbq9ywy1eEP
 8npHeU9+AsfyGAJZewFvI/9UFzCYua6hRQbDmZHjBiwg06fu6o85/imZRyDLjPjsFrX+AU
 FzHXl15RHPPpKWuj69bdIAzoKzHmJF7WYc+/EAkaK5wWxPwEB08SSLlypO2KpinMHEfI+0
 6zf2SOAGbcvlYawRgGxBZog54GEKAnUTEs28pUPxVacsRrx1m/4ARHfqRMFhLKaycrbNwc
 czLOkuA6xm7OcPxK3hAF4kvSBb1EyM5TFg5bua2kgcHcxvz/tqMhe+3mLiAcnUH6xw==

The mtu of a Fragmentation Needed is cached on every path of a multipath
route, but checked against the looked-up path only. A path whose device
mtu is lower gets a pmtu above what it can carry, and its flows
blackhole until the exception expires. Patch 1 skips such a path, patch
2 adds a test for it.

Split out of [1] with Ido's suggestion; the IPv6 part follows once this
is in.

[1] https://lore.kernel.org/netdev/20261117193141.27004-1-deliran@verdict.gg/

Vladimir Vdovin (2):
  ipv4: Don't cache a pmtu above the device mtu of a path
  selftests: net: pmtu: Add a multipath test with paths of different MTU

 net/ipv4/route.c                    |  2 +
 tools/testing/selftests/net/pmtu.sh | 74 ++++++++++++++++++++++++++++-
 2 files changed, 75 insertions(+), 1 deletion(-)


base-commit: 2388bb763e323442f4dd8189238ac0c5f334c4a0
-- 
2.56.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793889242;
	b=KdhH5ESdjXjY/Fm3fHNBlmgV1lZ05+USzLqu54Wt1YX9xdpng862B/BeRZeB5dJ6fWCM
	 PDwnUCRE7C7EuXmV+7rktDpxLRam5u4tHDrVw8wAy+cYzTiMhi0dgRU27MuMORKIlKHuO
	 CsLH5RQ1wxJ047TwRcHGCVdr+IrE99bPvHNNeudtFfqPYaKLeRlYeeRV0KbZaE4qMttwe
	 pA4rLBeXzxIbs6XRIi6Jtb3KgKI+cdsZw4Hud6PgTb93Vq/Eu37Q+kRIzIPDWdziLdgJs
	 Rdf2U6KHTdmvA3IiG4r7bbkch3UnLjSniB9bIQm4T0IGH183sGmw1PcvaQkg+cTUYsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793889242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NdOrVzG3OCGSr60lMULw/RwF+DfcJzV9jGQLzrSIiVA=;
	b=s3xtsM9sPmrjDoC4gMrdEkv3FXILfa2jVcq1Qh3TNn9orxqkIQ6zZc1rUuAo/6vjSzUO
	 WdwphH9lHjCiSTmXcItOYVk3EprtNv0yEjjjvBWsGHY14UTskf8BDDl3LSxHfgdVZFKJ4
	 //R6KS3XyGJv9lQdhqZoM7cxFxZwFTFxnr/HO8DNtVP+0y9EeqBaQ2ZbrPBXHtTD185y5
	 m0JiAwEKpJCaWHEKJelChlkaYzYQt1+n5uUaeZVk0ystQK7KO125v/P1TRXnIp/W2QgC+
	 TBrX0W+8crstMc75+A00tdRpgLG/QHZZSGPD7PWfFsbF/QjR+LFk3x27lO99JMNeW6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=RcItvQZW;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D92A606A328
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 14:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D92A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=RcItvQZW
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c315869241fso298604266b.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 06:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1793889240; x=1794494040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NdOrVzG3OCGSr60lMULw/RwF+DfcJzV9jGQLzrSIiVA=;
        b=RcItvQZWLu6oodSC2bv8dHfWDL0GIt2qmvKNPvNvKMjaJXxgv9Eyc45gGdT2/H5qMq
         zJMGxlhwIroSZMhz6xRZojb0KdzZDU2epUyYSLcCd5+cR++B1GIvVW9p0ECeyzxaDkIK
         hgp1RiILJ/MVeoe5wK8flNWnrnDvqJCAxSrFXAkIJdAWXJF6iuGgXYpQl+xHbDP9Ph/h
         gukN0UgLTKmH8Axy2gPQvjp+G3thhc0hmclGfbgPV43mdB7r5td40U8/rH6stnGvfcqj
         FdXpbwBKja6bkyyZNo1WXNfPZWsTij547pcq81hOSlQR86GDs6/xrkgDKeK0J2rOJpsx
         FI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793889240; x=1794494040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NdOrVzG3OCGSr60lMULw/RwF+DfcJzV9jGQLzrSIiVA=;
        b=GoFj/B5rO2q0RLzI0/J1QBmDGRpxKdHf5O57jM9WeTfvfU1rVQw4Yq34xlgQ5jo9fd
         VHhFY+qOB0DblpPw9Bwgi/a1mhAVp4HVvSedI6M2qP2DoT4tg+JcvSRE27zAsd5EXlZi
         NlEfXULyA5kUCeU4guQbiXLR795PjBq1A6NveWLg6bW71GpNiateC3dhOIhWY+2Gyj7o
         Gujs/+lydc9hLV3Y/BgJHQUfnKyip9Xm28VT/s6PQmh8htlu2HLUPN+r1p/6YpSMTt86
         bEYJ0E9FYHhW0q00ZbuyPP8uWjoDXA9EcmF8tETCpYmzn3BxSdHBYaaHoPU9ITifkM7o
         ZXvg==
X-Forwarded-Encrypted: i=1; AKwUvBwmimIriBmFYgHJZezfq06bVta9FFlsUoxfn4n3YwXyNfrUR5tCnDNpRG1y7d87/ua67S+podu1hZndUsTcnnA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yhlE4dMJ2AS/rSvPVJSm7TAuzyyD0JKcMYn5ilHGOd0ev8E+R
	NofwmTkWzf0+kW5YxuDEmWpexKNPYteB/P4rqE3sWYpB6JKjuGmFqKk5Eo4EhKv6c6g=
X-Gm-Gg: AYBFou0f1pPvmvw0woGP7NU+0r6nZeQ8dUcgd/8/jnhHJKvbsGC6ycCmjlDRCt44Z/u
	xwLqUBB2fhNL27uR1UvbY9r5vdbcNjmfiKn5poxzIvqanmePjr3lKpeXtwqpsxGIxQSU2nax2zS
	zupLmajgDXUeVejQadAYXmbvD44vukrHQWJqFUGMMk6bp+DN2XZbz22JmxxVl24hbvzwrgoIv6O
	QdtJcB1naaM1JzfNiazVob/945y2xZQi86YPvbxsm3RV/fo9uG5CB/mDNSiiUxUDMr8GFaR7kPs
	N2MF1xZtBkC+oSo4lDW25fTFeGEGg7ejfVHE3Xj5LYDpVwcZkgLZZRDOrIjbwqZPV1+CkKWKLNH
	1mUtdZxHTP2uRVJdtc97mFEMdzDSoLopbmsWvV0fzrYj/XCRhCeRc/fJyKnstTYWe5+HqeIlsaU
	6znbKcqqqYOgzidsz0hoFj/i9V9V1sKw9sBZTN59W37FKkpH7rHhGUBR/ML7boIhdfPK1nRYSGT
	X6bMh/s6sAMdAHxdLVekF/JCyDhLpw1muyK4lduce5oEMij9iqbe7C5nyk2i1tjcMsuc7/4QjX/
	g9UgK4AHFV6wrkv/OdmepeIKUr5Bvua/QrJ85dsz0nTT5hpZnT146erUtviafepHcWii
X-Received: by 2002:a17:906:f59a:b0:c3f:7e8:235d with SMTP id a640c23a62f3a-c4ca792f92dmr1718115666b.5.1793889239960;
        Thu, 05 Nov 2026 06:33:59 -0800 (PST)
Received: from L9JK9NPFH9 ([2a09:bac6:37ad:1e5a::306:b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e466be0sm178671066b.54.2026.11.05.06.33.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 06:33:59 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	toke@redhat.com,
	lorenzo@kernel.org,
	horms@kernel.org,
	bpf@vger.kernel.org,
	shuah@kernel.org,
	hawk@kernel.org,
	kernel-team@cloudflare.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	linux-kselftest@vger.kernel.org,
	jiayuan.chen@linux.dev,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH net-next 0/3] veth: link RX queues to their NAPI instances
Date: Thu,  5 Nov 2026 14:33:53 +0000
Message-ID: <20261105143356.17062-1-tianyi@cloudflare.com>
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

veth does not link its RX queues to their NAPI instances. queue-get
therefore reports no napi-id for them. napi-get lists the NAPI instances
of a veth, and their thread PIDs when NAPI is threaded. It does not show
which RX queue each instance polls. Userspace cannot tell which NAPI
thread to pin for a given queue, or which NAPI to change with napi-set.

There is also no way to busy poll an AF_XDP socket bound to a veth
queue. xsk_bind() takes the socket's NAPI ID from the RX queue, and a
veth RX queue has none.

Patch 1 is a cleanup to ease review of patch 2. veth_enable_xdp_range()
adds the NAPI instances only to pass their napi_id to
xdp_rxq_info_reg(), which no longer uses it. Patch 1 moves
netif_napi_add() into the loop that enables the NAPI instances. It also
removes the arguments and wrappers that came with adding the NAPI
instances in two places.

Patch 2 calls netif_queue_set_napi() in veth_napi_enable_range(), after
napi_enable(). In veth_napi_del_range(), it clears the link with NULL
before napi_disable().

Patch 3 adds RX queue NAPI link checks to veth.sh. The napi-id of every
RX queue must match a NAPI instance of the device. The queues must be
linked only while NAPI is enabled. The checks run with GRO on and with
XDP attached, and across RX channel changes and link down/up.

---
While working on patch 1, I noticed a pre-existing race in
veth_disable_xdp(). Jakub already pointed it out in [1] and suggested
fixing it as part of Jiayuan's series. This series only drops an
argument on that path. It does not depend on that fix. If the fix does
not end up there, I can send a separate patch for it.

[1] https://lore.kernel.org/all/20260917185814.0f944e78@kernel.org/

Tianyi Gao (3):
  veth: refactor NAPI enable paths
  veth: link RX queues to their NAPI instances
  selftests: net: veth: test RX queue NAPI links

 drivers/net/veth.c                  | 83 ++++++++---------------------
 tools/testing/selftests/net/veth.sh | 79 ++++++++++++++++++++++++++-
 2 files changed, 99 insertions(+), 63 deletions(-)


base-commit: 0822d2fe38262e8b55c5ea55c970022bca8dd2a9
-- 
2.56.0


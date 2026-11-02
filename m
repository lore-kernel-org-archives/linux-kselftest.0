Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646881;
	b=CBLlcfpQ3W5Hs2yr5aULycMeQvv0OoX6vhtRjohmQ1Wrn17n+nT1HTtaSPJItrJNnlhg
	 jo863SD7E+44WT5+p6BSCbLckCsQlNlQtUWskuynBVh5DjhJG4uQj9SPcxZJDBUZpqTLm
	 8BRNJBFrncBUszJiNxStPY5+PyPGCagfNm44XOP+5e2GXS5aBpf87J6Woap4skaPPCikF
	 9aOnfWtgh+tDaplbxUuObiUoLKZBgQXhWhk2+ZXnYAmTpU42hL9LnlSo/trkruOsSz4gw
	 WOdtJ9APYEpBUbouZePuWkDNct0a71xD+eBZOeMLH5ZOBOWPgyhjuvk5BUYqSRJeRUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646881;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vLd2sIL23oBSp/hmw6axExQ5CZRdlQO7N89fWIgKMno=;
	b=wfGJZQQfBWAv4JWsM3f3qSm55+JC83/uBRD1sajPsaWM6/zInLCFlJMprWJk8067Y1Oz
	 YF7NZkVME3KPsmm5Ko3HLFphwYkWZqT8Fp7ZcDOEKzdEHDVmj3p7TyNUG3MAkq2TiZ4Az
	 SjaNS4rXHK2W6cM6ad3nY+s56T9uOe70QbpeyS9AX3lyZBux2Q7Ty1Vq9XBTe5E6MIVYz
	 QR63ChXh1f9Ap4ViXJgRkim4LRJdFoBiGO2+SCYWK0txqrwkjFzzmM8+QFmqMswneaoTb
	 X4xR3TWIsylTskEKE39K+cfxTuRPqCYhZKGZ81bSpM/YLNkYGUNDKcww0Vmu6khaFTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P5g8VP31;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6123C606A326
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 19:14:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6123C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P5g8VP31
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-368c26de2e0so1002075eec.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 11:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793646879; x=1794251679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vLd2sIL23oBSp/hmw6axExQ5CZRdlQO7N89fWIgKMno=;
        b=P5g8VP31F4DPwI2EFyoSOnu/XbFGWi3lBHZ3eYwsTwgsbnhpefS3kfwR8m/E8rOb/8
         /IaXqym24kuCrJIMnJ/X7Twkmo+3cnZlYZum+5XiJ08bj1saTApsCADTkCtXdQwWZ82Y
         7C/TTXPXhs2nCXIKCYtpzAEnH6J8JfSA/VSfDo+O3yaPiPmMiV7u731HQ/2kJTi+f5No
         W+dcmbnmUQ2KFF3JmNFya8Q4pB3K6EHCupmVp671vfY62JEQkeorLrRuK+7WUxqk3pRj
         sio5i737wGlwEsFYONL+88woaGFbI3js8pEXtJRzgavDpPcmkvTa0Wrspq+DVptD8seZ
         SunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793646879; x=1794251679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vLd2sIL23oBSp/hmw6axExQ5CZRdlQO7N89fWIgKMno=;
        b=WPfgZmQyU/Nq5MqKfO6tQ4C7347fQ7FebHB09PraSf9S6KcZCOtwTVle5K/kQQoJVg
         6RarKbArMAGwDgCI1ukQ3jWLK3v3SUzM+ndxw2rkODZDf5HFV+sZRCQiNJG1bsjkKeTr
         3ur6UcnXDQEb+EbAQ8Dq7Jnls3UJradIhqQbHjSQb/D3F9S/MVeAxHKGActMnag7iDTs
         TFfbwcrTt6jvUwXaSayO21t3sMYlR4HiWBwY9YwRdwBQT7yZ5jW+ESBjwSbXRRLF1hJx
         HGgEaIfCaw92pxWVAjMPNq1PdwONUctW7bUUQ29UifIORbsntYACg4TzkSGqFrONfO9b
         KdCw==
X-Forwarded-Encrypted: i=1; AKwUvBz/SO/Wk6kEvstpACIByuJ4yaJ8KMI92bzR9W7uWxzOZ+kGe6U+iIcBdKMfTSMCdrIL3iM+uYj9X5uNQ53Nvdc=@vger.kernel.org
X-Gm-Message-State: AFq9FYITZFN8BI7FCI7ST7V+blywv6oY5nKZf0nM2myFWzLfahXm+CtQ
	zC1/e8YfCg2gq1FmnZiTT2GFuDqryuHUeMlVLSh0JsOuQYWnzBSzlKsh
X-Gm-Gg: AYBFou1LFdncZWNUb4MwnbnNFK3I2EsDQxfzMNUvwNb49Ivpu9Cj/nbeKfUK7t8pElq
	cfU38m0Zz9xeC1/yyU+nIswFc3H9u+p+/rFikmrEqM2/EVphSvZtgi9fNJ0KNdsntbFDKxMW+7I
	vuRBNWxkNdp/hJ2+NpBjm4xq+eyFJ9J6Rt4A/5/P2kotD8MqOqa1oS6uUkTLVFnbD7uh5OM5YAG
	Yr9xF6Q5n975zaQq2qmwhn7F9LMJmB9XB6oFFN+wHjhhVanRiT3cWlIws7H1Qm7oQk0RFO/bUGO
	bM3pcCQYPfkDn2QgkJaR886OTiEdwXeaAlssWawZ2r1m22hR+57BcTMw6Ah3+NuGis9GNV7gGH7
	1rLxaJqnTaW+89DRMs/9MFFs4Cf6wHn6OH7cHrfESakXuJWG2MMVyqlA/NN8lxWgyeGvyR/wIia
	bj9i1Su4C9HCLHHCD3NVWAptL+/XeAnbm4le+C60E8Rb3mhgMEVYYo5LWTKh1Nin+mXyCy4Gslf
	t4GfH+d8qek6DAqKVRLIZhgDfX7COphOn7FhWbSGmG/2u8f3qcRQW9wTg72mU9IjDV5bW+twMSd
	loErg+9eapE8DJ3wM0TFoz9it5jgfStJ1ydkoM3YATAh
X-Received: by 2002:a05:7301:1a15:b0:355:fdc0:a811 with SMTP id 5a478bee46e88-36a42493bc4mr15210981eec.37.1793646879343;
        Mon, 02 Nov 2026 11:14:39 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:61::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42902649sm44979101eec.11.2026.11.02.11.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:14:38 -0800 (PST)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	edumazet@kernel.org,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	sdf@fomichev.me,
	almasrymina@google.com,
	bobbyeshleman@meta.com,
	asml.silence@gmail.com,
	daniel@iogearbox.net,
	razor@blackwall.org,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next 0/7] net: devmem: size TX net_iovs from the dmabuf layout
Date: Mon,  2 Nov 2026 11:14:31 -0800
Message-ID: <20261102191438.1059771-1-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
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

TX bindings use PAGE_SIZE net_iovs, so a frag covers at most a page.
A 64KB skb needs 16 frags, and MAX_SKB_FRAGS caps devmem skbs at about
68KB, which makes BIG TCP ineffective for devmem TX.

This series picks the TX net_iov size from the dmabuf sg table instead:
the largest power of 2, up to 2MB, which aligns every DMA segment. With
a 2MB hugepage-backed udmabuf a BIG TCP skb takes a few frags. There's
no UAPI change since TX addresses are dmabuf offsets.

TCP still bounds skbs by size_goal, so frags get larger, skbs don't.
A single frag can now be as large as the skb, which matters for
NETMEM_TX drivers with tso_max_size above 64KB:
- mlx5: 32-bit length per data segment
- gve: splits frags into 16KB descriptors
- fbnic: keeps the default 64KB tso_max_size
- bnxt: 16-bit BD length, devmem TX frags are capped at 32KB by a new
  per-device limit

Tested on two mlx5 400Gb/s hosts with kperf (udmabuf, 32KB RX
net_iovs, 2MB hugepage-backed TX buffer), series backported to a 7.1
kernel on the sender only. 4 flows, MTU 4200, 6 x 60s runs, medians
(CPU over the 3 runs where every flow got its own CPUs):

                              before    after
  frags per skb (sender)       16-17      1-2
  throughput (Gb/s)            389.6    389.6
  sender sendmsg CPU (sys)     12.0%     6.7%   (-44%)

The link is the bottleneck, so the gain is CPU, not throughput.

kperf output (sender side) of runs near the median sendmsg and softirq
CPU, before:

  client: == Source <sender>
  client:   Tx 97.236 Gbps (729473351680 bytes in 60016496 usec)
  client:   Tx 97.594 Gbps (732157706240 bytes in 60016496 usec)
  client:   Tx 97.326 Gbps (730144440320 bytes in 60016496 usec)
  client:   Tx 97.505 Gbps (731486617600 bytes in 60016496 usec)
  client:   Rx  0.000 Gbps (0 bytes in 60016496 usec)
  client:   Rx  0.000 Gbps (0 bytes in 60016496 usec)
  client:   Rx  0.000 Gbps (0 bytes in 60016496 usec)
  client:   Rx  0.000 Gbps (0 bytes in 60016496 usec)
  client:   TCP retrans reord rtt rttvar d_ce snd_wnd cwnd
  client:          2460   555 201      7    0 35035136  855
  client:          3130   664 149      2    0 34394112  956
  client:          4589   488 213      6    0 36241408  860
  client:          4778   724 145      2    0 50849792  937
  client:   net CPU  5: usr: 0.00% sys: 0.03% idle:52.74% iow: 0.00% irq: 6.20% sirq:41.01%
  client:   app CPU  9: usr: 0.05% sys:11.93% idle:84.69% iow: 0.00% irq: 0.40% sirq: 2.91%
  client:   net CPU 27: usr: 0.01% sys: 0.01% idle:53.23% iow: 0.00% irq: 5.73% sirq:40.99%
  client:   app CPU 31: usr: 0.03% sys:12.17% idle:85.90% iow: 0.00% irq: 0.25% sirq: 1.63%
  client:   net CPU 32: usr: 0.00% sys: 0.03% idle:53.57% iow: 0.00% irq: 5.63% sirq:40.75%
  client:   app CPU 36: usr: 0.03% sys:11.85% idle:84.88% iow: 0.00% irq: 0.40% sirq: 2.82%
  client:   net CPU 34: usr: 0.00% sys: 0.03% idle:54.10% iow: 0.00% irq: 5.68% sirq:40.18%
  client:   app CPU 38: usr: 0.01% sys:12.10% idle:84.84% iow: 0.00% irq: 0.34% sirq: 2.68%

after:

  client: == Source <sender>
  client:   Tx 97.569 Gbps (732157706240 bytes in 60032032 usec)
  client:   Tx 97.211 Gbps (729473351680 bytes in 60032032 usec)
  client:   Tx 97.390 Gbps (730815528960 bytes in 60032032 usec)
  client:   Tx 97.390 Gbps (730815528960 bytes in 60032032 usec)
  client:   Rx  0.000 Gbps (0 bytes in 60032032 usec)
  client:   Rx  0.000 Gbps (0 bytes in 60032032 usec)
  client:   Rx  0.000 Gbps (0 bytes in 60032032 usec)
  client:   Rx  0.000 Gbps (0 bytes in 60032032 usec)
  client:   TCP retrans reord rtt rttvar d_ce snd_wnd cwnd
  client:          6137   316 118      1    0 63000576  775
  client:          5872   344 177      6    0 52045824  707
  client:          6597   501 121      4    0 62879744  721
  client:          5938   347 136      5    0 56500224  707
  client:   net CPU 18: usr: 0.00% sys: 0.03% idle:55.40% iow: 0.00% irq: 6.25% sirq:38.30%
  client:   app CPU 22: usr: 0.03% sys: 6.67% idle:92.34% iow: 0.00% irq: 0.11% sirq: 0.83%
  client:   net CPU 24: usr: 0.01% sys: 0.03% idle:56.98% iow: 0.00% irq: 6.07% sirq:36.89%
  client:   app CPU 28: usr: 0.03% sys: 6.75% idle:92.71% iow: 0.00% irq: 0.08% sirq: 0.41%
  client:   net CPU 34: usr: 0.01% sys: 0.03% idle:56.20% iow: 0.00% irq: 5.90% sirq:37.84%
  client:   app CPU 38: usr: 0.03% sys: 6.81% idle:89.73% iow: 0.00% irq: 0.40% sirq: 3.01%
  client:   net CPU 44: usr: 0.01% sys: 0.05% idle:57.75% iow: 0.00% irq: 5.59% sirq:36.58%
  client:   app CPU 48: usr: 0.08% sys: 6.69% idle:92.18% iow: 0.00% irq: 0.13% sirq: 0.89%

The bnxt patches (1 and 5) were tested on two 50Gb/s bnxt hosts with
CONFIG_MAX_SKB_FRAGS=45 (with 17 the check in patch 1 compiles out).
kperf devmem TX from a 2MB hugepage-backed udmabuf runs at line rate
(46.4Gb/s, payload validated) with 2-3 frags per skb, none above 32KB.
ncdevmem sending 1KB chunks builds skbs with up to 45 frags, the stack
segments them and the data arrives intact.

Patches:
- 1: bnxt: segment GSO skbs with too many frags in the stack
- 2-3: devmem TX prep (truesize, niov_shift in the TX lookup)
- 4-5: per-device netmem TX frag size limit, 32KB for bnxt
- 6: pick the TX net_iov size from the sg table
- 7: selftest for TX from a hugepage-backed dmabuf

Stanislav Fomichev (7):
  bnxt_en: let the stack segment GSO skbs with too many frags
  net: devmem: charge the frag length to TX skb truesize
  net: devmem: use niov_shift in net_devmem_get_niov_at()
  net: devmem: add a per-device netmem TX frag size limit
  bnxt_en: limit netmem TX frags to 32KB
  net: devmem: size TX net_iovs from the dmabuf sg table
  selftests: drv-net: devmem: TX from a hugepage-backed dmabuf

 .../networking/net_cachelines/net_device.rst  |  1 +
 Documentation/networking/netmem.rst           |  6 +++
 drivers/net/ethernet/broadcom/bnxt/bnxt.c     |  6 +++
 include/linux/netdevice.h                     |  2 +
 net/core/datagram.c                           |  3 +-
 net/core/dev.c                                |  1 +
 net/core/devmem.c                             | 37 +++++++++++++---
 net/core/devmem.h                             |  1 +
 net/core/netdev-genl.c                        |  2 +-
 .../selftests/drivers/net/hw/devmem.py        | 10 ++++-
 .../selftests/drivers/net/hw/devmem_lib.py    | 43 +++++++++++++++++--
 .../selftests/drivers/net/hw/ncdevmem.c       |  8 +++-
 .../selftests/drivers/net/hw/nk_devmem.py     | 11 ++++-
 13 files changed, 115 insertions(+), 16 deletions(-)

-- 
2.53.0-Meta


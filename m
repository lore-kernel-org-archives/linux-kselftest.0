Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793917261;
	b=iV6d/k4PcCy4nWFDwGkEzD36hMwEFFtlqgrkjEukJDDtVKAfYoxSGBnJzOCi6yb0X3QZ
	 hs3gVJvN+9V1WalqbEdlJUyED2iyPfrTn3dGhBLcGilvZz4Z+gJbzCYaSmt/O/H7Y3V4D
	 BTXjQOETgvYO3PeAWkiyn3V0o8o7VUOUu+UgdzDA/VlyznK8M3zx8pqcGopI9ULcrbJpN
	 KRLMy6ZgCn5AfNfN9lMqAKAX3k8V/XZ572fnmPM09twlSLztUkOwlHnCHykHtNDxpi0Hi
	 SlOavSG8UDqqVXwx0E25Sz1TE9FNee7c6cjWOU86XHPxRSqfiRwgYAJ/vnQtBvRxUZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793917261;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kZvRQk8qYOltAbKUxNkYwyZeXDB5dZ+BBtBT4hJ905c=;
	b=pEJUJHYP2IWHUppUPIy0YwYk3lOwrzhGI9aDyykPAALcZstXHt4KE2rUQaAKeENrH3kB
	 N7+fZlN/p/T79YEfbwAkNQfwUSVzAVeTVzv8gnJsZzif3jBr1UnTbUmeO0G2UBhbxt8Qr
	 1LC4qCrxGutcIbxeg8Iu0iVtkMxGu9xr4yQbwhF1zAwwErEkMJAMRjU2jeZGTclWWhYro
	 HE/V2+blkjILu8PtSoHTK726MLo4W5Um3Iblx6ZtaDco9v45/N75LCp0Cx3mZsIrGa5xA
	 1j1WtRRMkUk5Glg0H+/BVlcD7ZWeaj27PMsnXxAWgUOC1NBl5/CNMjwJnMOJZkPDRHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=obvqlox2;
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CA5606A331
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 22:21:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03CA5606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=obvqlox2
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36f645c688fso468eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 14:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793917260; x=1794522060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kZvRQk8qYOltAbKUxNkYwyZeXDB5dZ+BBtBT4hJ905c=;
        b=obvqlox2baCnA3JMUIrvbt0d7DdsKdabHK7z6YwvqrDPqNNZGm6+LEmE29FLBrXUSN
         xfWpLTfkrYg+qFBP3rvKTBRIx/amuIUtOxV3DtWxkosqeIo81ByIqbEmwdFCmeusXv8G
         x6nyGWLEU4qkom+beG0+3G8BmFBqjhvVbDMZdoMm4k1/+K7aDIdQFrNZh4Ek6qC2NNCk
         8Hm3o52rP4oPPBIwniUZs6fynaDYP5wRwUBBd4Qtv4S4EIFvH9cx6oiN0I2ZF9dxAknx
         G4p2cm//p0z1ftCZZeR9jR+IXuUc539iGLsY48DWW19vAtuyIvzFrhZf6rBVIO/ReNDP
         83Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793917260; x=1794522060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kZvRQk8qYOltAbKUxNkYwyZeXDB5dZ+BBtBT4hJ905c=;
        b=AA10CsbT4kYuf4EaZXRYILwsQ4XlbXGGbF4JD5XRfCU0vbsVquNEPWqTr41O61h7ix
         IOtoWvko7ALxetT1Qflu77fIa5gN0oNAHkEg0oCWlahHIbBJxCWPfZ+FVPxAondroq91
         iFjWiyjAueO3cmgbdPMidML9xa0fn1FbT0RFkqvFMiM6tqqLpR+Lbr2YTvomXcDSFnrf
         GXfoUsRumOEUJpM3HkAWqiKUc0Kd0UORbbvafwzka6+PYlwEDoa+4JXA9UcumrGKdoNd
         cj5EYggucaOS61UrEkgvBUhcTLbOJkor0m9ABGvs778uZt4mx24+0z0EPG+NI1P0Isf/
         ZB8w==
X-Forwarded-Encrypted: i=1; AKwUvBwM4f59NnPgeSkVKfbPtUcYMcItEFW73xPFiJ6OEaNpkI8yXfeK6J8G7hOi+KRzwXFcXLeW8r3OG5At8siWtXM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+t/xh7EGjDXOBISFLna29rA6+VZFipa+K9FJiSBCMa6VJEjVw
	n9m3O9CzbksrRZbTxhpNl1zzIMwbeqwgbVv+8pO5obTN9d88AoLKy+EP
X-Gm-Gg: AYBFou1dGNzp27z2ZLsxUSLffiQTYa/myBg5JJswRcfTNbhA0GIw40KBpCpOddWESZC
	39hI4jrihlL8Bbwy3skZ/cwp8bA9mGGGGqQU96fLuEdpVAcbShCAdBcBBjzqv+YI8XS6qTv8BCC
	QT1KdwVbOhmXfN+4vNsqlAScSC6HBcgyk9lskUr8zDIpvAZeoVUBpMz/Z0u0RiBQf+oDwUs9Ix9
	w5RRtJwIoJ9Qez4BZH0F9fEoR8AYMudbnde5hiSLa5/leLZ49gkN6cB78jU3UGp3O+39XdTNmCP
	CsAP1uu/BX+OpCAgS1mQEBo46stIEsIGkC4iDPef3XW6zjSOcIonUqJJThDRPyBJ/Vi5nh8f5go
	IAWIdEMPnrlG5dzlXlttz76nlfI86vtNHPIudNkWIIXWH0ZsysriPqe9g2MrJXHjHeRMX2ZOvHd
	ITV1LbhrPOenwhppd8r4XkKG4gnmJ3IoVWN7P9DHAGOoIKrLhLN8jG3hYCYDNpKBqxno1AzExW4
	uLi5thMDu3S88SfFNxvemBGBTm+F91g7+7J/sP35TZsBeo/Fq3E1heNJWwe17iIHcjYfaL3daVU
	2WbG8QnJSQ420sCKSI5vlLY=
X-Received: by 2002:a05:693c:6096:b0:368:d0b6:b231 with SMTP id 5a478bee46e88-36f752511a5mr890910eec.10.1793917259665;
        Thu, 05 Nov 2026 14:20:59 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:74::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651eccdsm117955eec.1.2026.11.05.14.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 14:20:59 -0800 (PST)
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
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	alexanderduyck@fb.com,
	kernel-team@meta.com,
	sdf@fomichev.me,
	dimitri.daskalakis1@gmail.com,
	almasrymina@google.com,
	dtatulea@nvidia.com,
	bobbyeshleman@meta.com,
	asml.silence@gmail.com,
	daniel@iogearbox.net,
	razor@blackwall.org,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	leon@kernel.org
Subject: [PATCH net-next v3 0/9] net: devmem: size TX net_iovs from the dmabuf layout
Date: Thu,  5 Nov 2026 14:20:49 -0800
Message-ID: <20261105222058.944293-1-sdf@fomichev.me>
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
Devmem TX frags are capped by a new per-device limit, PAGE_SIZE by
default, so drivers opt in to larger frags:
- mlx5: no limit, 32-bit length per data segment
- bnxt, fbnic: 32KB, 16-bit TX descriptor length
- gve keeps PAGE_SIZE frags

Tested on two mlx5 400Gb/s hosts with kperf (udmabuf, 32KB RX
net_iovs, 2MB hugepage-backed TX buffer), series backported to a 7.1
kernel on the sender only. 1 flow, MTU 4200, receiver tcp_rmem capped
at 16MB so it doesn't drop, median of 5 x 60s runs:

                              before    after
  frags per skb (sender)       16-17      1-2
  throughput (Gb/s)            208.6    211.2
  sender sendmsg CPU (sys)     40.8%    19.5%   (-52%)

The receiver's CPU is the bottleneck, so the gain is CPU, not
throughput. More of the transmit runs from the ACK path, so the
sender's softirq grows (52% -> 59%), but sys + sirq still drops by 16%.

kperf output (sender side) of runs near the median, before:

  client: == Source <sender>
  client:   Tx213.826 Gbps (1603901849600 bytes in 60007723 usec)
  client:   Rx  0.000 Gbps (0 bytes in 60007723 usec)
  client:   TCP retrans reord rtt rttvar d_ce snd_wnd cwnd
  client:             0     0 633      2    0 15556608 7657
  client:   net CPU 49: usr: 0.01% sys: 0.10% idle:44.13% iow: 0.00% irq: 3.21% sirq:52.53%
  client:   app CPU 50: usr: 0.05% sys:41.55% idle:53.88% iow: 0.00% irq: 1.40% sirq: 3.10%

after:

  client: == Source <sender>
  client:   Tx211.242 Gbps (1584440279040 bytes in 60004741 usec)
  client:   Rx  0.000 Gbps (0 bytes in 60004741 usec)
  client:   TCP retrans reord rtt rttvar d_ce snd_wnd cwnd
  client:             0     0 556      3    0 15499264 7650
  client:   net CPU 13: usr: 0.01% sys: 0.08% idle:37.75% iow: 0.00% irq: 3.87% sirq:58.26%
  client:   app CPU 14: usr: 0.06% sys:19.48% idle:77.23% iow: 0.00% irq: 1.19% sirq: 2.02%

The bnxt patches (1 and 5) were tested on two 50Gb/s bnxt hosts with
CONFIG_MAX_SKB_FRAGS=45 (with 17 the check in patch 1 compiles out).
kperf devmem TX from a 2MB hugepage-backed udmabuf runs at line rate
(46.4Gb/s, payload validated) with 2-3 frags per skb, none above 32KB.
ncdevmem sending 1KB chunks builds skbs with up to 45 frags, the stack
segments them and the data arrives intact. The fbnic patch is
build-tested only.

Patches:
- 1: bnxt: segment GSO skbs with too many frags in the stack
- 2-3: devmem TX prep (truesize, niov_shift in the TX lookup)
- 4-7: per-device netmem TX frag size limit, PAGE_SIZE by default,
  opt-ins for bnxt, fbnic and mlx5
- 8: pick the TX net_iov size from the sg table
- 9: selftest for TX from a hugepage-backed dmabuf

v3:
- default the netmem TX frag size limit to PAGE_SIZE, opt in bnxt,
  fbnic and mlx5 (Mina)

v2: https://lore.kernel.org/netdev/20261103235152.1904727-1-sdf@fomichev.me/
- reword the TX truesize commit message (Mina)
- explain why the TX net_iov size ignores the device limit (Mina)
- use 1 flow results in the cover letter (Mina)

v1: https://lore.kernel.org/netdev/20261102191438.1059771-1-sdf@fomichev.me/

Stanislav Fomichev (9):
  bnxt_en: let the stack segment GSO skbs with too many frags
  net: devmem: charge the frag length to TX skb truesize
  net: devmem: use niov_shift in net_devmem_get_niov_at()
  net: devmem: add a per-device netmem TX frag size limit
  bnxt_en: set the netmem TX frag size limit to 32KB
  eth: fbnic: set the netmem TX frag size limit to 32KB
  net/mlx5e: lift the netmem TX frag size limit
  net: devmem: size TX net_iovs from the dmabuf sg table
  selftests: drv-net: devmem: TX from a hugepage-backed dmabuf

 .../networking/net_cachelines/net_device.rst  |  1 +
 Documentation/networking/netmem.rst           |  7 +++
 drivers/net/ethernet/broadcom/bnxt/bnxt.c     |  6 +++
 .../net/ethernet/mellanox/mlx5/core/en_main.c |  1 +
 .../net/ethernet/meta/fbnic/fbnic_netdev.c    |  1 +
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
 15 files changed, 118 insertions(+), 16 deletions(-)

-- 
2.53.0-Meta


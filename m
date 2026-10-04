Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E2B3D1CB5
	for <linux-kselftest@vger.kernel.org>; Sun,  4 Oct 2026 17:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791134171; cv=none; b=HRRwYKqUC8szdI6aT4hajx0arN+anoCD42cYATxXvHCMdX9KbYG/DStVuD7oZe9PMfrWaQhh5pWT6NA3SUHbgMwaGJ/N7tilMWRXtnKqheTP4cv25s3eVO0B/aNET4cpv/+bmVQfkrASU0YAzV9BG0RM9z500O7x7Ikk3TJj2HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791134171; c=relaxed/simple;
	bh=rBHJvSFHLogmhqc8qfoepEplPJGPX9ErzSBr3vdnmXw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r8X80eFo9A7YvXq/G0HxIecrBQZ7ypweWW/O+00pk/NB4mWSDm3OXY2QxGolLLKTZbbzall2IOwnMffgiIaRapfWvqmisDzWXiUm2E8nHJ24Q7osQFJcKRsMswwRjK/6UqiB4OI1q6WP231Pl15VvT57VB5dXagnDaBIw3J4Q6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=c5LQ0Ngn; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="c5LQ0Ngn"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c1670dad7a8so197279366b.3
        for <linux-kselftest@vger.kernel.org>; Sun, 04 Oct 2026 10:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1791134167; x=1791738967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pYMVFKoytfLOZjDdNYvHmJsPemFRuNKvWdr0rA6Xpv0=;
        b=c5LQ0NgnxmgzgAX9APuwJeLA2LhejR+NZRo8avB1iEDHndr0IP9ah87SWkXn3UEIc4
         EZFpsIJhByekL7Ry4oalElnDHW2Bn8KXRbsEe6d4E/AGd/MLCGZcjac977RyLymzAp0C
         K+S5L+0LUvwiJVVFz5KjVU4GOyKWQiijuvkvmulkv1cnny1OWZGPKMNUb5Z2jtR/gn4r
         jv7N0Xshq316EC4o6u8UMvvGkBLN0ytqd9dw0j0WjO4n7K4M3GE+RGAPZKW+hnVUoqNf
         OEb5kmTZBWmdHUWDagr37MxGFQ0ZPQx9KbCkXp56dKNkZenLr2HRJRFaDe+Cy7ZpYV/D
         HeYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791134167; x=1791738967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pYMVFKoytfLOZjDdNYvHmJsPemFRuNKvWdr0rA6Xpv0=;
        b=vxhp6X+B0ByGNU+2Bos7zcKd/XdiQmC9Q4H5svUJNAXOYIFBI+gjbMn9JbL2gNqaFo
         0aDtICAlzc9ZnTs3BDdwryHBZnXsudgO0X9pDlJWAfQtwVK5kyT6mq3Hx8BN+7s3pFEH
         6FAr8w1hPsXFstAXnLcKBFgGbnSNpIOwwPnsSv7kPs4zk952PFynaWVwun5pYvxeCy5N
         wfb5TAJ9078PUroif7gMbJ+u0R40z8GgcW3DGTQoxeeZBsSMfcFfsLHUL9xdTJKwRZ1q
         rur2XDDZeCwUI3wQ0k/6CJr9MJkw46A6QCBOY9MiWwst2NyheahVpk5ixILRgZHlf68w
         cTjw==
X-Forwarded-Encrypted: i=1; AKwUvBzqJRUORK41lwM79lb+NBAbKv77y4eC+h/heEJ7G78rohDU31zer06whkJT5OkNltkUqExbt5K32L71TF2b2jo=@vger.kernel.org
X-Gm-Message-State: AFuF++l2sT4wVzi4kXAzch/Wca1DBSJ9zfJBckWifI93J/CIDNPowrC9
	x1A2pxsOgDNTvdoReHc5GDG4X3H+B4pqK3QRhWMWBMHK/5NJRGuz+08Gl4B5LkYBlA==
X-Gm-Gg: AYBFou34jceJVBtZg91luUGRlAiI6zPa0i6WEWRyxGov3yZ1x1KRtnXlfOvcywp/vf2
	tic+P7jK0G6u5URQLjOsxhiznlzgDPK3Flib+oUYL612B35KCa5pnqpN4eeBg9DsHXu1qRuu+Lu
	b1yiIpcRWzpGYuljnBMA2RLHgpQ4RFzf06aeYj3kJDlub6HeOQ8Oj16nVQ4Isr+7Xk7w460iudb
	tOLc8eSpaSVyQjD0p9WB1pbWT9VV/XjxTYCzHMv8kHGs42vM/a5BEBZFeU70xdftyBedDyfmolZ
	ocmEPJ2FnD/eO9sMwFCZvjVGD8gdvBWAyusodZWu7EKRRKoBKoN/a87CluK7odG4y0D878g1AI+
	1uBxiGJxc9TaG0/gBRgTRy/gAB2zuDZ4Rfk99OgpCCCxG5IUtoZhdX1Ha4yt7VdWKwHv4NOFkgn
	prDsVaGtXkS2NW2mJ+ivddLqkQYKYDGfbvQXPuxLkdD84hItNxnwfP3dwdDrX7Hmg6wKgwZDXsz
	58zio2enSQ0tdTdvLaYwmPyLyqTvcdmHLz7kAqWh3C6csTZP9mAEuId/o5ypF0yRU2RHBeKPb2q
	Gg+L+uKpi2WrZvOY1igJeBXoVNU/qRj2GK0Laow+x6GktVdirijOiMCLQWeWgbGv3z/lA2MENJA
	SHvPgZn62hyrfvpEIXbLKwvIU3F7tO0UuoOYqa3jw6EX1yjA9mBunfcAqfv4/XTxGNNBRStkwLb
	oE/1S24ohEA86DStu6w2/JYdj36NfKkclIYA==
X-Received: by 2002:a17:907:a648:b0:c26:19de:9138 with SMTP id a640c23a62f3a-c2e6ee5ffa4mr444266466b.43.1791134167223;
        Sun, 04 Oct 2026 10:16:07 -0700 (PDT)
Received: from Desktop (pd9513667.dip0.t-ipconnect.de. [217.81.54.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e878b0e05sm82284366b.5.2026.10.04.10.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 10:16:06 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netfilter-devel@vger.kernel.org
Cc: pablo@netfilter.org,
	fw@strlen.de,
	kadlec@netfilter.org,
	phil@nwl.cc,
	horms@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	razor@blackwall.org,
	ericwouds@gmail.com,
	dqfext@gmail.com,
	netdev@vger.kernel.org,
	coreteam@netfilter.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH nf-next v6 0/2] netfilter: flowtable: tear down bridged flows on layer 2 roaming
Date: Sun,  4 Oct 2026 19:16:03 +0200
Message-ID: <20261004171605.3544792-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A flowtable flow that transmits straight to a bridge port keeps sending
to the old port when the host moves to another port, for example a
Wi-Fi station roaming between access points. Patch 1 makes the flowtable
gc tear such a flow down. Patch 2 adds selftest cases.

v5 tore flows down on the switchdev fdb delete notification, which the
bridge does not send for every move and not at all without
CONFIG_NET_SWITCHDEV. v6 checks the path in the gc, as for a stale dst,
after Florian's review of v4. Eric Woudstra wrote v1 to v4.

Tested on an ipq807x router (OpenWrt, 6.18 backport, out-of-tree PPE
driver), three runs: without patch 1 a roaming station's download did
not resume within the 29 s observed; with it the longest gap was 1.1 s.
Without patch 1 the four selftest cases where the host moves fail; all
six pass with it, also with CONFIG_NET_SWITCHDEV=n.

Changes in v6:
- check the path in the gc instead of using switchdev notifications
- leave the flow alone when its fdb entry ages out
- drop the v5 patch that stored the bridge vid; nothing reads it
- selftest: more cases, including fdb ageing and IPv6

v5: https://lore.kernel.org/netfilter-devel/20260914072541.897040-1-julius@bairaktaris.de/
v4: https://lore.kernel.org/netfilter-devel/20250925182623.114045-1-ericwouds@gmail.com/

Julius Bairaktaris (2):
  netfilter: flowtable: tear down direct xmit flows when the fdb entry
    moves
  selftests: netfilter: nft_flowtable.sh: roam a host between two bridge
    ports

 include/net/netfilter/nf_flow_table.h         |   4 +
 net/netfilter/nf_flow_table_core.c            |  44 ++++
 net/netfilter/nf_flow_table_path.c            |   7 +
 .../selftests/net/netfilter/nft_flowtable.sh  | 201 ++++++++++++++++++
 4 files changed, 256 insertions(+)


base-commit: 87b80c2f6b05cad9f0ff9136709c62a0f59923e3
-- 
2.53.0


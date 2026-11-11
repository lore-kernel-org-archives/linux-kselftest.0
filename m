Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794437264;
	b=qDWqdtar/H+qfWE8CWQMeSqMn0uXRfcJT+37bqnuss7kGkZXBed2MYutxn6IoDPufN6Q
	 oJYK8NKDqVP++AN2osmXMlok+lPxZXJkHLFsTwtJTz5mcF46Dfb9BPkRxdyfBav8uh7cA
	 CIqLj+4lq8B0xMke5SN9jjYiABXG5mJID7qUMHFVFXLrwkZh0EGGyUFKn8fN78evsHPJf
	 pE5EkXDhgialQ6VhaJN0rrUCOPiwiXERgcpa5LxrDfvgUujix6PGQtGalZGZGV3+mKmTe
	 BV6wPCWdTv+UVLjCdJeN30inkg5u05b5hCkLXuo+jnz5iepa5xAlHcpctvgFR35OMgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794437264;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ji3jFp1wSqz7+lu20WnaH3a/SRQ7c4xRIo2XU78doao=;
	b=V8B2ZCj3PCcHipxiCjKO23JoDQlAruROoiZI7vCkhUm9fDzeKmfsi8CcP9s0C0h6p+ez
	 E0RAqVMr354XnzLkbwePxamz+NFSAsq9sW44SjpytdyZBYlEu8zT2TlxHFXDHvA4Yqma6
	 FrZnXZ8UN/T0+EdhHCp+p7xbRTOBABVrT2zxFFRmAmc0S26vZ3IRjXnZO7hYGgUTrA4hU
	 mGMSGULu7LUR39W34U8jzZnVuZILp5IRTnlxad7slcmBiuUnyw2TAiA10mVhl/uvCNDwB
	 sOTEj5XFty5VONH7wLkRRo+ekyBZJ0XvdFvsvDc65ff0m7jH+2HfmOQ2hnvHd3DOi3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w14O00X3;
	arc=none smtp.remote-ip=74.125.229.135
Received: from mail-dl2-f7.google.com (mail-dl2-f7.google.com [74.125.229.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C16606B745
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 22:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14C16606B745
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w14O00X3
Received: by mail-dl2-f7.google.com with SMTP id a92af1059eb24-13985f8229aso3322099c88.1
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 14:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794437262; x=1795042062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ji3jFp1wSqz7+lu20WnaH3a/SRQ7c4xRIo2XU78doao=;
        b=w14O00X3MAea7CRAKjvuLoDbCE5nhypmw9DenJFGrL+8wUnY/NYtrU63h9HS0XRHcB
         EwOw3hCY4etLiYiVhUKJ9WIUKVDIR3bloDLuqJbxvjr2d/64k4HLYc/Zz4gweeyrDfb9
         kfkycIWyUcQANgosZ05YOK1Fnwl7ivM4RouWyaQ0nOL2GAhQBo69JgMjrsDGZG4xZKxW
         UmJp99zGMV45SyqdjMVi62MuZd+rkc+2xepDb5os70xf0NE/FOVMRhRktFt5lBr1CzTn
         Y/F3J5e+CmRdY3D4t9+uCjqhAhvLqeV4k87gHxaFPnqJP7MWyHoCBgS6YmUOnWpk4f2K
         I6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794437262; x=1795042062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ji3jFp1wSqz7+lu20WnaH3a/SRQ7c4xRIo2XU78doao=;
        b=BpTXgGC1osdnQtVqq6urqGltIoF5rTOkQSSCfSnPxm8YNDnTTHbZ+Ch7MU9Sq4Mdkj
         V7KehWGjRW2wclH5rk/7+RxCLFwKUL5+ihIxbkH/h4nn6z7T0HeEqlaoPk5lIXIhfSCP
         AuqqV9ZmEPa3yRPukMLi2x10TIOzCTRaL7KVyrpBLvEVtrJWt7mYB6CFxwZrTjsWAUUd
         YyPKtmmjjF/cH9zld5ILeWTEYbdad3NEtyW7G+lTOcPAkQlKJc7D/UBM2XRIbz40KeKy
         5Og2p2ACgw6VEgo2jnkY+FIms7aq6ubCePHmCV9f4Vs0EIOLBHlpc7e8HkqPOnK++JSY
         9IXQ==
X-Forwarded-Encrypted: i=1; AL+hErE+qG7++eeMsgPB169A6+rG+p7FuYONnYNNkmKSVtnrwVuSQ+nyAOtlDjOjFuG3eBI4RsAp3gPTjiUS+EBPPkE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vN5QFqxdpUA4AcfqUjWqvl5GgozTa48QMmUd+vFqNVnNixica
	Uk37yzScsQHEDl++e9PMVOh5LrbrhMqixIiGjp2taIxwHuM8+uF52cRR
X-Gm-Gg: AYBFou1aHK5wwiEkN6uNwMb19NJENBcxjuh2SspFujGUnHQoZcd0JDs/gZ5dk48RvTU
	ddaVSt878t8gbG1lhF8qKehlY+qARLUai+FxCZhTxxQhhPV2rqg6aTCXAIkSrPULPTp3+Y6tW0S
	4Oxiie/YFKbL+BfdiUtOxfclhkr0yfnKnSKMV8WAhzcB1wNz/ytuMiTk0WQnSzkeHQyxbTbnNTm
	HsUmA/rPFy7s8MXONHBe/gtVaeVxEKl7wXVzFUeUsPu/nCKJhBVSYIw9Bhu/mApZjgIVI0bLhYp
	wFB+GSwHd6rT/OwCQFLVogsBgt9cw+9ZsCPOExpWHBj4uAr6oIAEsnzQC7k1jCY6lSMtoZJngMj
	6zrA+LG/GxEI4lKiyPgEo3zU6pXwJyyu6uQkG2x0kgSwXAk49HQJ7QDqWSq64B5RMm0ryAuMJfY
	9IXiXFSwEn9ZRIKgc5n81w7ICEgEmURLvAiZIyeS18LgG2UkOq+wjreFBbmr6VVrQAzb+mZ9fRV
	No59X9eSeTYVsn0mWzeOPYkiRFrfZFfj3W6ktxvsY5rgtICLa0H4Ty8ARPbXbHa3W+MprfbsN3X
	mFAoNYbq5GovS43P8/IBWkWx
X-Received: by 2002:a05:7022:b0c5:b0:1b4:fa58:9d8 with SMTP id a92af1059eb24-1b4fa580c0fmr159091c88.20.1794437261896;
        Wed, 11 Nov 2026 14:47:41 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:6a::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b1003fsm17745496c88.6.2026.11.11.14.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:47:41 -0800 (PST)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	andrew+netdev@lunn.ch,
	edumazet@kernel.org,
	horms@kernel.org,
	shuah@kernel.org,
	almasrymina@google.com,
	sdf@fomichev.me,
	leitao@debian.org,
	dtatulea@nvidia.com,
	asml.silence@gmail.com,
	bobbyeshleman@meta.com,
	daniel@iogearbox.net,
	razor@blackwall.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v4 0/5] net: devmem: size TX net_iovs from the dmabuf layout
Date: Wed, 11 Nov 2026 14:47:35 -0800
Message-ID: <20261111224740.2744522-1-sdf@fomichev.me>
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

This doesn't make skbs larger. TCP still sizes them with size_goal.
Only the frags get larger, and a single frag can now cover the whole
skb.

An skb stays under 64KB unless BIG TCP is enabled. With BIG TCP,
MSG_ZEROCOPY from huge pages can already create frags of 64KB or
more. So drivers already have to handle them:
- mlx5 has a 31-bit length per data segment
- gve splits frags into 16KB descriptors
- fbnic doesn't enable BIG TCP
- bnxt has a 16-bit BD length. It is broken for such page frags today
  and will be fixed separately.

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

The bnxt patch was tested on two 50Gb/s bnxt hosts with
CONFIG_MAX_SKB_FRAGS=45. With the default of 17 its check compiles
out. ncdevmem sending 1KB chunks builds skbs with up to 45 frags. The
stack segments them and the data arrives intact.

Patches:
- 1: bnxt: segment GSO skbs with too many frags in the stack
- 2-3: devmem TX prep (truesize, niov_shift in the TX lookup)
- 4: pick the TX net_iov size from the sg table
- 5: selftest for TX from a hugepage-backed dmabuf

v4:
- drop the per-device frag size limit and the bnxt, fbnic and mlx5
  patches. Drivers already have to handle large page frags (Jakub).

v3: https://lore.kernel.org/netdev/20261105222058.944293-1-sdf@fomichev.me/
- default the netmem TX frag size limit to PAGE_SIZE, opt in bnxt,
  fbnic and mlx5 (Mina)

v2: https://lore.kernel.org/netdev/20261103235152.1904727-1-sdf@fomichev.me/
- reword the TX truesize commit message (Mina)
- explain why the TX net_iov size ignores the device limit (Mina)
- use 1 flow results in the cover letter (Mina)

v1: https://lore.kernel.org/netdev/20261102191438.1059771-1-sdf@fomichev.me/

Stanislav Fomichev (5):
  bnxt_en: let the stack segment GSO skbs with too many frags
  net: devmem: charge the frag length to TX skb truesize
  net: devmem: use niov_shift in net_devmem_get_niov_at()
  net: devmem: size TX net_iovs from the dmabuf sg table
  selftests: drv-net: devmem: TX from a hugepage-backed dmabuf

 drivers/net/ethernet/broadcom/bnxt/bnxt.c     |  5 +++
 net/core/datagram.c                           |  2 +-
 net/core/devmem.c                             | 36 +++++++++++++---
 net/core/netdev-genl.c                        |  2 +-
 .../selftests/drivers/net/hw/devmem.py        | 10 ++++-
 .../selftests/drivers/net/hw/devmem_lib.py    | 43 +++++++++++++++++--
 .../selftests/drivers/net/hw/ncdevmem.c       |  8 +++-
 .../selftests/drivers/net/hw/nk_devmem.py     | 11 ++++-
 8 files changed, 101 insertions(+), 16 deletions(-)

-- 
2.53.0-Meta


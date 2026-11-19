Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099371;
	b=Z/8C/EH2H32JBnk8RIVhtJ6VK9LGdj4fJtD+hQovPsJiEpCyS6HvyfmiuQuBT0Vl5v8M
	 LvthVxtFXW4Gh5nS6GCesAKXaPr7kwnoPf3joFEp8zV6ClYMIn8YWS6UL+bq0I+XAnD4G
	 EDnUq67GbaSCOeCY9uU4QaGbL1lDkt2McjSFaoOB2ktqFfyALIMbJOCj+I89jIw+rKUFF
	 mu+djzUwCZDV0oj0SkE4uCN/710JNobkgFue2dV0FbJ0kjJotgYIo1Ph5cAXbnz0z8CBG
	 U9qSaDiP2CTfKzAKwBkdIc4ot5U4YdRk61vup14KflsR/dnaxPHl/TbGkbhn8Ckw6bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v3xkagrxB3HahBUr+oi4+OJRQhNmx/+oPp/oYbXSNH0=;
	b=IsYWToQlEId3zeXmPT4qRBiRRa6o/HeXpTjWIRIYh7cx721kSb6Idj58R1bRAlPmTjku
	 KnBGO+BsiF8wR+hGpcJzH758lUpq/q/a2DRMOlFOzQmu5Cns6T1eXBZnM9rifSXS2puS1
	 5FmB035GcHW6khyTNPyH9UtHGZJw/3wcL7lB9vBMSAWehINrAFIIr6GJJ5KY80wQwUlOB
	 +MmO/ugHVD+DKc0pDbNYXhVvyOSEzvNSgaYwe/d4wKENVwpuJdt5JhUdWjVfdk3R0uvEA
	 YISndprsF7Qk8LVbDzb0Atc/nj+UQ8ewZkmMPhMrYtCQ8kRbvK09eHMBxqR1eVJFTgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QWRUJC44;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29226606A324
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 14:42:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29226606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QWRUJC44
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cddc597d062so1439253a12.3
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 06:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795099370; x=1795704170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v3xkagrxB3HahBUr+oi4+OJRQhNmx/+oPp/oYbXSNH0=;
        b=QWRUJC44BrmfZY+w2pGbGJ6vxwqJppP7pq9pMep5n40I/NcvyQYifDPS73XMySn8RE
         qELnVmv+5heGDMqxLOTYJABjbghIX5wjgqFnAOTRcyfPANiIWqCZHB8hkQ6Z3CiPhjbf
         4o/Xc1FSs68jgMySqFLhmvY9xlxLirm6AcnOryju3Irq7FmHS6HowwiU+VTnhcgkRWJw
         HjCoRWsM3yUKe5JDG8Xa30ek5Tfxy5RiZLnbmqVtZ0Io53UxA5GLeChbX2mnLdCwTGmP
         LGvoD7cj3WfsZ88t+Uf3DdCvXfcL4bJqP6HfcnL0SYOndbpywjpNcdnLrdeEkIGnFUci
         QoXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795099370; x=1795704170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v3xkagrxB3HahBUr+oi4+OJRQhNmx/+oPp/oYbXSNH0=;
        b=hnsAcvqDBf7sdMOc941G5B5ZXElqGOaAi+CkldnJw8UUCGVT0vEir8lheLzLuBTW1W
         ibY0NioKSubeBKIV+oCmNewd7hI/SCoUxeVXqKna3roe1cajjFrrQS43AfLkPz5P8OmJ
         Y2Z86jjg0qZcAndYwtVHYfU9uY99UmCbx3RKWRlHe7mfdpSZubM/ChnsbSV3GPqSD3f6
         1lS+bKGNruulbeiVDYOiJHM5C0x60Ai2aLIWctBSS5Lz0jWwXie5x6XVd4ErnDbP120+
         5w8K4U6Z2ZhhKCzjDrrGsatyuZL03bgvoNgj+pNdYxBJMcsn8tO0EOsl4V9J+o3W0/5u
         s2Pw==
X-Forwarded-Encrypted: i=1; AL+hErGAoTi9WWz8Ki6vpYoolFcs61oDBTyjEBBcUYX1xpvgtgY3KjkvtxqEE4tEie1JsVoPr/5KO/kW6PcBj2Xc/jE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0Lyz7DyQTA9wEWYJ/o3atbRlvaq+7lgTe/OJJxNqmQTlp8/Mb
	0Si+6C/fj3JJZ8KmEH1NVaJjtTLPQJSwhqoaWlmMoXdzmHdhX3WArV80PRAsEEXc
X-Gm-Gg: AZFdTZdwkOmIr50EaiPz9FnJYBbVfjpETgJCFL1SxxXSeN1pX4yWpEs4oumvrKZvq48
	hsV3/qEDhnll0PadodO1EGjhKtdrr8ufIc5li2KVN4hO/+l9bgaALwFmJc+Fa8a07TWvSV04rd0
	ttigjTl8AGmN9+S/YolHuJbfO+fTotBq2+dvmXo5tzhuSgamge52t0r5K5Shh9Mi3pj1amu/tIE
	CwbBtGZNXRvnowwM8L9X21fhtUMP20Qw94JJOKHSjnWsxCwDsPc6QKrGOyjDse9ZlAZfK2jZrZo
	DkSr9nilj6eTQEtWeAMIBiH4zmV3gar4T+D8DdfjMeftnxHkcgTkr0s6vmJV9DEug9650fPfVnc
	3bFs6c38C7kksHLjuABEDq2Av+iLJON/EKNILhncRCqTpTZo3LTHrhcPYDty76nsrVLviI8Vyd9
	/NPYlMoHe2qPZaHlwwR0xFe6gd0Nfg6k5NEfwvBZLiqHYWLpBYmeFISSPeDY7mx7yauG2QhxE5z
	ICvIfLm2DBlA11bN2Xkx69x2Sa6giqmYTUdEfOz0oSyLk8YzA9QnV0IiXBBLlSp3FXzMs2nFs+7
	lJyBZKrfwEvNMLXaemhlvNMx2J54GReAO1IYjZMSM/uQM0suqg==
X-Received: by 2002:a05:7301:e0c8:b0:376:5b99:a816 with SMTP id 5a478bee46e88-3827d71efffmr5784100eec.3.1795099370298;
        Thu, 19 Nov 2026 06:42:50 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6fe733dsm16682848eec.16.2026.11.19.06.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:42:49 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Gwanhyun Lee <gwanhyunlee@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v3 0/4] tun, tap: bound vnet header and skb copy lengths
Date: Thu, 19 Nov 2026 23:42:35 +0900
Message-ID: <20261119144241.360238-1-graypanda.inzag@gmail.com>
X-Mailer: git-send-email 2.43.0
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

There are two independent length mismatches in tun and tap TX paths.
Since v6.15, __tun_vnet_hdr_get() has compared hdr_len with an iterator
count that still includes configured virtio header padding. A 512-byte
header, hdr_len of 256, and a 14-byte Ethernet frame pass that check
even though only 14 payload bytes remain after the padding is skipped.
Commit 2506251e81d1 ("tun: Decouple vnet handling") introduced this
ordering for tun. Commit 6a53fc5a8770 ("tap: Use tun's vnet-related
code") brought the common parser into tap.

An older zero-copy issue also affects both drivers when hdr_len is zero.
With a 246-byte padded header and a 14-byte frame, the full 260-byte
vhost descriptor crosses its 256-byte zero-copy threshold. The drivers
choose GOODCOPY_LEN (128) without limiting it to the remaining frame,
allowing an skb to carry uncopied bytes. Commit 97bc3633bec7
("macvtap: macvtapTX zero-copy support") added the tap calculation.
Commit 0690899b4d45 ("tun: experimental zero copy tx support") added
the matching tun path.

Patch 1 validates hdr_len after skipping padding. Patches 2 and 3 bound
the zero-copy skb head to the remaining payload in tap and tun. Patch 4
adds direct-write regression tests for both drivers.

Clamping keeps valid short frames on the zero-copy completion path.
A normal-copy fallback would complete the vhost ubuf_info with failure
and increase tx_zcopy_err. Without packet-socket listeners, 401 short
frames completed without raising that counter.

Changes since v2:
- Separate the v6.15 header validation regression from the older
  GOODCOPY_LEN issue and fix the shared parser.
- Add the matching tun zero-copy fix and tun/macvtap selftests.
- Retain the tap copylen clamp, with its original macvtap Fixes tag.

An AI coding assistant assisted with analysis, code and reproducer
preparation. In x86-64 QEMU/vhost-net, both drivers now deliver only
14 bytes for the short-frame case and reject the oversized hdr_len
case with -EINVAL. The patched kernel passed all 105 tun and five tap
selftests.

---
v2: https://lore.kernel.org/netdev/20261118120102.3717000-1-graypanda.inzag@gmail.com/
v1: https://lore.kernel.org/netdev/20261113164903.785381-1-graypanda.inzag@gmail.com/

Junyoung Jang (4):
  net: tun_vnet: validate hdr_len after skipping header padding
  tap: clamp zero-copy copylen to remaining payload length
  tun: clamp zero-copy copylen to remaining payload length
  selftests: net: check padded vnet hdr_len in tun and tap

 drivers/net/tap.c                 |  2 ++
 drivers/net/tun.c                 |  1 +
 drivers/net/tun_vnet.h            |  3 +--
 tools/testing/selftests/net/tap.c | 29 +++++++++++++++++++++++++++++
 tools/testing/selftests/net/tun.c | 31 +++++++++++++++++++++++++++++++
 5 files changed, 64 insertions(+), 2 deletions(-)


base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
-- 
2.43.0


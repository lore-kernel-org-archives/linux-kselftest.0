Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF99C421256
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 17:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784740722; cv=none; b=neU50KDLykkENHlUrapJ/ZpUDzE867bwQQX5+zowBYmXncUEx2Oqp2mLFbz/Li8cAiRtHrBOxrlM6bwxcQkxN3Te/S8rxx5IkSzfK+Qo+XDW+UzxWqJ5MfLVVY0qsfeSnqpHri1Z89cVoG/dHieYdOgjJkdt8mCBhizvGWVJsko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784740722; c=relaxed/simple;
	bh=b8CCsYCtDOYU26UmOXYfPWeXYM9IX3RZvDTKFaNCI8w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pIA5u67h2d+DvnFmC2O/JBS6AfDBUPUCwoTgs1IprgYwGIU/8jLmRMr+ZXG5NqWi2tYv8q6jvHabOE5COAR7lW4Wj5Xcl4Y7R1/OZtEI4MiDmHPg+QBfvp3CU8Lb9nvGQbvl03HVLnhPePSSZmcJAdM+OeeZj2ZyXaF/IPi1uJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Es0PRDyO; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Es0PRDyO"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47df6a5655aso620f8f.1
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 10:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784740719; x=1785345519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bJUeIBpQyzF7bWbhXrSbCIm7FpIohhGg0Yle0Q6BI7w=;
        b=Es0PRDyO7GLZWHWORq/wlAleeCjJe9zr1XXbLS8RaTGLN+V0V2Mq2hoiQp09red61z
         +TJQyrNm2Ec0uecOJtBvaYcgk1Z9ECk4YH41IV6lrSChLrlbusMV0wol/9hId0w+6H88
         NQomZ+iQEsKqG0H4qKdn0SaL8fkddaa2Q3Zek7D8kXOD/PQI6Lh4OA879ew80UwZ2jAK
         kFu0YRbPc4+YZ2Q+Py2ecjsknF8My6egovQrObHGHnUj7kh9DTGF9v7YGHfmodjw0sJJ
         oM7hCtuJGBCqnIpQF5NZqChiYroBrPKdOcvSwazm42O1ZpN3zq//P3BweC+6CFee2kMl
         VyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784740719; x=1785345519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bJUeIBpQyzF7bWbhXrSbCIm7FpIohhGg0Yle0Q6BI7w=;
        b=kmq9Qf8Gjs8AQ1r1YYMQzy8alIbHXyyH94D2IHm5W0sCYZk2yHLi/v0P7i4e9K4X42
         E77yU//O/XPcuCbDf0a7o7lsdgI7NZtuqDrnAHZv/rmHDfyoMIVz9hssAHKz2Qg5n2qA
         eBZZpoxDO0u8YpI+VoHJTXcYz1o835PLxoemElCFQyFiz/cZbbMPvzW/zcvR7j5bYniT
         39Zwu7hmZB7kGU5Z1ofY5Xx6ALhsryu0gNLPPz88zaJA1+uftbuQ7nTdRywIt86/0hF7
         SLZ+u5ZOgNf/hEnOcDrmzcnOd57ArrQxOwO1ofIJ0LhohRfYLefgumiZOGtKRgsIUnLH
         n+Iw==
X-Forwarded-Encrypted: i=1; AHgh+Ro3pgHvOFXnj1S/ET/iXyCBDEOXgtwOuowc4hYc6kbprdBGbmRaolObe8ssMvvY6sh3lJFVg5+4N6CRlPM5VqA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyafMNRzSGCJz9gp5JvWPNZYabvlD7dlfdOC3HIX73J4MN+r0LC
	I024gtqRJKs1EtertL8MI676+u/OJulitBQrZOZPlWpJ5bimKPsuTf4p
X-Gm-Gg: AR+sD11pXznhpW6gLHJIspjtyeBw67qEnCopEG2BhbwzLhmeDZxCv61ZGwxXre8BFN6
	KBAPtPxLlExxt3h1y1bBbmjUBo6JROPR3oXdNsyARIxiZQybu1uCR8pyRNYcMva1f5Una+RfNAP
	2baPnZNG1rwyATiN1MlNVQEZOPByXdlTFTdhm6jzJSknGrXRihi07XN1rcvyFJ39RCYp+oYzcp0
	j7FsJGb5W4+f6t2W9MGYrywZJyFUsWeNkdz0606WGLgpuLRZ6X9m0+sOy+2tnmkqfqBM5uo4spx
	t7o4QHulSbEuPrbdWWvtkft1zJwvROlXhJl6Qz4C6oo8ttNmOcF6IhZ4voB2mQOIb6Oj2HxHTof
	3ubHDuEW4CWvNJ5tUqiKIjIAsaII/OZ70QYFMXMC8FfSMuWfG5QkXQLGK4+PK7enNCOV16PhPnW
	i4efWkLLB/jDQDcUXCcD2P2Q7ZP/7x26pWK8X9gBofkO43lwv8AWGmAMOgoHGsE0hfHmIMmE3Uo
	7VliuZcut3WohdyL6Rfgzjf518eRVsiHpW13Q==
X-Received: by 2002:a05:600c:46ce:b0:492:4a7a:e415 with SMTP id 5b1f17b1804b1-4956afc80f8mr29986135e9.2.1784740718717;
        Wed, 22 Jul 2026 10:18:38 -0700 (PDT)
Received: from L-022584.energy.envision.com (dynamic-078-051-150-230.78.51.pool.telefonica.de. [78.51.150.230])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a634cf9sm92427615e9.9.2026.07.22.10.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:18:38 -0700 (PDT)
From: Xin Xie <xiexinet@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	qingfang.deng@linux.dev,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xin Xie <xiexinet@gmail.com>
Subject: [RESEND PATCH net 0/4] net: hsr: fix GRO/GSO super-packet handling
Date: Wed, 22 Jul 2026 19:18:32 +0200
Message-ID: <20260722171836.196-1-xiexinet@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[resend: the previous cover letter was silently dropped by the
sender's mail provider after SMTP acceptance; the four patches
themselves are byte-identical.]

HSR/PRP forward frames one by one: each wire frame gets its own tag
or RCT and sequence number, and duplicate discard is per frame. Two
aggregation mechanisms break that per-frame assumption:

* On RX, a lower device that aggregates frames into a GRO
  super-packet feeds the HSR receive and forward paths something
  they cannot handle: frames are dropped, and on memory-constrained
  devices processing super-skbs in softirq context also pressures
  atomic allocation.

* At the forward entry, a GSO super-packet (locally generated on
  the master, or delivered intact by software NICs such as veth)
  would be tagged and forwarded as a single frame, violating
  per-frame wire semantics.

Patch 1 adds netif_disable_gro() and dev_disable_gro() alongside
the existing LRO helpers.  HSR calls the public wrapper at
enslavement time, while the networking core handles the generic
feature update and recursive lower-device traversal. Enslavement to
an HSR/PRP master therefore strips NETIF_F_GRO and NETIF_F_GRO_HW
on the lower device.

Patch 2 is a preparatory locking change with forwarding semantics
unchanged: it shrinks hsr->seqnr_lock from whole hsr_forward_skb()
calls to the individual sequence counter updates, so that the
segmentation work of patch 3 (per-segment allocation, checksums and
forwarding) never runs with BH disabled under the global sequence
lock. Patch 3 depends on patch 2; please keep them together for
stable.

Patch 3 unfolds the remaining GSO super-packets at the forward
entry with the top-level GSO dispatch (__skb_gso_segment()), so
each wire frame still gets its own tag and sequence number.
Segmentation is offered only for ingress roles whose frames are
known to be plain Ethernet: the master (locally generated) and the
interlink (SAN side, untagged). A super-packet from a LAN slave may
carry per-frame HSR tags or PRP RCT trailers that software
segmentation cannot recover, and an already-tagged HSR/PRP
super-packet violates per-frame wire semantics; both are rejected
by ingress-port policy. The HSR master also stops advertising
NETIF_F_GSO_MASK so locally generated traffic is segmented as
early as possible.

Patch 4 adds a kselftest covering the above: GRO disabled on
enslaved devices, no GSO/TSO advertised by the HSR master, and a
TCP stream from a TSO-enabled SAN through an HSR DUT completing
with zero retransmits.

Validation:
* build: W=1 allmodconfig and allyesconfig, base vs patched - no
  new warnings.
* selftests: hsr_gro_superpacket (new), hsr_ping, prp_ping and
  hsr_redbox pass on QEMU x86_64 and on physical igb lower devices.
* functional: SAN TSO streams unfold per-frame with zero
  retransmits (IPv4, IPv6, VLAN); LAN-slave and GRO-merged
  super-packets are dropped by policy; master/interlink concurrency
  under PROVE_LOCKING is clean.
* physical igb lower devices: GRO stripped at enslavement;
  force-enabled generic GRO super-packets unfold at line rate with
  a clean dmesg.

Xin Xie (4):
  net: hsr: fix packet drops caused by GRO superpackets
  net: hsr: shrink seqnr_lock to sequence counter updates
  net: hsr: unfold GSO super-packets at the forward entry
  selftests: net: hsr: add GRO super-packet forwarding test

 include/linux/netdevice.h                     |   2 +
 net/core/dev.c                                |  18 ++
 net/core/dev_api.c                            |  16 ++
 net/hsr/hsr_device.c                          |  17 +-
 net/hsr/hsr_forward.c                         |  53 +++-
 net/hsr/hsr_slave.c                           |  12 +-
 tools/testing/selftests/net/hsr/Makefile      |   1 +
 .../selftests/net/hsr/hsr_gro_superpacket.sh  | 249 ++++++++++++++++++
 8 files changed, 344 insertions(+), 24 deletions(-)
 create mode 100755 tools/testing/selftests/net/hsr/hsr_gro_superpacket.sh


base-commit: ba712ecfd942b68b21a4b0a5daaf72f6616cc66d
-- 
2.43.0


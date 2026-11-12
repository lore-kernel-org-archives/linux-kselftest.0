Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794497618;
	b=R9bc5tKoZgMxyXqcMdljX3ZiS3ziFtUb06gtXxSye1yeBOWmhETwKnDQQEGEDbJLwuYO
	 N+TF1CvQtX/mm5PuggDtv+iTUICdJxwkllQ5Lbd4+q1GHfDjzf9491aswd8wL0SjR15u2
	 sTEj0m70b6jhGFT6qUbt+0mbaemTGZjCYb5sTF4hCr2o1KbfST2C1aLL3DMFc81tnJtqV
	 8HdIHz8M5lz1qSvXYbZ39mmBMd0yB/Y5o6fBx6Ch4gtzesHruI72G+CyzQl3exs7jhobv
	 oRQAELQ6eLB+DEbaWCYPzF88iIzzCVHmXP3NSvWPpTjgWs2LTbp8oVUyDtF+F9u8Fzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794497618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rEhQI3hSOE9lI+wJjJwvBECQfjSinYgfuJ/QdhixFTY=;
	b=0MJ/FI7QF7eZeKKr6hzo4lf8rXzA2BKTWCuj0k+DovROSgnfT2BlqoVBrl3BkrFEq60r
	 f6e/6ij/YrOL5qOB7S+QXHXBOpXkVCMMq8D9rxfOed50GNICWkWhNT+7cQEOg9RX5I/HP
	 cvGe8/iFElQQTvPl1rljZ0fJdl3833xi2LhT/77YMlQlCGN6MEUFLx9MgRYaHeGVck1jf
	 ABHk1TLryXRSf8T9mxxf4ozIGBMmZ/73JOFjKCqOlDWjgUuh3Cf01tZM6lOAg3urCDbeU
	 htN6wiv5r0SPkUAcFYcQq229opLl75QHfG4RNmmRWclNrGck+inkkcU5GQI0ux6POUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jMLMrqdr;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F103D606A32A
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 15:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F103D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jMLMrqdr
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2119feee8so1582225e9.3
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 07:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794497616; x=1795102416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rEhQI3hSOE9lI+wJjJwvBECQfjSinYgfuJ/QdhixFTY=;
        b=jMLMrqdrw+sf9VotlU3FcMTa96S3NZy1TCicumpr6ODmSsTZMyuvA+ILiUWWR1qRuF
         373uxwLJPAZENG6ysZRpyusJXuNW4CIuQ4h2/3GhBk7ZtY+Hqi2dmnQNVz18cEFgXz0n
         dS+CM5qBPG67oWoVh0tYOSRNbX2SxhCYWKfdgh5C2ItnfNZyBS3Lt/CNfq16WvWWCh2p
         6/fc16B6JIsFxXluBO+yC/AAVXPpkzbarh1WPa160M8tyNgSjZAuBLcec4orXcd7L8Np
         H5/MO5WwkylQHs2n13Gs5celfVKXmvV8NJUwwnTNMw0qe6jGa3mXHSekqwRMeS/V90yI
         mlmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794497616; x=1795102416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rEhQI3hSOE9lI+wJjJwvBECQfjSinYgfuJ/QdhixFTY=;
        b=y1epUV5nd9ZDyvCZzw4kmJK1R3HXSiR5JUuZbEff5i4wf+9PC6WMNgDf3/5Vrf9P+V
         cGJkvUBQH7lePbcIcfGDt0XLhpGZGddkRI4W2suaIURzSb60F+Xblu35COYu8R2H+cyI
         x3/BllITdesQk27eFpl3mX1naw5JbFXoKhICT364DS+ReyV+aiKaJeAUvXsXf/eK2j91
         MyT7PDuIx7YpLn8N3lXmpq7EuJQ9nu+ow0xpk5nz3zBiwVQnfOjDiBGMSAf/2tHV2p08
         aXcUwY2apaP3WBR7T3iEPtJk26ey1cPGHh3EYiOXV6E6ZXygNilkOa/zzlg6K6LD+tF7
         5Kmg==
X-Forwarded-Encrypted: i=1; AL+hErE0TOpIG8NXgFccjJN6DjoT7No9FRXBp2JKM3KzttR8yUgrh6gFqYCaieOUw1eM0AxHCcusdQSSLtc+neWMfeo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bubmKsxrIKOqyKtkM2EBVMpSdOV4XFqCMYzFqHD9P0p+K3tS1
	cvjDPY6gGv//K6jrlUToZmHzSfzF0NY6mauq4OrmX4xeLAeMBjLFwAXj
X-Gm-Gg: AYBFou3ToNcwUtkY0e3YmZDMuNvII23TzA1bbr+PC1YqHS2KkyFLsDptosE8EpUUEuu
	Ny7PUPtQx9XGFfy2mmU1uuXba0c7gfe4IPR2enc+Pn+tfh+YJaTnKBjBe4W2GZwVkafpaTAziiz
	8WIsDiAcTtsngNNHetGm9NVKPiKhD0+mAXX3FyXjuGp3PKH3rfNuPqnajIaX8DU9A8gmhGbhSn8
	wvFOGIdmYHsRVCDsp63EOFXi2Vl2oo8bMIVZwmihGVtnIvBBr+NUrhwp8SlbydPwTlk3xzb9iis
	qmh/JDykrVIkgT+y1EKyOIUKyZyoxg3JDMbrYeNKob/1XJEyIwOUsA7Ze0fgRYHShsOUea7ckPT
	8iY7YHMv+TOa3WFm2mZcLz2zarTQBd9WxqRWFu8B3hZC+G/xMEwYdNd/pgOJHxRvapG925ro5g5
	4AVnIAxwyIVSnIC8SL3xjl3dNkHlayNfnwHjGzdLym6kbZQQqqCslePAWUVm0SaksY1/YpMrXcx
	oBY3oezdWIy0283mGlzisiWXYaNmCo8ONnU8xRWkOPIu5UDsfoEBdoqLDnMGGPNH+oyRkneihN/
	k2oJQDMS++zvHk7J2gwAukr4HHspZuFk0AX9vp3gVGxcBLiAzNo822AVuDlKgaEkLqig9h5g8m1
	rEezSTpBxZZ94kUy4ASROfkjPjHAmHlv3dfiNM1wcdWPo3AfT9uwqaBnDaLNg0/0=
X-Received: by 2002:a05:600d:8448:b0:4b6:2242:d0be with SMTP id 5b1f17b1804b1-4ba091a5d00mr85202145e9.0.1794497616053;
        Thu, 12 Nov 2026 07:33:36 -0800 (PST)
Received: from L-022584.energy.envision.com (dynamic-093-130-172-139.93.130.pool.telefonica.de. [93.130.172.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08ddbe68sm229331185e9.0.2026.11.12.07.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:33:35 -0800 (PST)
From: Xin Xie <xiexinet@gmail.com>
To: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	shuah@kernel.org,
	kees@kernel.org,
	petr.wozniak@gmail.com,
	qingfang.deng@linux.dev,
	fmaurer@redhat.com,
	luka.gejak@linux.dev,
	bigeasy@linutronix.de,
	xiaoliang.yang_1@nxp.com,
	skhawaja@google.com,
	liuhangbin@gmail.com,
	stable@vger.kernel.org,
	sdf.kernel@gmail.com,
	xiexinet@gmail.com,
	lukma@denx.de,
	fmancera@suse.de,
	danishanwar@ti.com
Subject: [PATCH net v9 0/4] net: hsr: fix super-packet forwarding
Date: Thu, 12 Nov 2026 16:33:29 +0100
Message-ID: <20261112153333.20-1-xiexinet@gmail.com>
X-Mailer: git-send-email 2.47.3
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

HSR and PRP tag, number and de-duplicate each frame on the wire. GRO
and GSO can hand them one skb holding several frames, which the lower
device then drops or which goes out with a single tag or RCT and
sequence number.

Patch 1 keeps software GRO off on HSR/PRP ports. GRO_HW that the
driver keeps on is left alone.

Patch 2 refuses bridge, bond, team and OVS masters as ports, a macvlan
or MACsec device on top of a bridge, bond, team or HSR/PRP master, and
devices that already have a master or cannot take an RX handler.
This fixes the syzbot recursive seqnr_lock report, as Sebastian
suggested [1].

A port check cannot catch every path back into an HSR master, such
as a tc/BPF redirect or a tunnel; those still nest the lock and can
deadlock on the same device. Fixing them without dropping traffic
needs seqnr_lock released before the port transmit, which can reorder
frames for receivers without aae9d6b616b5 ("hsr: Implement more robust
duplicate discard for HSR"). That is left to net-next, where Hangbin's
patch [2] fits. He dropped it in favor of this series [3]; as this
series no longer narrows seqnr_lock, it can go ahead there.

Patch 3 segments GSO skbs before per-frame processing, outside
seqnr_lock. GSO reaches an HSR/PRP port even with GRO off, typically
from a container attached to a PRP RedBox interlink through veth:

  container/netns                  host PRP RedBox
  prp0-peer ---- veth ---- prp0-int (interlink RX)
                                  |
                           split GSO into frames
                                  |
                           sequence number + RCT
                              /          \
                           LAN A        LAN B

Some old Linux PRP senders put one RCT on a whole GSO skb; patch 3
drops such aggregates when it can detect them. With GRO_HW off on
virtio-net, the host may segment them first and the RCT arrives as
payload; upgrade the sender or disable GSO and TSO on its HSR/PRP
master.

Patch 4 adds selftests.

Tested on a lockdep kernel: the new selftests (also with Python 3.9)
and the existing hsr selftests pass, and the syzbot reproducer no
longer reports recursive locking. No new W=1 warnings.

No stable backport is requested. The remaining HSR dev->stats races
are left to a separate series, as Paolo suggested [4].

Based on net 30c71476d842; also applies to net-next. Patch 3
conflicts with Sebastian's pending net-next series [5]; its notes give
the resolution.

Changes since v8:
- Patch 1: the message and comments say which ports the rule covers.
- Patch 2: macvlan and MACsec are refused only on top of a bridge,
  bond, team or HSR/PRP master; all ports are checked before any is
  changed.
- Patch 3: copy a head shared with a clone before segmenting.
- Patch 4: no fixed sleep, no need for iproute2 to print the HSR
  version, new refusal cases.

[1] https://lore.kernel.org/netdev/20261014151838.6RyMIRVM@linutronix.de/
[2] https://lore.kernel.org/netdev/20260805-hsr_deadlock-v1-1-d8a6f06fc5a8@kylinos.cn/
[3] https://lore.kernel.org/netdev/anXnxn-PBv8qH6VB@fedora/
[4] https://lore.kernel.org/netdev/4fc3b9f1-4bef-4b34-ae7a-e89037cce829@redhat.com/
[5] https://lore.kernel.org/netdev/20261104-hsr_ptp-v10-0-2c4a38ad973c@linutronix.de/

v8: https://lore.kernel.org/netdev/20261107220544.20-1-xiexinet@gmail.com/
v7: https://lore.kernel.org/netdev/20261009201324.17-1-xiexinet@gmail.com/
v6: https://lore.kernel.org/netdev/20260809121455.1745-1-xiexinet@gmail.com/
v5: https://lore.kernel.org/netdev/20260807140751.1351-1-xiexinet@gmail.com/
v4: https://lore.kernel.org/netdev/20260803222211.877-1-xiexinet@gmail.com/
v3: https://lore.kernel.org/netdev/20260731090224.18-1-xiexinet@gmail.com/
v2: https://lore.kernel.org/netdev/20260724161253.79-1-xiexinet@gmail.com/
v1: https://lore.kernel.org/netdev/20260722171836.196-1-xiexinet@gmail.com/

Xin Xie (4):
  net: hsr: keep GRO disabled on HSR/PRP ports
  net: hsr: refuse forwarding devices as HSR/PRP ports
  net: hsr: segment GSO before per-frame forwarding
  selftests: net: hsr: verify GRO policy and ordered forwarding

 .../networking/net_cachelines/net_device.rst  |    1 +
 include/linux/netdevice.h                     |    8 +
 net/core/dev.c                                |   15 +
 net/hsr/hsr_device.c                          |   13 +-
 net/hsr/hsr_forward.c                         |  158 ++
 net/hsr/hsr_forward.h                         |    1 +
 net/hsr/hsr_slave.c                           |  145 +-
 net/hsr/hsr_slave.h                           |    2 +
 tools/testing/selftests/net/hsr/Makefile      |    7 +-
 tools/testing/selftests/net/hsr/config        |   10 +
 .../selftests/net/hsr/hsr_gro_superpacket.py  | 1456 +++++++++++++++++
 .../selftests/net/hsr/hsr_gro_superpacket.sh  |    9 +
 .../net/hsr/hsr_ordered_forwarding.sh         |    9 +
 13 files changed, 1819 insertions(+), 15 deletions(-)
 create mode 100755 tools/testing/selftests/net/hsr/hsr_gro_superpacket.py
 create mode 100755 tools/testing/selftests/net/hsr/hsr_gro_superpacket.sh
 create mode 100755 tools/testing/selftests/net/hsr/hsr_ordered_forwarding.sh


base-commit: 30c71476d842b094651bd7712f6c8ee8716147d0
-- 
2.53.0


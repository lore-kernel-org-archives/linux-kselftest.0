Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794329159;
	b=nEBTiXCoG1kYHRtH/jgxZddp+VAGRDe+/44YqjBgsCYk69GkPSCLeRVAP/Aphw2LGzYD
	 AEWVaac2jWx6t9aZDlI380/7aJbKK5mbaJiWsM0jsKYuC0RiO9KF3SPxHl6DQPQkpouH9
	 aFl8MjzgSs8Kz0QTw+5g5wu5dE1juB2VXoJKjyWQPPQVZViQ8tYJhQL7CGlWXy2GYWT0d
	 vvldLyAFB8vAOEV7W/iLgkuhvkWivrgpu57Ob1ywOEMHonSCJbTZ8QcYicmOtAXENHK4T
	 2+tCzrqXQP8FlfdFFtVM/TmF+hnZt2jVmJleRv60JJjz67vhdgk+BHam+tIY43qLTVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329159;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=YL5rvPeWgdtgxKkSXVH+nC1prTpxjjKTC0/EqHiPQao=;
	b=XMEyRcG2Wo3vSZTqVFquxmKqxOPd7T9xnSvHMNAeN/6eW7nUIZxsjNJASTlpXl+KCM/Q
	 A9ERXtLT9MJue67rVH1ibYb7gxk9RZuDBcwymvn7SjB+ot4/y9B5r8vBrpLAuRBBkNr9v
	 G46nzEfQyOJGw+MUaYOl9UcwRnTrpgfPof2SzATmKU63bYZG02YgIXi7ik5IldUNb7Dr5
	 tG7aSMANoGbL7MiHPEsvjkjuX4hBF0DDj3EhPSYZaNmFFoqxu+POHNctTPdZnw44rDUJm
	 LzIOaxBxyYdwcgaRwDxKTlFQM1I2ohi2Nd8702eb1YWOuLb1Y/wTl7sfBnybY3eR2vA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hweGCaLe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A16606A323;
	Tue, 10 Nov 2026 16:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hweGCaLe
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794329159;
	b=KZ8kRE7hZ1HlXg3JicJi/JaLqU0Cf9QEYRPYLrDSiedFw/hP6GF6q46w9r+lV+KBJeB/
	 EtzSA2yerqbRc/6XogLNY8tQGV7ZeLeFesVULTvo0cTefjquKW0Vf5BXTj4vDGEoGfXEB
	 sNGCbIZBjT2xh2IGOlUk+6mZe9Em+upwDiEnoNXI2YqymWQw31wfjumbNYkGcJ2zZdzjn
	 Q0ZFHq9j5Lw91ieii95UGTP+4x72Snfm0jMjbkIkjtG720Sk7Ar6RiFNcQqjyLinXv5qY
	 AOW95TBt5WuB/7yktxf2kz6QlaJSVURw6XNhb7GPEcoFh+m2Kof8rPE7XUSxuYLPkuA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794329159;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=YL5rvPeWgdtgxKkSXVH+nC1prTpxjjKTC0/EqHiPQao=;
	b=pUSSbuPd7xildgj6XdF/kx4xZ7/nOygjQ/CPVq7P2lmp6Yb7Ko43lPBywH6iUrCMleT2
	 iOfWiCSRRPGgqJ/d+CbbTbqq0lyCNf2TN0xTxpJZXADI+ENfU1zXCpNrMH2AI4RDnw6ip
	 xZ3RQdYqXfN/ptMnJF39dXNWJg0FfoK82JATo+wQquv32NxiOAUPR/NhykuTI6jKhmfQH
	 pAs7htIyZEmgAFQTsLLMvO9nvH0aIBmwRRHKpT1kdy8kfq9xPdSPNOZq3FZI+LZQCCg93
	 UXTiNaqU8t7xzKOIo71KEZtVcaJrAjCTDu53rS7xsCSmsoTiIS64wciChGx6zTU7+rw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5D5191F008A1;
	Tue, 10 Nov 2026 16:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794329159;
	bh=YL5rvPeWgdtgxKkSXVH+nC1prTpxjjKTC0/EqHiPQao=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=hweGCaLetWRFycg7ndIJFS/3JWZWZz1B7JxvMUc2Qs4Qsh+bhECkafLP2cGFlGUc5
	 MWu5VPHTE2dribV2suG8TikgyTePuhz7kY1KCH+M9tx4O0LRO/CINZLx3pYbhdBopn
	 zrObvGY2CUcqi3LQFK77lwppPoGqY2bSbsTBQe7JkUDVu4e/aQgPQENunzIstWwL02
	 OrU2sr17Eye3D7i0qeat+IBh0RgiIPKjhBaWtfYyqN/QpChbph4aIMJn33cYS9Y6t6
	 LEn4CFKFYPSsPdw26W5OViHOxHvS2ltalJJEo7I1FM5Gw7mU6Y3YVlGhkLAWDXJfvK
	 ujgb+Q11i/lOQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B125848BF8;
	Tue, 10 Nov 2026 16:45:57 +0000 (UTC)
From: Yongjian Wang via B4 Relay <devnull+echoowall.gmail.com@kernel.org>
Subject: [PATCH net-next v4 0/4] tcp: fix tcp_base_mss on passive
 connections and test MTU probing
Date: Wed, 11 Nov 2026 00:45:54 +0800
Message-Id: <20261111-mtu-probing-series-v4-0-6f2e484ca8ea@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEJK82oC/33PywqDMBAF0F+RrJuSh8+u+h+li8SMmlKjJFEs4
 r836kaKdDnM3HOZGTmwGhy6RTOyMGqnOxOG+BKhshGmBqxVmBEjLKWUcNz6Afe2k9rUeM9ikWe
 SF5WSoCoUgr2FSk8b+kAGPDYwefTcN26QLyj9aq63jXa+s5+tf6Rb4l/VSDHBguWkgIwlQoh73
 Qr9vpZduxWM7EjkpwQLBE8SlcYFKbmSvwQ/EJScEjwQKnwrJFsdeiSWZfkCoAZjh1YBAAA=
X-Change-ID: 20261103-mtu-probing-series-a87b39fdbedf
To: pabeni@redhat.com, kuba@kernel.org, shuah@kernel.org, 
 edumazet@kernel.org, horms@kernel.org, kuniyu@google.com, 
 ncardwell@google.com, davem@davemloft.net
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 netdev@vger.kernel.org, panweiping3@gmail.com, 
 Yongjian Wang <echoowall@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794329156; l=2591;
 i=echoowall@gmail.com; s=20261026; h=from:subject:message-id;
 bh=S4Re5/ONNr+x1/wp/J9VFbiypqePCo68XyhS83zfVnY=;
 b=Lk/TrL3KGYJaH2dJNyRWBnpDgGzuq5SFRj8zqIqYznmEVK7sdELtgaazUWLNjBKn4bwkFCi4j
 HB2kwLyICT7BVDFBm+U2z5+1Hb/k7qKi/yTbKvxWJ31Gk5lNinQy6Hm
X-Developer-Key: i=echoowall@gmail.com; a=ed25519;
 pk=9XP6JhqjjPsHCF6UZZZTeqTRnXIa4+ufggnxXtTJ+no=
X-Endpoint-Received: by B4 Relay for echoowall@gmail.com/20261026 with
 auth_id=1323
X-Original-From: Yongjian Wang <echoowall@gmail.com>
Reply-To: echoowall@gmail.com

With tcp_mtu_probing=2, passive TCP connections can start at the full
MSS because they sync MSS before initializing MTU probing. Patch 1
moves initialization next to the existing MSS sync in the passive
paths and in the active SYN-ACK path. Patch 2 adds a regression test.

Patches 3 and 4 add coverage for black hole detection and the MTU
search on active connections.

On x86_64 KVM, the revised MTU search test passed in IPv4, IPv6 and
IPv4-mapped IPv6 with patch 1 applied. Without patch 1, it failed in
all three modes. The first TSO packet carried 2072 bytes of TCP
payload, and the test expected 2048.

---
Changes in v4:
- Rename the existing black hole test to show its non-default settings.
- Add a black hole test that only sets tcp_mtu_probing=1 (Neal, patch 3).
- Link to v3: https://lore.kernel.org/r/20261110-mtu-probing-series-v3-0-dedfab25d641@gmail.com

Changes in v3:
- Document how the passive MSS issue was discovered (patch 1).
- Let the SYN offer timestamps in the MTU search test so it also
  covers the active-open change in patch 1 (Neal, patch 4).
- Link to v2: https://lore.kernel.org/r/20261108-mtu-probing-series-v2-0-355d6490c3db@gmail.com

Changes in v2:
- Move tcp_mtup_init() before the existing MSS sync in IPv4 and IPv6
  passive opens and in the active SYN-ACK path. Remove the late
  initialization from tcp_init_transfer() (Kuniyuki and Neal).
- Keep the three packetdrill patches unchanged.
- Link to v1: https://lore.kernel.org/netdev/20261103-mtu-probing-series-v1-0-a2809e725aaa@gmail.com/

---
Yongjian Wang (4):
      tcp: initialize MTU probing before syncing MSS at connection setup
      selftests/net: packetdrill: test tcp_base_mss on passive connections
      selftests/net: packetdrill: add TCP black hole detection tests
      selftests/net: packetdrill: add TCP MTU probing test

 net/ipv4/tcp_input.c                               |  2 +-
 net/ipv4/tcp_ipv4.c                                |  1 +
 net/ipv6/tcp_ipv6.c                                |  1 +
 .../net/packetdrill/tcp_mtu_probing_blackhole.pkt  | 38 ++++++++++++++++++++
 ..._mtu_probing_blackhole_no_tlp_retries1_is_1.pkt | 38 ++++++++++++++++++++
 .../net/packetdrill/tcp_mtu_probing_passive.pkt    | 27 ++++++++++++++
 .../net/packetdrill/tcp_mtu_probing_search.pkt     | 42 ++++++++++++++++++++++
 7 files changed, 148 insertions(+), 1 deletion(-)
---
base-commit: fa5196392691051963726787944db872420dfa75
change-id: 20261103-mtu-probing-series-a87b39fdbedf

Best regards,
--  
Yongjian Wang <echoowall@gmail.com>



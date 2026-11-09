Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794242678;
	b=YKUBJBwL0qZL155bVtggSqKBrEowwIsgz1/nBBmmj3tGamwCJtzzm2FDbvAkCyXqWwS5
	 Lh9acx/WLxD0YonTUdXMwnOyIFSb/ii5OPBYU85cD4RKEyo5y1cy0uFALFOS0u+NCuFmS
	 tQxnza3wHeBr/Y4anEQkr2dhSJURzslBUt8/+rwfUKWgyLJka3cGU3amowRfKQsswdpuS
	 pgRkodq7OvIosd+rP1lmsb5+C1GtFnqFQKtP4guayZGsHDVMQH32D1JeoFYAoUYNa/FGQ
	 MVjzSIqD1hDpGjBr8iiwbgE8lxOhnmri8F6O7J41T+0eR3AqMfBLV3kVoNUMwvvs9GQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242678;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=NHbkfNXtc131aUoF4N92IKmO0xkB3h3lCaJKrcrrfAw=;
	b=YVHOoFTfKCkHG5S5DCAheZ2zUHW/aYwZHzlaytYiYjv5q6CArMhVAZmoufrKgnrM9yoZ
	 tyn2Sy1D8bAqyzvqVxPGwUem75a2Qb7PBV8bWvWOb6mni9UFEKrgZkZnV5rxn3VnpBRpZ
	 2t4HwhFlkSOkpp7kjJr7dORqGeonTOBoqT5RKWQ21st7Z1cSL8r04r7OZ4zE5tFg8jJmB
	 nyrGZbMy7QOKcO7v+lbrL7b+iY/wsRsd7/zu55zShjFVbpgxbESpMkSk6u8tdfBu3/Nvp
	 BAsqXilL4SALUjsGrZk7XEdqtqwWMqThq3QK4Yxon9nvLNONkHolvKSrTo9zv4XC0fg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wm2kBVCX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C43606EE83;
	Mon,  9 Nov 2026 16:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wm2kBVCX
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794242678;
	b=jQSiX6Az/WZIpQKVy5H2PlAQKW8+4/LjW3rfmKRYRNwv0+7OF0z0YHlSJSS3YAbYBwN2
	 vPULfFDvxaTcp7NhEcK/LR56wxe9h5ZJOPTKUTIfQ5Dpk2trxnrQBvnAJdWF8FYpuRZmY
	 cR1zyg09QdHUvu7io4h6BA0/VyD4ujY5T5Z4rKjTPXe9XSP8QPFV96dbxH1fTYmA3XHKL
	 YsiuP8UDVhQ9cBwLFjX7JjGc4YO9Z3hqGyArv0Z4ytAZC6mMhypJiFlxkZeQ7nje2TPkc
	 PZfpiSejxs/BoGJfQNI8JqZtAMpR+y0o7aHkP9SHeqsHznglhLxAcJEMJnBDp7/CVig==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794242678;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=NHbkfNXtc131aUoF4N92IKmO0xkB3h3lCaJKrcrrfAw=;
	b=hfxY5qofmxlmrwNmtqrbC8n1LRmEI1ConwZkkzAUTZvBytofcz91MLwGnLGUpaQH65Gb
	 7CdAx0sK3Jah5asuMGM10NHzQ/1cExuEZMWKTotXPLpecqqeptNtSBbh2ZuIpyMTTIYi9
	 kFl3gyhdcRcQeO4UZ6/dULneNBMtd4rEthVq7heJg8yEMJ/CLvdsLDv1ULHdsMgy8daXF
	 ZvTD71mxEl5XK8qd9s7KMxous+vwxJ5FrnZFAxpDKYQm1JD5xUE44Sk45mcdSsKyrZRCU
	 BKAj2prBuccQZzr5JhkD5DZ5vTk+3BJ3vmi5rkN6mADXcrYUkbSARCWn4RXpE8UTEWA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7E2601F008A5;
	Mon,  9 Nov 2026 16:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794242678;
	bh=NHbkfNXtc131aUoF4N92IKmO0xkB3h3lCaJKrcrrfAw=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=Wm2kBVCXZG9oDKyVz+rLA4DZj1qhV0ec2vIp8l4T22xGh8pfglJoivocsL5MS7roe
	 Iog//E0tN3BCXfvsG1/Ve+1ybEWNA6bAQSKAyLs02Dx6ML9gwQOyZwRncoHZnWGXEO
	 +0Yw1ZTvJZf5e5hwevGins7m78+PdVnqjjiUgWcbYENt8eUfWCfJrHKyUOe323sGPQ
	 WbETGNDQV2XrOWvPA/p1T1QwjmJD/42KpLEKGAN0pDaXusFdQgn1h+FNL8552HrI9M
	 mQvV8RuljQMiT8jeyCWsU+Pz9mNVU3QGN2dPyPgy9SZKMxxq/d5XMg9jDbvLoC2FJn
	 XK8lQtowvtsPg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 14AA94853F;
	Mon,  9 Nov 2026 16:44:37 +0000 (UTC)
From: Yongjian Wang via B4 Relay <devnull+echoowall.gmail.com@kernel.org>
Subject: [PATCH net-next v3 0/4] tcp: fix tcp_base_mss on passive
 connections and test MTU probing
Date: Tue, 10 Nov 2026 00:44:34 +0800
Message-Id: <20261110-mtu-probing-series-v3-0-dedfab25d641@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAHL48WoC/32Nyw7CIBBFf8WwFkPBvlz5H8YFlGk7xkIDlNQ0/
 Xf72HRhXN7MnHMm4sEheHI7TcRBRI/WLEOcT6RqpWmAol424YxnScIE7cJAe2cVmobuLJVFrkR
 ZawW6JgvYO6hx3KQPYiBQA2Mgz/3iB/WCKqzO9bdFH6z7bP2YbMS/VEwoo5IXrIScp1LKe9NJf
 F8q222ByI+K4qeCLwqRpjq7lqwSWh0V8zx/AZqEFmYTAQAA
X-Change-ID: 20261103-mtu-probing-series-a87b39fdbedf
To: davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com, 
 shuah@kernel.org, kuniyu@google.com, horms@kernel.org, ncardwell@google.com, 
 kuba@kernel.org
Cc: netdev@vger.kernel.org, panweiping3@gmail.com, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Yongjian Wang <echoowall@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794242675; l=2247;
 i=echoowall@gmail.com; s=20261026; h=from:subject:message-id;
 bh=8Drvlb2AolCBjBW0hz5Yzs3wLctlMcWWUnLNb3Xmf30=;
 b=smYkDI3Wu6IkStp5vcQIpwLfu2m9tSlfMUzL2ltv/VNbH4MxnzC07U4KWY1FaKX/y1prmjHzE
 YWT/+UVtxdyCBqQIm+2z88kwb6iuW3nWQSTUawyYOLeyQz9qOAeVOwa
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
      selftests/net: packetdrill: add TCP black hole detection test
      selftests/net: packetdrill: add TCP MTU probing test

 net/ipv4/tcp_input.c                               |  2 +-
 net/ipv4/tcp_ipv4.c                                |  1 +
 net/ipv6/tcp_ipv6.c                                |  1 +
 .../net/packetdrill/tcp_mtu_probing_blackhole.pkt  | 37 +++++++++++++++++++
 .../net/packetdrill/tcp_mtu_probing_passive.pkt    | 27 ++++++++++++++
 .../net/packetdrill/tcp_mtu_probing_search.pkt     | 42 ++++++++++++++++++++++
 6 files changed, 109 insertions(+), 1 deletion(-)
---
base-commit: fa5196392691051963726787944db872420dfa75
change-id: 20261103-mtu-probing-series-a87b39fdbedf

Best regards,
--  
Yongjian Wang <echoowall@gmail.com>



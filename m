Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794989456;
	b=URMwnOTUg5YrjduGMHK30FLyyCRL4q2Lc4wgsRSDJ+Sr+kcX37UtoiMisxRIG5HRkJCe
	 jgRBuLS6RpxoHXWq3OG5j1WGktYk7MRot2qPJDAGZdPjE34jylJC/gVsh29xetDYoXt+f
	 7jk2uhNAp0iuHzfnV52hOwVGO8+jUPD7E1K3YibTY6qRw5GbrRTRko85z5cEPU0xGRAFN
	 lBWun6oD99uUtmPvse02Xozh0OVqI7rpaOokMwhRsq1lkFHblowO/6xqipKnC6sX3TojM
	 G61pNON6Ws+UPvLJGCwA4OaMmAZy4mRp1To+raBLNs8H1eq9Po7JPAbvNnuxxclvhAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989456;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=BvR6LveT3FNgS7LuOht20gjEzN0+jObgDSGvKWv3czw=;
	b=G9zZQHtnMPQf75t7YjXsvujsWrsdrujjYQgoNYZZuQF3trGRL/NyWo+2FA2CjCK9sGVd
	 CfpX4B/1pDwpkrgmPxv8E8Dle8kKYF7SPVtYrElx7ZIyrJqUWACpyb/MAww5xc/j7+RTf
	 yYWq4ilRzFWSZ/UoRRVOWS/sIGLIM23P0EU9WGHZpCmoqAg5w+/7QjocH4v256i5pMGHe
	 r/XZnaOyeThs81GfFNervJsvjMFML+MJWi7MS4zk8KO/SEGHVC/Yd8w1YF7BZClNQqVfR
	 8Vdwtz3x7BwiLtH8rxoBpblk77HrNwAHGF7iYD9b7SxYafB1xSXZ0ITvezWHhUQtfgg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="DSX3e/Fr";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82626606A331;
	Wed, 18 Nov 2026 08:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DSX3e/Fr
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794989456;
	b=sriH22aS5+P5K728r9s/y9VE5A/m4bM1gHXtpcsiC9k3jVIbdridi7N3iBFeiP1xnWHc
	 NUIAUije3htY/XffHNXLpn7bdHxc0TVIRg5ParI68n7fyOhvJhv+i3bI8BXe4n4L4O+4v
	 hEstjyQywVhjxb1ZcG3V9UXg51eJHCcUzKZpvB0rH3lOiymnCfTtVPz8YxskiQ5fq2qio
	 WzvIGZ3j0GGBf6C2Lv+gKddB4o4AlHnOguFyWxxDTgovqXVTqjxsfa3nwDaYzwmqmsFvq
	 wZiTfK+jnkD+JsjP2Y/MW6wRIGLizvizJg8A5YBRQCmKlZIHZXmAy6809AFbWCLqvXw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794989456;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=BvR6LveT3FNgS7LuOht20gjEzN0+jObgDSGvKWv3czw=;
	b=OlPoNfglT5xXbpinEzgiW3gRRj3fjYzYVXnlSPMMyKDJgeSjciAsaaZhG1OG0lQwGfwk
	 Wyf3bQSjsObYpllstzsZ8XQ2vkVJOGYxOmAVRjedsC6jfndGlltekwRaZ6CFUOuAIyXlz
	 NtyLE+sYpYV4zwDBrI6sLyFA/NtDG21ObCd9GpiAg5uChykPVpKP4kG0gmLL35HvP0J5c
	 1ruCipHhgURKFp45fEaGv7QrplwA/3/6wpugIaly3jCF0jeJIqfLzzL42y6LKrrmxYb4F
	 Ky7YU0sF3i6Bpuk8Zl02AanjrNGMSUYKauaNfdyBlhJBAIoUopSoiSvTh6sMqt8s7Xg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 65D4E1F000C6;
	Wed, 18 Nov 2026 08:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794989456;
	bh=BvR6LveT3FNgS7LuOht20gjEzN0+jObgDSGvKWv3czw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=DSX3e/FrQafDLK6638UyLxWvAYbaQbB9Do2EkMV2W7LuXNFiwEypxWhVphlMFeqIa
	 ztoQ10VW0A+RoXnrmmZqzMChGMEpPtv5rNgbwLuk1Z/qbP1CeJQRucrw0BNuInMj2v
	 MW3U7LtKIqoe42neFh+yqFEYBiPjMwxnvs+ySy/SU6e+dOJ0KBca2NlxUoiVEnHEcZ
	 i4A60doYFs0KY8Qewid54EIplCOS35Rxd1ZF0vW1nWDZcoWg3dsHTTmNxvOL0aLpT9
	 8P7yaR7xQpJl7vhexaNg9mHXrnpxNizKpyeuxEelfx2uZkSW12WNAzMjqrfpab3Xza
	 dYEskBvOOEYzw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E57954AC92;
	Wed, 18 Nov 2026 08:10:54 +0000 (UTC)
From: Yongjian Wang via B4 Relay <devnull+echoowall.gmail.com@kernel.org>
Date: Wed, 18 Nov 2026 16:10:53 +0800
Subject: [PATCH net-next v2 2/2] selftests/net: packetdrill: test
 tcp_mtu_probe_floor
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
Message-Id: <20261118-tcp-mtu-probing-doc-v1-v2-2-e795f20b8cfe@gmail.com>
References: <20261118-tcp-mtu-probing-doc-v1-v2-0-e795f20b8cfe@gmail.com>
In-Reply-To: <20261118-tcp-mtu-probing-doc-v1-v2-0-e795f20b8cfe@gmail.com>
To: corbet@lwn.net, edumazet@kernel.org, davem@davemloft.net, 
 kuba@kernel.org, shuah@kernel.org, pabeni@redhat.com
Cc: Yongjian Wang <echoowall@gmail.com>, rdunlap@infradead.org, 
 linux-doc@vger.kernel.org, horms@kernel.org, ncardwell@google.com, 
 kuniyu@google.com, skhan@linuxfoundation.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794989453; l=2202;
 i=echoowall@gmail.com; s=20261026; h=from:subject:message-id;
 bh=WrcY9iXn4SXDQlJWipeiEC5l8GUQMcBnGkZOHeOty8w=;
 b=WhNkoerzSliW4HHWgcU2HRPh+ONRc6XzzwRKlmUOnmhFoedAJM0lNeXSM7bwGvL/5QpJhlKl9
 2wyyDcXXhNtCgrkY5VPaXeXsTRwYH8x3PwUumkHq7tnouREhinNc4Lh
X-Developer-Key: i=echoowall@gmail.com; a=ed25519;
 pk=9XP6JhqjjPsHCF6UZZZTeqTRnXIa4+ufggnxXtTJ+no=
X-Endpoint-Received: by B4 Relay for echoowall@gmail.com/20261026 with
 auth_id=1323
X-Original-From: Yongjian Wang <echoowall@gmail.com>
Reply-To: echoowall@gmail.com
Content-Transfer-Encoding: 7bit

From: Yongjian Wang <echoowall@gmail.com>

tcp_mtu_probe_floor has no selftest coverage.

Add a test where a full-sized segment keeps timing out without any ICMP
feedback. After the first detection falls back to tcp_base_mss, check
that each further retransmission timeout halves the MSS, and that the
MSS stops at tcp_mtu_probe_floor.

Use tcp_retries1=1 and disable TLP, as in
tcp_mtu_probing_blackhole_no_tlp_retries1_is_1.pkt, so that every
retransmission comes from the RTO timer.

Signed-off-by: Yongjian Wang <echoowall@gmail.com>
---
 .../tcp_mtu_probing_blackhole_floor.pkt            | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/tools/testing/selftests/net/packetdrill/tcp_mtu_probing_blackhole_floor.pkt b/tools/testing/selftests/net/packetdrill/tcp_mtu_probing_blackhole_floor.pkt
new file mode 100644
index 000000000000..dd040d9beca0
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_mtu_probing_blackhole_floor.pkt
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0
+// Test that after black hole detection, each further retransmission timeout
+// halves the MSS, but not below tcp_mtu_probe_floor.
+
+`./defaults.sh
+sysctl -q net.ipv4.tcp_mtu_probing=1
+sysctl -q net.ipv4.tcp_base_mss=1024
+sysctl -q net.ipv4.tcp_mtu_probe_floor=300
+sysctl -q net.ipv4.tcp_retries1=1
+sysctl -q net.ipv4.tcp_early_retrans=0`
+
+    0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+   +0 bind(3, ..., ...) = 0
+   +0 listen(3, 1) = 0
+
+   +0 < S 0:0(0) win 65535 <mss 1460,nop,nop,sackOK>
+   +0 > S. 0:0(0) ack 1 <mss 1460,nop,nop,sackOK>
+  +.1 < . 1:1(0) ack 1 win 65535
+   +0 accept(3, ..., ...) = 4
+
+   +0 write(4, ..., 1460) = 1460
+   +0 > P. 1:1461(1460) ack 1
+  +.3 > P. 1:1461(1460) ack 1
+
+// The first detection falls back to tcp_base_mss.
+  +.6 > . 1:1025(1024) ack 1
+
+// Each further timeout halves the MSS.
+ +1.2 > . 1:513(512) ack 1
+
+// Half of 512 is below tcp_mtu_probe_floor, so the floor is used.
+ +2.4 > . 1:301(300) ack 1
+
+// The MSS does not go below the floor.
+ +4.8 > . 1:301(300) ack 1
+  +.1 < . 1:1(0) ack 1461 win 65535

-- 
Git-157)



Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794148795;
	b=C4MqMflIusN5P7QN5jTTiq8ZzveF6G1Xm0dwSUTMl0xLtKaefHsbHF2ccisJxAMEdFZh
	 mtW/lGVNRikybRR7ij9BI0j5HPmBGEND726RmH4U8jX8jsAL7ERO4s+Joh/UGwEXgCZ9b
	 CH8cuyrX3MsHKXOEceVy6Lm7ees11iNj6rXiM0a0JDY5CxSP/xdTQPFCK/zv6mEkReZbf
	 eBKErK1fTmaRh9jred0XKGdtu6adCAc48OQ35+AsTF+BC+VXhLqosXQE5+Y0W0Uaz0SoV
	 xWe5PZ2J577bIXBIX18uRjQ9zuJ06u9jK1yaV7ZgxkKybuQY3jhNMbpTbO+NnbrVEvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794148795;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=jpd8M4Q159pv4wav7dcjIJjGCvakvp5m27ExAjzeb2g=;
	b=OIrkr+m51VaA5LYo14fWDyvAHofWqtr7z/tVoTD+QwXsnRTwMpgsU743GSOQ7pjUNPOO
	 aXc1eyZHme7IO64o/H495gyg9cEioCzBY/Rz2TXalL6r4OEsKSvtQu1HKuVbUhKgACB7V
	 nKpMXkmZ8azZ24mHnIAtRhYeeoKm3nigtXM+yGWgdUYo3wE9PohG6FgcxN7qQ7THEK2Le
	 potJDpBhMI+l2stdNZjavCIPbz0oKLr4aHQzKdfaabr9TRboYD9IFIEqVqhJspV+CWYq9
	 0GR3t9KX9Gl/NwFMWh56n2K+zcdcRp1pHQ26pJmc2A8XLvvTFFDywcH2VCLvfba2NrQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OFOJrNTN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0BC606A321;
	Sun,  8 Nov 2026 14:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OFOJrNTN
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794148795;
	b=m580sTgFhFFh0i9hSCOgKpc0KQfAkGHRSq945SOhm5J/Yl0H4TQULCaRjrWvdKJFf66g
	 j+BYqND1lPYj8tEG+h4NQlv3ZGColpK7Up6CNtkUSNl5QpkRxMrIlw9URm6abkhpi0kLK
	 rUg1zM9U/otwZCOwPjPBIfITBkDb2U8mZgmHjuxtWjnqaT9Cl9QMasRNHjnzivQxRTTPc
	 yWeL689L6nu1wjGT/h7/dwbwfsOJpOm8UannIfO0HUjf4Ys421kexykvzcetczr8EuYQW
	 /T2A7BcU5BopXtGOr0PIHTx0CbTkCij2MpmJ12Wo9W0IE0tM76TUgIO3JEMzv9e9nEA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794148795;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=jpd8M4Q159pv4wav7dcjIJjGCvakvp5m27ExAjzeb2g=;
	b=pMT1mAEg8ZQUbzDor2t280I6/D/LX3TlL1peeTLuLD7gnRABH4O6aqCWXBUE0o9JJoOe
	 IOPoaET8tqj/RRi6/tcq5m/L7PtWdJ7lmaGGqeP6pwOTHn1BUxT/1irKbuU4gmVH+omTK
	 iJaX5+2NFblSHj9Z+QOvpBTFON8/qmkrVnciTW05zby+uOmKRe2W11qmr9JYJfnJLbCQV
	 qf/YNyMyph8pvMCWcqlHyN/qQANqpSLQb7NYx20aB1AGVa7BuzX1J+fqH9F5MGA9qLsWR
	 T/du7MHI1S+samLqW+ExzFy2hQ94ap11ArlHOC64HSUdMSSWIxhMMOvEUy4M2FVgUSA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 23B591F008A2;
	Sun,  8 Nov 2026 14:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794148794;
	bh=jpd8M4Q159pv4wav7dcjIJjGCvakvp5m27ExAjzeb2g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=OFOJrNTNhAs6VV9NusNVzl5D2Ihtc+S4P9mQO/Vf1I6szshXuLbGwMXAJD5VwQhe1
	 PclramlQOE0ML4Y3HayTARbXQhHVtwrwzSvj21cr140CAr9kvD/C3v0G40nbYOcPvp
	 f5HKpgjKrn9qiwhqnYrzLh3wl0CkxzGex5KVuv1/kuo0mo9mXhavQWofhN3BSwoQId
	 Pw1kPqF4gXGe+GiZlh/5q+Dp8QUmN7TVb3vt5gC31UJ6GiB5O+QhmDv1JRwOn6JqA/
	 qfMjZ8npAuXkHwHm/CNSamR0ctWIAF9CuXfBMOYBWWtp2VHtfDdKrBphczYwZufaeZ
	 8C4S+i08q9rJQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A786547FC3;
	Sun,  8 Nov 2026 14:39:53 +0000 (UTC)
From: Yongjian Wang via B4 Relay <devnull+echoowall.gmail.com@kernel.org>
Date: Sun, 08 Nov 2026 22:39:54 +0800
Subject: [PATCH net-next v2 4/4] selftests/net: packetdrill: add TCP MTU
 probing test
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
Message-Id: <20261108-mtu-probing-series-v2-4-355d6490c3db@gmail.com>
References: <20261108-mtu-probing-series-v2-0-355d6490c3db@gmail.com>
In-Reply-To: <20261108-mtu-probing-series-v2-0-355d6490c3db@gmail.com>
To: davem@davemloft.net, pabeni@redhat.com, ncardwell@google.com, 
 horms@kernel.org, kuba@kernel.org, kuniyu@google.com, shuah@kernel.org, 
 edumazet@kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 panweiping3@gmail.com, netdev@vger.kernel.org, 
 Yongjian Wang <echoowall@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794148792; l=2709;
 i=echoowall@gmail.com; s=20261026; h=from:subject:message-id;
 bh=6H7bHmrcx+NwgR2BDbVgQR3Zh+5FGAud6AanMriiUKs=;
 b=IF0QrQGeatzU48wsrF47IdTLRTtNbPESsNSiji6pEnMO9xs+BhemHYRsXBPLlLRKzTLxq/A5h
 QUJQ+geU4HNCmoO2RS4SjHRTLidrr4T5DuThSdH0TGSIDiO94RX0bAD
X-Developer-Key: i=echoowall@gmail.com; a=ed25519;
 pk=9XP6JhqjjPsHCF6UZZZTeqTRnXIa4+ufggnxXtTJ+no=
X-Endpoint-Received: by B4 Relay for echoowall@gmail.com/20261026 with
 auth_id=1323
X-Original-From: Yongjian Wang <echoowall@gmail.com>
Reply-To: echoowall@gmail.com
Content-Transfer-Encoding: 7bit

From: Yongjian Wang <echoowall@gmail.com>

Packetization layer path MTU discovery (net.ipv4.tcp_mtu_probing=2) has
no selftest coverage.

Add a test for an active connection. Check that it starts at
tcp_base_mss, that it sends the first probe half way between
tcp_base_mss and the peer's MSS once cwnd allows it, and that an
acknowledged probe raises the MSS and leads to a larger probe.

Disable TCP timestamps since the MTU search range is computed before the
timestamp option is negotiated, which would otherwise make the MSS
depend on the header length at connect time.

Signed-off-by: Yongjian Wang <echoowall@gmail.com>
---
 .../net/packetdrill/tcp_mtu_probing_search.pkt     | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/tools/testing/selftests/net/packetdrill/tcp_mtu_probing_search.pkt b/tools/testing/selftests/net/packetdrill/tcp_mtu_probing_search.pkt
new file mode 100644
index 000000000..65e466fbf
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_mtu_probing_search.pkt
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0
+// Test packetization layer path MTU discovery with tcp_mtu_probing=2: an
+// active connection starts at tcp_base_mss and raises its MSS by binary search
+// as probes are acknowledged.
+
+`./defaults.sh
+sysctl -q net.ipv4.tcp_mtu_probing=2
+sysctl -q net.ipv4.tcp_base_mss=1024
+sysctl -q net.ipv4.tcp_timestamps=0`
+
+    0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
+   +0 fcntl(3, F_SETFL, O_RDWR|O_NONBLOCK) = 0
+   +0 connect(3, ..., ...) = -1 EINPROGRESS (Operation is now in progress)
+   +0 > S 0:0(0) <...>
+  +.1 < S. 0:0(0) ack 1 win 65535 <mss 1460,nop,nop,sackOK>
+   +0 > . 1:1(0) ack 1
+   +0 fcntl(3, F_SETFL, O_RDWR) = 0
+
+// The initial window is sent with tcp_base_mss. No probe yet, cwnd is below 11.
+   +0 write(3, ..., 40000) = 40000
+   +0 > P. 1:2049(2048) ack 1
+   +0 > P. 2049:4097(2048) ack 1
+   +0 > P. 4097:6145(2048) ack 1
+   +0 > P. 6145:8193(2048) ack 1
+   +0 > P. 8193:10241(2048) ack 1
+
+// The first probe is half way between tcp_base_mss and the peer's MSS.
+  +.1 < . 1:1(0) ack 10241 win 65535
+   +0 > . 10241:11483(1242) ack 1
+   +0 > P. 11483:13531(2048) ack 1
+   +0 > P. 13531:15579(2048) ack 1
+   +0 > P. 15579:17627(2048) ack 1
+   +0 > P. 17627:19675(2048) ack 1
+   +0 > P. 19675:21723(2048) ack 1
+   +0 > P. 21723:23771(2048) ack 1
+   +0 > P. 23771:25819(2048) ack 1
+   +0 > P. 25819:27867(2048) ack 1
+   +0 > P. 27867:29915(2048) ack 1
+
+// Acknowledging the probe raises the MSS, and the next probe is larger.
+  +.1 < . 1:1(0) ack 29915 win 65535
+   +0 > . 29915:31266(1351) ack 1
+   +0 > P. 31266:33750(2484) ack 1

-- 
Git-157)



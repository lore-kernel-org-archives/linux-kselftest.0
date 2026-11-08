Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794148796;
	b=R7RvMdYkcmNQLwhchnHPimXrLNP99ph//rjOjicazoSXOFYW3b5yp8sqzCcqLWoLiu2Z
	 gHYxbS02wSJPCCWzaK5REqS06MCot4TVjjpsbNKfOZ40Vnnsymb+bxV8vmbuxowVSTDs0
	 i0FoDkXjszC+erxlYFq5EWRBDl+A+VDCpT1JLte8JEpImHnOikAbzd3IV8eOzVN2uBL+V
	 AUmZV+j9argGCctblRKrcxKJVIDPKBTCMRwAdE8AbBKaQjtMpbkqGVi4WkULmDFAP3RxB
	 dl6TNRdDTCf2NBreOdIsw1C8aUM7b4l1ydvK3WTco6dVdRF4M2i8jKD58IHT6p29jZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794148796;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CeOxTxKArDbG7RBezkcPwmjmZobpCK7vzK4n/jgzMSk=;
	b=asWtHcK61d56Wl5OHLA1f3bgVw/mE1iveXoIk2qOoRRtOtfjLcGexXQa+czg+LjV7F5N
	 MjLBYuCND745TbJHfgikpwEcVlylKdKXSh/zrTon632JaiqZz8r40dWWRCHdnxaCEoVa8
	 uAKI/KglC3bo6UZOPWo2rjw7935TDdlCAobEsEnnUI9VYWOS0BO5GBIAZsEtm5CvBaQSI
	 qlnJ9DZek0ADP/dqUI4+rRzJHZX2V6TbVVa8pqZ7l7kWbZ1qu9E3S2d5DRUVQmPDYOzsn
	 pwLe/oh3ni8ZXSW6O7G3Uul6hJ/BsTWw7KG+eOIHQw68TW5UtszH8zeXt+hYv/l5QxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TfNHglHj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEBB606A33C;
	Sun,  8 Nov 2026 14:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TfNHglHj
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794148795;
	b=EpnNumtdYx+jJyyIYYiI9FIeQy4hTwex3UxdALTZtHaAoGuG/R7sdwczeePIsslZKvLl
	 5hD/C/DXpx38WFsn+DO0r+HYCJM40wkoQjAEfhjt+PStHbXg+Qag0b9RuUPwD1vadvbOA
	 zRf6YPwdu8mhVtgYbWM2z75uuQ1yJwsEn/5fJmUdIZiycctJ+T/V8xz6FJwtG8Z1W1nse
	 xEoVa0XlYey2ZD37EaGCzbMTKxzJok1GIpPYdyXJ4sVsaZpj94w6MqLMYEi2WhL2Oyq8L
	 hOur/VuT+RTCYLfghfEXVOtBSyv1UOC7IWwBBBmtukCSv4/Ll6j1AMCcForvva5ZW7A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794148795;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CeOxTxKArDbG7RBezkcPwmjmZobpCK7vzK4n/jgzMSk=;
	b=0e2HEpuMcNs2sYOTnc6bhr8Dz2qoIMqqPnZH/6WwbdnTElIxyMJ9lUY/Dupto67tv6Us
	 24m/0SZzuXXz4imXJv0QV5zqhUKEfcTtXbk8JleksbG+QKRe5Xj4vqfA33EPPH5h5RnSH
	 2oQn453ebndxcRhmotbC68iknj7E6SBv4CLHsSKnfg5gPJ+kI1FU8BTIc0Pd9V3TaNG8V
	 6Kztl99TQb7yuzQ6Qb5BNfOJOyVb4Nta/rzQpKIhwz+FLiDZQbBPupMRDP6aOIoCufXXS
	 HA9tRbw6ETWAbIvvMPUA/+IN8V3PMo8VQb7zanc1GkbMZbrQhTJddPsmkWB1FSRA8hg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 198251F008A4;
	Sun,  8 Nov 2026 14:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794148795;
	bh=CeOxTxKArDbG7RBezkcPwmjmZobpCK7vzK4n/jgzMSk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=TfNHglHj9zWG8V2barZa+njevWyohUVz0Fm5qLoXyZ5sg4yO/ofH+IlOpMoDfUiMk
	 Nk4PDFlEayKjdN6/XUy1ShhdBKlfAAjsnPOfk92BJ/kA9/YCEOUi7jv3ZQHavW04ra
	 V8zGMd+4yi/g3GW7owR52lgZtxLtG/cVDnS1jO2vtohWOliQzNs1Ool4ZKoIeiOD5Z
	 y6J9sddrDU6weukBGoMI5R2/m9SOixwjGUKEUJewok17gN1/yYu4xuPXZFdev2zD6L
	 D8N27JStEBI0JfzJLny2WMuj7zIfZrX50a20GTFItL0dEkITZc4zqh6bOCbn7xt39k
	 PBVtQGf8lkqkw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9695D47FBF;
	Sun,  8 Nov 2026 14:39:53 +0000 (UTC)
From: Yongjian Wang via B4 Relay <devnull+echoowall.gmail.com@kernel.org>
Date: Sun, 08 Nov 2026 22:39:53 +0800
Subject: [PATCH net-next v2 3/4] selftests/net: packetdrill: add TCP black
 hole detection test
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
Message-Id: <20261108-mtu-probing-series-v2-3-355d6490c3db@gmail.com>
References: <20261108-mtu-probing-series-v2-0-355d6490c3db@gmail.com>
In-Reply-To: <20261108-mtu-probing-series-v2-0-355d6490c3db@gmail.com>
To: davem@davemloft.net, pabeni@redhat.com, ncardwell@google.com, 
 horms@kernel.org, kuba@kernel.org, kuniyu@google.com, shuah@kernel.org, 
 edumazet@kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 panweiping3@gmail.com, netdev@vger.kernel.org, 
 Yongjian Wang <echoowall@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794148792; l=2271;
 i=echoowall@gmail.com; s=20261026; h=from:subject:message-id;
 bh=2gf+VU4SH9z04KrX//6g8/b2rrK3/ddnLXUqOlblf40=;
 b=7q3nY3jteMK81g4oaXBQFD2D+TuCHTmZis9MFpehVkdgguW1+hKijcRKCymxd7pgl64FxeJXC
 OFCT/ym3LQwDyBd/572PLUNxQnCBSYNVH79F3Jx/QSFWZt2kSNmMDfk
X-Developer-Key: i=echoowall@gmail.com; a=ed25519;
 pk=9XP6JhqjjPsHCF6UZZZTeqTRnXIa4+ufggnxXtTJ+no=
X-Endpoint-Received: by B4 Relay for echoowall@gmail.com/20261026 with
 auth_id=1323
X-Original-From: Yongjian Wang <echoowall@gmail.com>
Reply-To: echoowall@gmail.com
Content-Transfer-Encoding: 7bit

From: Yongjian Wang <echoowall@gmail.com>

Black hole detection (net.ipv4.tcp_mtu_probing=1) has no selftest
coverage.

Add a test where a full-sized segment keeps timing out without any ICMP
feedback. Check that the MSS drops to tcp_base_mss once tcp_retries1 is
exceeded, and that the smaller MSS is also used for new data after the
retransmission is acknowledged.

Set tcp_retries1 to 1 to keep the test short, and disable TLP so that
every retransmission comes from the RTO timer, which is what
tcp_write_timeout() counts.

Signed-off-by: Yongjian Wang <echoowall@gmail.com>
---
 .../net/packetdrill/tcp_mtu_probing_blackhole.pkt  | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/tools/testing/selftests/net/packetdrill/tcp_mtu_probing_blackhole.pkt b/tools/testing/selftests/net/packetdrill/tcp_mtu_probing_blackhole.pkt
new file mode 100644
index 000000000..f10dbb36d
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_mtu_probing_blackhole.pkt
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0
+// Test black hole detection with tcp_mtu_probing=1: when full-sized segments
+// keep timing out and no ICMP arrives, TCP falls back to tcp_base_mss.
+
+`./defaults.sh
+sysctl -q net.ipv4.tcp_mtu_probing=1
+sysctl -q net.ipv4.tcp_base_mss=1024
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
+
+// The first retransmission keeps the full size.
+  +.3 > P. 1:1461(1460) ack 1
+
+// Once tcp_retries1 is exceeded the MSS drops to tcp_base_mss.
+  +.6 > . 1:1025(1024) ack 1
+  +.1 < . 1:1(0) ack 1025 win 65535
+   +0 > P. 1025:1461(436) ack 1
+  +.1 < . 1:1(0) ack 1461 win 65535
+
+// New data keeps using the smaller MSS.
+   +0 write(4, ..., 1460) = 1460
+   +0 > . 1461:2485(1024) ack 1
+   +0 > P. 2485:2921(436) ack 1
+  +.1 < . 1:1(0) ack 2921 win 65535

-- 
Git-157)



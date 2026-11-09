Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794242679;
	b=pCwlxB5sBEVwVcRMm0TA1eEkK5td89WWO+7h9TlNi5VhcNp/hpaIVEJZER8RWZYfb047
	 wQ6XRPhcNAyUpbgnwGaf1o90W8xSS2JrmsCz0dzcu7yCa8K6UJl1blK9pQcJo9K/9UXaQ
	 CdcUB2ztD4FpbiM3iJGu3jTBtvNDNcSdkytPC1Q+m2gfAhphnRBVg6m6MdYPS6M0nFQql
	 uEiYmxqnzISYeh9v92lkMnuZ/5PuBfLn+EC15O+UusSofzajvpLkenV1U/VZHO/HBFWSf
	 2DcseP0oA4jYQEYlUiLGyKNkh1lZ9Ax1TLILlmDqjIdZqRH01I09LSpM4jsWpLgMAOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242679;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=8fRL+nTlnSV4hzSZwzm7zxIUFoAwvbUSW2rT3EZ4JHk=;
	b=ugxIVvDFDmN+MiVvXfimY+WJCtWaC1f6Z5UmRnEBXQgzA9tEj/7MyosmmBJ6O6+wfOSp
	 cRogFHf5SaLBvrLEX5R8VS0nu0P98vZvk1DqY4lCAZGac3+wNj4cqGAB9i76/DmaJ/ypf
	 IiUPC+rZNKQFRk6xP6sd3MOcM3KQyAganSi2BgJs+VB6nr+nBw0QwXXR4i3t4lttGvDhy
	 FQmNX0S+mW9tiaJlEWZioDhgI8H4Iqs0c4VR3XAHO3/Exdhm7yR8P5Yms9MjmuRh/3vbS
	 EaUCkfLQfSZKE6xxuHn212V682Sc3sXVxIpq/2B68YeHE4hEUBd16kCfH26/uE3YLWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T8+WxjJL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C601606EE8E;
	Mon,  9 Nov 2026 16:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T8+WxjJL
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794242679;
	b=Yq7uh387XZLxS3LvQZw7QqeyXaWZKuJcwCON6hVIVoBw8NLPVNomtnxNa2Vqp66ZKrgh
	 nxnhJiMl9ScdaClrQePPYXS0B8sHcmxSoQQIyJaKI0QIXHVhFuKoyjVev6j805asi+FN4
	 Cs/76o5/qiKlLEKDyMeOsfBXq0VQC+R/mgTRhwGn18s4YZjGTcTQlbHYNMWWImdKbpaHQ
	 WX1l5k4igHxhIYHC+LZt4BqWqpKYrpEritlrcWctuKVrN+6ckLaJQPKfs3tADgEpE8K6z
	 bahCeTlXGc0EcNQFPGApEElKHdSygmG5fnuM2Tr7ZNOuljclZsqFYX6yxs9fnO4qW9w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794242679;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=8fRL+nTlnSV4hzSZwzm7zxIUFoAwvbUSW2rT3EZ4JHk=;
	b=c8B8xEKRXuSYuxiaBgK3mpbOn2vwjWgNlibD6yr3tR1ZZ18iSAeSJW8WsZdEXQ49Tamc
	 cewsbBJWQHRJvPbgEgIECb1Ewk5mnTvGW+gFP9nmK2yI4kVEYfMDHbpd1TcAeGR3fTcOw
	 VMjWam7QVDQxLQ05Dl+DiBsbUB/y04WdkNYl4cPc5PsF573SDcQ2Z/Hi3Y6qeicJ+Gu93
	 d0/4DracVknC0e+5TrOWVd4WapQqz8YVXXuiGT16MFm7RBQWAcmqVVkV3qQ6W+wTnn20p
	 gpN8QPUlAOcckNVUnX6BxGtGZ2t7whgkL02KKDrRfQ1qLjeWQU4yiBXHMSXF+VCAHag==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B51201F008A7;
	Mon,  9 Nov 2026 16:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794242679;
	bh=8fRL+nTlnSV4hzSZwzm7zxIUFoAwvbUSW2rT3EZ4JHk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=T8+WxjJLzxulfz/5otnIZ1Sq4yVGQ6vC3nuQG7cbvCQHADwNchtLtEuirpKMjxbwC
	 MhG2+JLfkXfaO2B5tQW1+Dpfmt2kt9l2roX3Tdf9aVkxm5i0qcr3K8yiTaIGIxTerI
	 j6rtza0LnHAWMqxcZ8Rymnz7gcfYBMe45MHcxz/CZXoS3ayzkR7cySv6OsujvtrBYt
	 EysbFouZKHhCelPLtwZ88+0IXBHuGvXUPQ1S7g0qD7k33m4QWUoSrjsJ/II1e07Qdp
	 JGLtiJSrTK5UxFcXvGulSkGlINZu7XMK+lm6c5UvQ5OxDb56URIOtShuhIAhtyKXDN
	 Y97QN8BT8uWHQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4742948551;
	Mon,  9 Nov 2026 16:44:37 +0000 (UTC)
From: Yongjian Wang via B4 Relay <devnull+echoowall.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 00:44:37 +0800
Subject: [PATCH net-next v3 3/4] selftests/net: packetdrill: add TCP black
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
Message-Id: <20261110-mtu-probing-series-v3-3-dedfab25d641@gmail.com>
References: <20261110-mtu-probing-series-v3-0-dedfab25d641@gmail.com>
In-Reply-To: <20261110-mtu-probing-series-v3-0-dedfab25d641@gmail.com>
To: davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com, 
 shuah@kernel.org, kuniyu@google.com, horms@kernel.org, ncardwell@google.com, 
 kuba@kernel.org
Cc: netdev@vger.kernel.org, panweiping3@gmail.com, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Yongjian Wang <echoowall@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794242675; l=2277;
 i=echoowall@gmail.com; s=20261026; h=from:subject:message-id;
 bh=DlEcv6f+Cg8yca5bPvzEty87MvxA44OfQo4Nhelyigg=;
 b=b6IakWvTGhE9iFUrmoVJExBBuUp3WgBj6VBPI1QvZZxGs/n1mKHat+wB/r0KC3Cy8+Pg2TGyi
 2C6detkgoESASbiz3ieI2o7B9sN3LuK1dIqZZeEU821Qp8EEUNLwbsf
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
index 000000000000..f10dbb36dd2d
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



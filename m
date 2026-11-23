Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795431864;
	b=p2ifFMQwaBs5QRXrY4c99WoEBNR8uOu1m74X8vZep6tvABi2c1Qk6w4ClYEUnZXEbgBq
	 x3M8vWmEYFdy3LI2Cvu//KHbB62UgVAb4oQ5ymuSuZM8y5mpuuOsaeTZEl3qk8x0i7IDH
	 4gjP5Xn5dC1+63h89JISGjYZ6QNg+PsYVJby20fOO3YJXy6mDbMtEUcYUbuviuKgAMIsJ
	 C0KHlvehfRHubLWeqjrSMvOsOmYAD2gbW3UAikJG7Yhv23n31e7+UZ4lu25NEgaC1/IzO
	 lksqL1gYzXPWUSWHrCPH0Rt7PDv8aAOPzJorWRVzWfjqHyVkVr/kV17saCVb0L4urLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431864;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Sy1hEmrM6yrrP/2YFylQYTk/EF85CVn0Vom/iqjAOJQ=;
	b=KI6CB+9LuJnw2tkj5ket5u0osQ0gqSP908CTgoqLrvpAV1ek7zEDyxMkKSY/wtTqP77u
	 7Z8prC3f0hhrXN9EUQcal9HvAgPOZbIIQtviUW12sqngclTXqRIG9B0tEGp3adRpRcMUf
	 drsJbe/fdOJlUhPKMIJzBUvhNbDHalZdxc5xbkbV81TIvVUnjT/T6oWa+MO4psXEzmRJW
	 Dt5+rMPVWDgY8TmvDi64ZhBIpz/dD8Dph/4wz16Ho+fL6GZEimlvlcnyt20mEagNG9f9t
	 72Fi8ZIVuAgnGZJWWOSBb6qRHXSUFrFYD7XnQtlmOPnL6CUYcMF6sYWGl9gdIVmodgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WzbVDYhF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A1E606A6BE;
	Mon, 23 Nov 2026 11:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WzbVDYhF
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795431863;
	b=a7WG+aTPt+51rEexSG8w+kiqNVtJhmnv9LBFeRbvgRdIyJRmfpiGKqdwMOA+KquMp3Ou
	 GzPzHnyZT3vuq/ucPlLezqdcCPI6PrUhSanZ7Fvkn7LbF9leQ4xvGVe4KFFTIv9TQ5SPW
	 P2wGR4O9gmVVSgCukLoVOL7lxaV6Cmnh7aLcu4Q4C31mbkwMI6LPPQQR6tSkAsKRAIHGe
	 XYWCALbHE6SvY/Cjq3pxyANcOWwo0ShRpJepreEwU2hyL4treRmSHeyKxNPfATz8btH0e
	 9lBMfiT0zBaNaf86pVQTGYtl3mqNE0FDT7PF7ok0XSZYoHzl0LMgxlLcRG1f8NlzH5g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795431863;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Sy1hEmrM6yrrP/2YFylQYTk/EF85CVn0Vom/iqjAOJQ=;
	b=RWHKTixiit2fWNJTXUiPR68aSEdgGmZT9yVanxN544rzUwXyMwvxaTYyi7/rWEm7TYCL
	 szkjoJo49Q46i50ZqF5gQqhabFprE8J3xz7qBzs3/ry6m4WbIHL1RMWdrvcnNAqgYVTUs
	 IFmUEnYQUhOsWF196ld5elyd/3PzI4sUVX5TvJC/ngEqedJTMEV37C86ih6eOuQSxEmaW
	 XnuHOoXTFuwo36rJPJ6MEaEPCsXxjkdxlsBFRYbhh+Z4tuk8nby91LIey8AZTYy8TZrAT
	 f1S07Nhuh8KGpBgSGqLMC2M8ny5D40/6E8HhSlFP9oog54Mszjkpny2DSW0ubN96vag==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A50721F000D0;
	Mon, 23 Nov 2026 11:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795431863;
	bh=Sy1hEmrM6yrrP/2YFylQYTk/EF85CVn0Vom/iqjAOJQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=WzbVDYhFk5c784oIDyHqHTGWV7yl+uKLxKdtnmNonYOMy0PdYlCcJyZ674i/G5+Qg
	 sqwsa+zVGFG9vuwHhuUY23P/oSZPb1s3Ap8LA4/QhngFJkZ3UED46AKPsa/Wd6KuVE
	 8UmFrujZ9V82bzOSuKep0ueC0p/tf1HVZgMI52Vrd9NlDqdVPqkZsX4IcftkyHxESD
	 JAwJTpAbVXncuAewnAE5PfYmQL/ZD4bLeaucDfwBmKIjYRdA30ECI3DCO/yf+MXSvT
	 cpUUokads0YmkZXG14AISswYbFY20hBNtuUKeUBZXm5lvspmwchlfkdvKBDeZbXU+T
	 avGuy1mGcHhFw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3691F4C43A;
	Mon, 23 Nov 2026 11:04:11 +0000 (UTC)
From: Yongjian Wang via B4 Relay <devnull+echoowall.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 19:04:10 +0800
Subject: [PATCH net-next v3 2/2] selftests/net: packetdrill: test
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
Message-Id: <20261123-tcp-mtu-probing-doc-v1-v3-2-c288c2df9666@gmail.com>
References: <20261123-tcp-mtu-probing-doc-v1-v3-0-c288c2df9666@gmail.com>
In-Reply-To: <20261123-tcp-mtu-probing-doc-v1-v3-0-c288c2df9666@gmail.com>
To: corbet@lwn.net, kuba@kernel.org, edumazet@kernel.org, pabeni@redhat.com, 
 davem@davemloft.net, shuah@kernel.org
Cc: Yongjian Wang <echoowall@gmail.com>, ncardwell@google.com, 
 kuniyu@google.com, rdunlap@infradead.org, linux-kselftest@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, skhan@linuxfoundation.org, horms@kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795431849; l=2254;
 i=echoowall@gmail.com; s=20261026; h=from:subject:message-id;
 bh=L2mM/OhObLn59aLpNJ9Spn+BLz/qgLoUlYL6TTs8CZQ=;
 b=3V8xSAG8iabgXfHb/kqahTVUGbuhiAxkOHPUCsW3ZCsx63YVBJMhGj9eT4AgqJMBi2224D5Ab
 GlroLvG6p5qDpMJ7QPV0620sAitddv4LfNE36jGAfM1NGJJwWEXoq/J
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
Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
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



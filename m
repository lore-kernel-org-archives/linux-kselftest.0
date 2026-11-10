Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794329160;
	b=jz33k53vls8Xz33pbnj1MlHK9sA5PwcRLaIB9NtwfVcMoKDYdRfWXr0Oo5M90ep7pZjf
	 cIl3FYd30pjafo/phpmoizVC//AAa5d1Vr0P6cGKfhec5JLKPFY7zptv839n5h8zscdcw
	 glUJ3H0fNU65QQiI0ivAjMHyQOBBO0zsniPhMJpIOtpOobEtXrqG1Sd/U7Yq7zoWTJB0S
	 psZBKvcQeulAiFraYD7/vHTD+f+O4D2oeAgM//xLv5pkQZpBE9e0pQF3bcABwlAXFt1t5
	 Ea3AUup1mdwKFX5aVhvTZLjf9gS4SwFeM84VZI4F2KGdFwlwmNL8frXsyO/ZRkx9boQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329160;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=h/NzmMx/WxxoUPK2RZDSGStjl3Bsd9UdAA3RuyW6X5Y=;
	b=OfLyMa7d+8RpcLbMcFce4cwDS3u+F/mVpzCBaKvU5V+FoT0smaVMAd/u40O6T6jaPLZ7
	 SB3/uO9Ei+7pukTdzIz+okiTEU3h0NQubSqJjlrMf2F9Ot9FayTukurntsVRMAyhmrCw4
	 9P/e6ctdKIJ0330zBSBYbUi6Z0c6mWNl51iztc/HzXe9wpZgWreC0OJXR+iWHoSkXQaX+
	 Enc4bKpdgrpPs970bCgQ7YLseYG8Ap+MoTswN1kT2DgBmmdg8Zh+frJ0DiB2W8gsJ38cQ
	 q1CVb4+2bdaoqbK0mCyzjBM957XHsYptlJLehurH5LWF2dRcmIXS+dvp3EKxEoU/zsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DOLp2suj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9988606A336;
	Tue, 10 Nov 2026 16:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DOLp2suj
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794329159;
	b=XT63kMH2Il0ES2nXzy+9wVvMjpk9g/8+SnSNulVTkpOy1Appr5pZm6vWyeeu7Q8+iRDt
	 NQb4Zgd0i9Hr7xu1sA3EscOEUs2LRhbZqYUxSPfUFeIQ3pTkxZSXDpgk4LFIGygij/805
	 vTIxg9yP7+cDFirbpXYtRahNrJoFiNhLMvHuqcJV3K1WWiLf2SkpDZGbErnFyQB77czDw
	 /K9lxLgmek4bDR/1ngv4gh+e62bliUeV5ypgGnHN1sZ8uazrpnBcBzdmjaYHaaqs0Sv0l
	 Ka1Qlws8b2s6TYhqPGw3W7pA0jGuqNG1m7+um5lKu/WDXaly9F4IhlIwwU24SIZuPtg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794329159;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=h/NzmMx/WxxoUPK2RZDSGStjl3Bsd9UdAA3RuyW6X5Y=;
	b=x1E8SZO2MDtGoze9mXV1zewPSheUsOsO5HOB6aqc1r6zdvlUgm5B7eW5dIgA7o1knJ6o
	 vD/Gg+DipuSc6gkGjKY79Qy72S5ivki8GwbtQYDgJOkMO9ByFhFnGHwoVLQqF59GJyJCo
	 t/HwARV7gdlIZ8VPid26RfB1SUsyYruI19uVA0kc21ax1UvQtEjlJnOiaeCgaNMa8kTcv
	 N6GaTqz1i7H8kg3+GN4kCmOB/YAqMh56qFE+l42k6cgdB3rbD7X/mLGpgt1OcAzDiHN+B
	 +EmwYj7nDYp3MNajSniyFHcBrVq9yYgz0Qb80DjpiaW+BYoiyl5h9E8fv6nIeXIA9nA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7B3691F008A3;
	Tue, 10 Nov 2026 16:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794329159;
	bh=h/NzmMx/WxxoUPK2RZDSGStjl3Bsd9UdAA3RuyW6X5Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=DOLp2sujdvF6YWy4q50TmuPWGV7oBTJH5+vGqnWe2xUlj7v70oaR6jpVMjszPIowA
	 OEJQE7P5oSlmwM3OVk0yqC8If2P2cdAhW3lxb7LPSLaDmmQybuE2QRg94RmNCaNt/Q
	 VB/KW6lHa+yLdutFYv9WhRa9JO68K6CWPAaJ/Xi+7oMIoISpss32o3EooZA1Ge9Csc
	 0lg/zpKBW/5hBknQbuy+2UhXbTs2ZFv7AVh90qO1O/HoVacF9ZbofnWPvgNzP5ky1i
	 N4WlT4C6ZCWEN7fhQa2iay47wnnADhKTEu1zUty+2Y3/AbZ24cYtYqflObly+mvKjr
	 BTPlDsqpY2Omw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 081AE48C00;
	Tue, 10 Nov 2026 16:45:58 +0000 (UTC)
From: Yongjian Wang via B4 Relay <devnull+echoowall.gmail.com@kernel.org>
Date: Wed, 11 Nov 2026 00:45:57 +0800
Subject: [PATCH net-next v4 3/4] selftests/net: packetdrill: add TCP black
 hole detection tests
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
Message-Id: <20261111-mtu-probing-series-v4-3-6f2e484ca8ea@gmail.com>
References: <20261111-mtu-probing-series-v4-0-6f2e484ca8ea@gmail.com>
In-Reply-To: <20261111-mtu-probing-series-v4-0-6f2e484ca8ea@gmail.com>
To: pabeni@redhat.com, kuba@kernel.org, shuah@kernel.org, 
 edumazet@kernel.org, horms@kernel.org, kuniyu@google.com, 
 ncardwell@google.com, davem@davemloft.net
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 netdev@vger.kernel.org, panweiping3@gmail.com, 
 Yongjian Wang <echoowall@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794329156; l=4124;
 i=echoowall@gmail.com; s=20261026; h=from:subject:message-id;
 bh=+yXa+nBg9+47003kOzkfKLT4ELxoq9V9aPGcdqcFMpM=;
 b=IQkfUZhuhzXRnrmF05eHjVxDMIzJsZaDAOHq9rsSFqa4TCE0LrqaQmnruR2Al7Or3YM+Irc/7
 Tk6PnTL2fbFATQ8eAVy41bIpcCtAHGUB7lJ+AEx3+jLGFFTKb2MFswl
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

Add a test that only sets tcp_mtu_probing=1 on top of the default
settings. A full-sized segment keeps timing out without any ICMP
feedback. Check that the MSS drops to tcp_base_mss once tcp_retries1
is exceeded, and that the smaller MSS is also used for new data after
the retransmission is acknowledged.

Add a shorter variant with tcp_retries1=1 and TLP disabled, so that
every retransmission comes from the RTO timer, which is what
tcp_write_timeout() counts.

Signed-off-by: Yongjian Wang <echoowall@gmail.com>
---
 .../net/packetdrill/tcp_mtu_probing_blackhole.pkt  | 38 ++++++++++++++++++++++
 ..._mtu_probing_blackhole_no_tlp_retries1_is_1.pkt | 38 ++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/tools/testing/selftests/net/packetdrill/tcp_mtu_probing_blackhole.pkt b/tools/testing/selftests/net/packetdrill/tcp_mtu_probing_blackhole.pkt
new file mode 100644
index 000000000000..95309cb4d872
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_mtu_probing_blackhole.pkt
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0
+// Test black hole detection with default settings and tcp_mtu_probing=1: when
+// full-sized segments keep timing out and no ICMP arrives, TCP falls back to
+// tcp_base_mss.
+
+`./defaults.sh
+sysctl -q net.ipv4.tcp_mtu_probing=1`
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
+// TLP and the first RTO retransmissions keep the full size.
+  +.3 > P. 1:1461(1460) ack 1
+  +.3 > P. 1:1461(1460) ack 1
+  +.6 > P. 1:1461(1460) ack 1
+ +1.2 > P. 1:1461(1460) ack 1
+
+// Once tcp_retries1 is exceeded the MSS drops to tcp_base_mss.
+ +2.4 > . 1:1025(1024) ack 1
+  +.1 < . 1:1(0) ack 1025 win 65535
+   +0 > P. 1025:1461(436) ack 1
+  +.1 < . 1:1(0) ack 1461 win 65535
+
+// New data keeps using the smaller MSS.
+   +0 write(4, ..., 1460) = 1460
+   +0 > . 1461:2485(1024) ack 1
+   +0 > P. 2485:2921(436) ack 1
+  +.1 < . 1:1(0) ack 2921 win 65535
diff --git a/tools/testing/selftests/net/packetdrill/tcp_mtu_probing_blackhole_no_tlp_retries1_is_1.pkt b/tools/testing/selftests/net/packetdrill/tcp_mtu_probing_blackhole_no_tlp_retries1_is_1.pkt
new file mode 100644
index 000000000000..0421458fba45
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_mtu_probing_blackhole_no_tlp_retries1_is_1.pkt
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0
+// Test black hole detection with tcp_mtu_probing=1, tcp_retries1=1 and TLP
+// disabled: when full-sized segments keep timing out and no ICMP arrives, TCP
+// falls back to tcp_base_mss.
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



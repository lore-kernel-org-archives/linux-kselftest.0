Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793689786;
	b=4bnRBOuDFPQlyuYEwQoPR3feKF2zslnlfo3CFyl32cyOSeQBGMYdzBdks1th3Otvrs4G
	 EGeIgFB/HPLBArolfPGPCnws5OxaVb64nNmOwIr0QRNOYcQZhY98tCr57nI1WXdo7ySGh
	 YhKRyu4Gut2F8/lkZ9KH8TQlG8mT43ZB2yWgVCmIXFjQZ+RASufm0DmMea+F2G0RM60FH
	 F294tB8iH1S36MBUVSof0EV8c2FrtJgaCCbuNu2tlTIsat6UNlmqfLdm9YaJsSyY1jEz8
	 ac8DeLefV0dmDLw4cKEkhXbbP35kOnT7xgp/oVXWnr923VRhaOghmXNU8oGIrfs4pTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793689786;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=jpd8M4Q159pv4wav7dcjIJjGCvakvp5m27ExAjzeb2g=;
	b=zFocMX7nlGG5bQ1RooOTV7O7+XoSi6vqZEmohCuE40Eo5dtSATOR2PkrL0IUeQLrbOBN
	 KTDTH4S/m1oWggYH6znKbgOewNN97sOPuZHfckC5ZZ5Qt37p1HwXa+6Zjy2mqavBuammT
	 1vGSNyYXhfxHfmOKgbLVy08eTuPHfZSiuW1PjLSEtQ2Pv7MFAoPckstbLUlRy4LJHwe+Y
	 53i086aiRR53VwVWXO2X7umTDGjrvg6tLADMRJigOR6Jdk4rxR2alakd9snJCYg68Pidr
	 UwqD1HSYZXN4zBDvqZFEFdMYJv7S2TcJBsMgoQTsvsM+0ylwvQiPTtSI4bFUFXBXHiw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F3M6Boa0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE901606A331;
	Tue,  3 Nov 2026 07:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F3M6Boa0
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793689785;
	b=h8pkVwoZ/JDkon+4J6h137J4Hq3VE8UDM96cTFQCJ6RcsJD7S7iXlS8+wgoI+uzKDSOG
	 pRNHdQs8jxFjQhc+ufCz0GXw4Eyki2ICxEvvGw2MroIK5jA4P4UxZYhLJ1iUYaKGJxDIh
	 QYcei3WFHVFLmow0exfvU18SzUDtgGT46NAMHmllx9BonoAiWkKHEkNnPXpmV8mOb4dsr
	 PoSt3bsT5EQwlLMd27XtelkpWeGEn3me9RKHBeu9Gg8I2Zs7DToyiG1ifQ481KCdT99+g
	 mc/RFg4vUm4d0kskOv6l76pJB/nABBA+6skpidYP0DvqGcHL29sEOYCTnmOLRCOdsTg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793689785;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=jpd8M4Q159pv4wav7dcjIJjGCvakvp5m27ExAjzeb2g=;
	b=vGgedSqvnyejuRonBCrS2qmfbsA6av6/iBXS5IpeUVn0vjcvaJ9FQd7Q1Gk1UhR7R7H1
	 CMhDPr9Fdqt5u3pYJr4qbeGrCV+8FrNddw4XchE3S29TPexbCQ7zgA7BUqlbfflyVaIFY
	 /cVV9JKPt/fS07TOACFnancSOJ+kSKb6hmjgMtQGvdvInP8k1njhGezqxSdI15MU+HTs3
	 Kfy0zjT9auDuVfZd2ap4mLk5k5/nf+V2zNbiqYpyWmLViTUDIoeTswpk92GBNyKFrTRny
	 BGlXX3qV8dZhhHS+InGrujDifus4231TsVa3VreJhgXq7zAN6AAvxzcBLkxQtfO0EZA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 51FC01F00A16;
	Tue,  3 Nov 2026 07:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793689785;
	bh=jpd8M4Q159pv4wav7dcjIJjGCvakvp5m27ExAjzeb2g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=F3M6Boa0iz7HfNl85i9LObp8JhR7/pEVJkDdpR+tHYp4PSsdFnsgOygT0NoNJr9jR
	 PbHfOjp9CI/ogPXg8ZWvfKzOozvWim0iT7JFj1jLKrtwTitFKR57jvkkW+VuC/yldq
	 dcnMNiwa733cqKh1jvuRMYZYc83imi/MHDxTN8pmLsjN6hFUru07QAYfAt5v/bUcfm
	 YqXMg5MTvKjUyH3cYkEJIPY2UVDck+Ahc93Mw6os6k8CWEtYESUFlHINgzqRZbGtLf
	 TKDyHPmQSzYhtpUEi91135X1nxkP7vZLk9kg6PxPXsQhlyV/u4unNhaNNm+NteqOZE
	 +PViGJLRAIMEA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D260F46819;
	Tue,  3 Nov 2026 07:09:43 +0000 (UTC)
From: Yongjian Wang via B4 Relay <devnull+echoowall.gmail.com@kernel.org>
Date: Tue, 03 Nov 2026 15:09:44 +0800
Subject: [PATCH net-next 4/4] selftests/net: packetdrill: add TCP MTU
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
Message-Id: <20261103-mtu-probing-series-v1-4-a2809e725aaa@gmail.com>
References: <20261103-mtu-probing-series-v1-0-a2809e725aaa@gmail.com>
In-Reply-To: <20261103-mtu-probing-series-v1-0-a2809e725aaa@gmail.com>
To: ncardwell@google.com, horms@kernel.org, edumazet@kernel.org, 
 kuba@kernel.org, kuniyu@google.com, shuah@kernel.org, davem@davemloft.net, 
 pabeni@redhat.com
Cc: netdev@vger.kernel.org, panweiping3@gmail.com, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yongjian Wang <echoowall@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793689782; l=2709;
 i=echoowall@gmail.com; s=20261026; h=from:subject:message-id;
 bh=6H7bHmrcx+NwgR2BDbVgQR3Zh+5FGAud6AanMriiUKs=;
 b=Z/GA0Y6i+dZnZVBsbrZBl35HRWY7bWr3uZRCJ2BQXndSsU/LHYFkKS+d/nbdvQt00JFCa6uLr
 0th1LgoBYMfA6se/7PlqRzkVQLeR9N7xmKg6JZj/U5v8OSE0bSZleH7
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



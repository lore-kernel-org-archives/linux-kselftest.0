Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793689786;
	b=CwT+dekZQ+JOw3O1ZHbZhJh4ugdJt2/QfhqIO94YgCAHJfnGGq8iGmUw1A7+yB/hvVKT
	 aTzUPk274vl402Z78GkmTHTg2iNSMbs94Rlf9Vi5uz5WIOTvHfi4qauFT41nFGm7vpYUZ
	 3YKUp3ccZZDXXuzk0pJt+sobg/GubE800XYapQyPBXbBaXDOsaYR1/AV3sCyUuEJYgh2f
	 WEI7QQLsTtVNcjwaB97VqbV84EwpeTAuLokQkHMhqBFSFU9hLZJyTdqSe5nZuQBahfPmq
	 o30j6HCzEa2V2KHQAGfJE0zUYPqPJe384GiX+6LJJLUDDWcMyASbHplHBvV6u+wxnhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793689786;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CeOxTxKArDbG7RBezkcPwmjmZobpCK7vzK4n/jgzMSk=;
	b=iIltCwSvf91WJQMyWOs0JS6x4smAXDfvdxDGA1g7WjGq8K/q5Z5+7I6ahaEDYcwnSzcD
	 Q3X0nb7wUkj581D3prEfJytT/k527BGHzSMAF378PDNm9UPy43IoS1mL/14ovLQqLkxSj
	 YJCvBAePFECPUIYjMOZK/MepLQO8J6oVU5YtAxuW0Jbwre0mWfLtRNyufBhs0xoPOUa4K
	 Y7r7PXcqtGXaLNAymp41OhKDifftqyQxzZ1ItAR4dyI9Cdu05Yvppp+h8YYM76AysyKz/
	 C2QbW63EcNHpzZ1x1OwKN/G8+MRTv0YXmCyWw6PjCUxI/buAMx7IJMnOOggflA/niUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QWBRh9Os;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391B3606A337;
	Tue,  3 Nov 2026 07:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QWBRh9Os
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793689785;
	b=kaQgF2eJXY3NysPhIgmGkbLTcz3D8jbCbecKCjSnb9/QM4O7PRuWeJwhLs4Iw6S0Dct0
	 E5qYGeX2ycet3i6Mf1Swlt4N0AAaqLnFpTHa1l6gvMw7tlQIr0OgWZFCyaTuImhrMS5UB
	 lzbSS4QEf/ryubq7HP9601Cw+jFuzVFejeA0D4LHc6+GxMcRdQQYRnBwgbj0zYgkdp8K2
	 oLv9PfxzTLCAjB/mxl6d5xucyA5zNEG2Au+VgvQEs0v0vuRYH8mfhVmLLWIbhYaFJafE5
	 SImOYjal6uT9NA6It1O34oFBnHPUWJSlaix//QYrKTTueeeXa0oH+kqXvnk13OtN97g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793689785;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CeOxTxKArDbG7RBezkcPwmjmZobpCK7vzK4n/jgzMSk=;
	b=wNctcA3ZeY0sKRGOKvOZn36kN57r2xVbk3V2wpA3CRmdwgxrAAL6TTwS2GO95jpminW4
	 X1Kyz3metTEi7ANIRX+XT+J5NGp/R+PAecgnSg/ex1dVj7B4gxj1qdK39++zJlkCLLLZV
	 a/Ev6N3b3J8BmU8lr1pulFzh01LcZOtexFe6SIbIxv8mImR0HsBjPYQ7G88ZAMLXedOQb
	 VpzySBdPn56dgzREwQzQpPLp3cElFpvF9nt/n2/UAtFDzRyeS+gwxXlDddHOa82jMXkCm
	 k6NYmAl+DYJMQqm4TZamIvsIwwBq4Yen3W+zTx/h/ecfGxk1UUi8Gv5rZTBkVOA0IEQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 428A51F00A15;
	Tue,  3 Nov 2026 07:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793689785;
	bh=CeOxTxKArDbG7RBezkcPwmjmZobpCK7vzK4n/jgzMSk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=QWBRh9OsZHSv30tQhvrcCPO+1NoZuWZoJaRjjlTpoYEk5NhrEHBTusa22mSO+/5Ty
	 bs8MOnXO1pTbRrXFjtxppAMwbqKm+pRptgYTX+48I8FhsQtjZyGWWbPOrPrkDJ4Vhm
	 P6SBG1GkuEc7kYLIMV1lqZZuQeCy+f7/ch+cogIIbfOjxdd83b4AKCIIMIM9ZKiYSJ
	 leWgnMqet0msrCdU6/2OzYffvSSfVr0T7HmoFekSx19Yy2+TjTKSSZ8YrmrugEJA8H
	 yIlu0wQVZyRVesvSW6OkFjT7flh3yoWPfkBy3dbcU8Ytr8UBPEIJJWlEQ6LJFaPFfC
	 0pjuXCNTyPkmQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C3AB246815;
	Tue,  3 Nov 2026 07:09:43 +0000 (UTC)
From: Yongjian Wang via B4 Relay <devnull+echoowall.gmail.com@kernel.org>
Date: Tue, 03 Nov 2026 15:09:43 +0800
Subject: [PATCH net-next 3/4] selftests/net: packetdrill: add TCP black
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
Message-Id: <20261103-mtu-probing-series-v1-3-a2809e725aaa@gmail.com>
References: <20261103-mtu-probing-series-v1-0-a2809e725aaa@gmail.com>
In-Reply-To: <20261103-mtu-probing-series-v1-0-a2809e725aaa@gmail.com>
To: ncardwell@google.com, horms@kernel.org, edumazet@kernel.org, 
 kuba@kernel.org, kuniyu@google.com, shuah@kernel.org, davem@davemloft.net, 
 pabeni@redhat.com
Cc: netdev@vger.kernel.org, panweiping3@gmail.com, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yongjian Wang <echoowall@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793689782; l=2271;
 i=echoowall@gmail.com; s=20261026; h=from:subject:message-id;
 bh=2gf+VU4SH9z04KrX//6g8/b2rrK3/ddnLXUqOlblf40=;
 b=TOlfFyNL2DDDW1xGgYtpLr4iNZk0fNvFsMg14vidZ9PHezdHAv6RMNSsiy2lZctdsgk2N1uvv
 xhp2PmGAB+DCXm7VIxQz3oxxsKivpbCrNqmLm7gsDKUMXLgC18gmX0H
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



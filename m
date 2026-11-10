Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794329159;
	b=gLErduubQspcivPiLahEiQkRSSCjV+uxiK/CnCBZQZE3YglYtTbR+2Tg2B7v0Rb5Ta03
	 PrvaXZcBtuH7ZjSMAtlQzDCqGo4NY8GapuGlUCSAEZxjjk6TG7SC8u7TUWcwL1V7E/FCt
	 cD2xXeOudnTXg/Hcf2PW3yBbNsqjPAT4SQRcbYP48GeRkqp7oU7f4zLi9o5BZ+uMMf/OK
	 dotDHa2LPw9OQmrvwx7Sp9g4yuog9ztuPyaup6E2hMoR1MxZ/+MoF6rfG8dIOileaCoD9
	 rQJ5cLcKCM3SgcWxkdzhTm3/KYfHhFxL8QYVvQtl9aK8IdHrWzJht0u+lYr32UnS92g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329159;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=yHGcCbfrpGwBJxir5Cx0kWqq2YkGcMrums3mCpUF4D4=;
	b=IkX/RnLY8mffabHIVgSDZny+TrD4KYZCmkC2XJf/P+gs4tbhOeBOtQIN1/X+6CbteMNr
	 Mmnl9XmJuAdlzXjSo7H3jvXhBvnAjlbi6EBeaiEeK8OXb/KQWS+XmtD+q9F+SU2Qw4Eay
	 OwoeAFd4rojy/X26XfXooftP8XnP5fuLzrASYSEZaL4xGiVHOIg3TBlV0Eq4XBTgpnxV2
	 S423d/UprkDwnhgkZ9/aT3kwhoJSTILmnE1RtktKywsB/BJAgyuLdjxtsnUuURa5vrlzi
	 fyjODefhP9Z8fbxs9w2Sj1Dn77Hi3v0wuPgxKCwZgZAa6AfIF2608wPrr+OpihQvp8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D4zUEH3w;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B1D606A321;
	Tue, 10 Nov 2026 16:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D4zUEH3w
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794329159;
	b=3Rw/N3iYyZFku7BFhxoqxI221HsrNOmxHGN6NhwigBQ/AG2CQcSoPVD0J3fV25+ofXDi
	 QJdoWOyrAdLrsFEQka1HmQGn8sgweYWEXfs8D0mkBjH/RBitc0EmHzlrbpMqjLFnXwA1H
	 1eF9NiKqx678xF6mdXeLWvzpOhXhQ00rzMDgaKFPuFjGbNHd4Z0dcrYIi0oerHptk0I5M
	 Jfe/96/odvuQvQDtm1j5fxHa4s7OXjSuZuNicsC4JFjMd4CiqVlegqYr0ndF5ybW1sDff
	 0PUJqAXBqtTnFnRGi88H03qJ1spzNn/5XwBofJTVbiffW0eppDtG3JSbql9I3G/FfMA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794329159;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=yHGcCbfrpGwBJxir5Cx0kWqq2YkGcMrums3mCpUF4D4=;
	b=QGCpB4AnZr4YXrXMZgJ0YkqzGhWGQhEHgBTjA9lpr7gsAAzoeNjEUfIuhr8JKL/YJ93z
	 6yS4TXkbvyGJISn72h6gnq88Sq5GUSSgMuhJYSLYsmTNK+mFkAKvDmH9y0RmPA+eVcqzm
	 mZxqcsDAfo5oWmZKRO2bYyagmRuDxWEzf54fIPjvlU1ZWXHF2eBeQhaJV2c/PuW1EU+4k
	 UK0uoIGbyDaOyzOA//RZYIxBBWVD4nRbPvowH02alEtLh5zAIvH69WHT5WlWtTa/89w6s
	 mLQiG4qu6ZxMcAZjLQr+I+4vCoZp4Ix5myFlbHyZ92ueBKpAczzju8lgCZAtoa2gM0g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 691C31F008A2;
	Tue, 10 Nov 2026 16:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794329158;
	bh=yHGcCbfrpGwBJxir5Cx0kWqq2YkGcMrums3mCpUF4D4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=D4zUEH3wYhhNPjKpEsf9OGhIAXc0+y5ATdeDUDMxLJSmi9ykOxNfke54vzbD76K1t
	 YCHQvc+LBrkTxPp6DGNQXEANFuU1EkzqO60deGan53UsoBbwCCBOIDrFoggnZ7hfv1
	 RMTJ8sJIXQFdPH9MhlHn05UrZjmMcVQFUkEutWnSOutYs6Zmz2C7uCWQRp1C8OeBHR
	 7PqMxqncTv3gFBPn0ZFX+K/J7CHjkvsUrkLW7Af4GshcyrLKnQFcxtuqPG1Q7l1oYT
	 e/M0FZ/I0HuILRB5RckfVxT8GwT1NNOue271lK5aWh6PgF4mG+UwztG5nzawO2fcuV
	 2llefB7pBR1vQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EA33348BFC;
	Tue, 10 Nov 2026 16:45:57 +0000 (UTC)
From: Yongjian Wang via B4 Relay <devnull+echoowall.gmail.com@kernel.org>
Date: Wed, 11 Nov 2026 00:45:56 +0800
Subject: [PATCH net-next v4 2/4] selftests/net: packetdrill: test
 tcp_base_mss on passive connections
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
Message-Id: <20261111-mtu-probing-series-v4-2-6f2e484ca8ea@gmail.com>
References: <20261111-mtu-probing-series-v4-0-6f2e484ca8ea@gmail.com>
In-Reply-To: <20261111-mtu-probing-series-v4-0-6f2e484ca8ea@gmail.com>
To: pabeni@redhat.com, kuba@kernel.org, shuah@kernel.org, 
 edumazet@kernel.org, horms@kernel.org, kuniyu@google.com, 
 ncardwell@google.com, davem@davemloft.net
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 netdev@vger.kernel.org, panweiping3@gmail.com, 
 Yongjian Wang <echoowall@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794329156; l=1599;
 i=echoowall@gmail.com; s=20261026; h=from:subject:message-id;
 bh=3lQsY78vSTiBOpqp4bdac9scSAkC/asJAFx3o/C4nk4=;
 b=KlldzqTr+zVzxlntQk6qL3845h9aSVYsDMJB7yZ+xOEeVyu5/nQTgumE/1UvAkJnrWzaeoJsI
 dv651n3WLjlA4RQ3jCzJFjwofZsYaDxxIZUSau/vUpeDfmsPiP2xN3+
X-Developer-Key: i=echoowall@gmail.com; a=ed25519;
 pk=9XP6JhqjjPsHCF6UZZZTeqTRnXIa4+ufggnxXtTJ+no=
X-Endpoint-Received: by B4 Relay for echoowall@gmail.com/20261026 with
 auth_id=1323
X-Original-From: Yongjian Wang <echoowall@gmail.com>
Reply-To: echoowall@gmail.com
Content-Transfer-Encoding: 7bit

From: Yongjian Wang <echoowall@gmail.com>

Check that a passive connection starts at tcp_base_mss with
net.ipv4.tcp_mtu_probing=2, as an active connection does.

Signed-off-by: Yongjian Wang <echoowall@gmail.com>
---
 .../net/packetdrill/tcp_mtu_probing_passive.pkt    | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tools/testing/selftests/net/packetdrill/tcp_mtu_probing_passive.pkt b/tools/testing/selftests/net/packetdrill/tcp_mtu_probing_passive.pkt
new file mode 100644
index 000000000000..14bae144cce2
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_mtu_probing_passive.pkt
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0
+// Test that a passive connection starts at tcp_base_mss with tcp_mtu_probing=2,
+// the same way as an active connection.
+
+`./defaults.sh
+sysctl -q net.ipv4.tcp_mtu_probing=2
+sysctl -q net.ipv4.tcp_base_mss=1024
+sysctl -q net.ipv4.tcp_timestamps=0`
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
+// The initial window is sent with tcp_base_mss, not the peer's MSS.
+   +0 write(4, ..., 10240) = 10240
+   +0 > P. 1:2049(2048) ack 1
+   +0 > P. 2049:4097(2048) ack 1
+   +0 > P. 4097:6145(2048) ack 1
+   +0 > P. 6145:8193(2048) ack 1
+   +0 > P. 8193:10241(2048) ack 1
+  +.1 < . 1:1(0) ack 10241 win 65535

-- 
Git-157)



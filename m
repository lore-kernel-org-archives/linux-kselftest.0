Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793689786;
	b=pDnRn0jpG5HIAo347flmSMUHnwLoU9q72ElgGV7iARsuHfwg7InGhWTdo34dXy4fmGsI
	 ZUxBsc8p46cOuiW0GfLc2ZYLTj783Gk/SKfVwRxYKaGVVYWlylxuRnXRJ3hxNCq7erej3
	 AxnLhYmKt29hISGKAkXQ80Hv61BVtYC/Tm6jRJqXgmoX6xTx4dOB0SX5rmRBPUz+899TB
	 8i2ML1o+L4kX6Xvy6FfIrIMEizAJLU6PjCfxDtqEKVapor8h+g5r019OFWvxDZIg+Xk3q
	 75VhKG32AYtO44ZXOIhy9BXKUDAHVP8GnRUzOpandNQG/gbG8A/38wluIrR5Bk5P7HA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793689786;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FMoAdPEcYt4xKfDhScvEiOopiYclkGEqczu8+BGmiOU=;
	b=5FuzAW/Sb7qYm7XYyA9oFj1jBMSL5xQSDX4IslHAiMs7dpD42C7VNgto3Y+lxsu41tlI
	 BJ7TmT6egSFdpDG9N9MdYaTz25ZC5IEm6aimbACRxaUqGoDxlbLepUzfXgT3uR8gnake1
	 wsyX8fXJ/+msfRkVVzMB1MFe0wDc6cWDlRYVrE/nB8FuGzXqJATPlbrf2BUC+NMvJ6/YP
	 ul1W/xh/ZaJz8aMx9zRqn0Fwjs1gP+88yGj5s7tLP2DNu3Gzq5h0mYIsgfH7skPh0EWfA
	 v30F/Ku82OkAe4Wu36o0hZkDpGXBFOwejFysWOgk5cgJLpJ2/3kjLID68Z9xoq7dMVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S+X4GeSD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B98606A32E;
	Tue,  3 Nov 2026 07:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S+X4GeSD
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793689785;
	b=dINCCW6PlUGUugbqtGbH9jsYbzwa/XgtJus1ERGw7s5rVAs4MTu1g0jpJBnsrbopdqAP
	 tlI6irY8gdJbXm6qiOUEbKZRlUdOITbOebs39tDyXPA0nw4fO3PIT//YU/Bl8s8WUXY/X
	 ZpfuRqz2HN1uX58n3MoVybTz8CB5YILt7de1VhLWYx4ICxAqJpi8A176ZpLvPIZDgDES3
	 Q078bHz84jXpk65SfWUv/boam0z+NBGpdUzy2xj3DnBnul3wWs9EGwPjwV5+zlJmKzIVC
	 lblR58Uy/SCkB7KTVBeEsXj7GneygfrYEk06erBwaXXgT5LVa4Z6vrBdNfs6J7kPNfQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793689785;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FMoAdPEcYt4xKfDhScvEiOopiYclkGEqczu8+BGmiOU=;
	b=UtmdNf+yOwlPqvXzRUwSbECpKw9knWqDGhgjHjhTBzRZC0Mdivq0BYx2GLg6Svm6hyj3
	 AFOlfot2ew8FUwyqJZVXT+M5dAL3hMv/gOZJKhGlcLIzRdN7GOx967+0UDSkg6zYkB/xa
	 NmMn7AlQDHuKSjDCUhwhvAmx4BlnHP79Tvss/KB7oI8yzT7Z8t7Q2xv9xFJRT+Fr+l49c
	 qaBJ6wIGQFzxw85I7j72fFCy9V/HAPlbWHJ/yev+5ONk02K2ySMxQr1rB0nWmEd34+TTc
	 BQxDvocC5NyviJvwhei6gBXpxM5+3sPq9Zv5xhGP4VEcDPxcRllfPu1n0ShQs6o2LBg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 343AD1F00A02;
	Tue,  3 Nov 2026 07:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793689785;
	bh=FMoAdPEcYt4xKfDhScvEiOopiYclkGEqczu8+BGmiOU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=S+X4GeSDoGC0lU+dPxx2xdY5BfZk2emjdS9zJ9PqtS1v95mHtXTcClZfGEP0XxCjO
	 2j26Q0CC5RBW64xd1v38EtK6TajwWJAS0/91+z1jpHXlhJTtsOBeg1V/TkyDelBnNF
	 13zfTRtxzVt+UsS+bzRa5jGK1XVak5ob/Ozx2rLFBadWeBVAFKwMOZ+3kwm2r7qIA6
	 okb0kCBdlHAti2AkXf+Th29GE5eMZGZI8QKTmoSg+UCo7kw40VLK7ahHLvWV+HnQ2X
	 g1J4LuNHm5gGtxUYm6KJ8YVhZFovilMIdiCeWJpZwo1JMSk/pOY+HzpKHoA2+bLXCm
	 8ocywFYn2qARA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B35B546811;
	Tue,  3 Nov 2026 07:09:43 +0000 (UTC)
From: Yongjian Wang via B4 Relay <devnull+echoowall.gmail.com@kernel.org>
Date: Tue, 03 Nov 2026 15:09:42 +0800
Subject: [PATCH net-next 2/4] selftests/net: packetdrill: test tcp_base_mss
 on passive connections
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
Message-Id: <20261103-mtu-probing-series-v1-2-a2809e725aaa@gmail.com>
References: <20261103-mtu-probing-series-v1-0-a2809e725aaa@gmail.com>
In-Reply-To: <20261103-mtu-probing-series-v1-0-a2809e725aaa@gmail.com>
To: ncardwell@google.com, horms@kernel.org, edumazet@kernel.org, 
 kuba@kernel.org, kuniyu@google.com, shuah@kernel.org, davem@davemloft.net, 
 pabeni@redhat.com
Cc: netdev@vger.kernel.org, panweiping3@gmail.com, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yongjian Wang <echoowall@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793689782; l=1593;
 i=echoowall@gmail.com; s=20261026; h=from:subject:message-id;
 bh=dWQVgF2dw8T0SSpgY/AM6QslZB53fGfIfx1Y00i/T1Y=;
 b=EUAy+44N/Aadqf+6luPFXKqwJIevQdyUzQ8tGceh1AG3X5RIO09T99kBFBskFg2pC/dWI/DzC
 7TsdxEjlfsaB1lNzfSvYe25BQNTlX97QXPV+usQkg4OdWtCv6n2ll1a
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
index 000000000..14bae144c
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



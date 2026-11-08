Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794148795;
	b=jXL5jHfIpcQuF6HIMbWwIkwwc0GndEg9UPqlzNJFtJXSVe94x3YLzN4c2Az0MSvR79yy
	 vakcSRoBpyNZJGt+3RZSEFmTr351Er9QMxZRgb0O8kHy+K0Dkk1DfLbxjDOA4BV5EQUxZ
	 RCcNtuTWc+avx8m23jWqppMarSvPnyMsQihGdaWWx6nKRH073BOiltlIjHMF4oJZwQu3f
	 mLDzACVEMOr230EOrRxyIbS5703fSZwrXdcrE80tBMm1v4wnTMfwNEieQXJ2sDcitp50t
	 tu/TDT8riawP0YN/91sm/YvrWpMNklNaDRF4Mf0xPuPC/qk+dfPNbw0Wu+fTtC4EBcA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794148795;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FMoAdPEcYt4xKfDhScvEiOopiYclkGEqczu8+BGmiOU=;
	b=sbG9XGnTetUr7TkVvioWYBOmfREP6mjsdy1J2GIoLyMkPiB1fr9ni7Iw9tJsfTbdflD8
	 Zq5NkimyxFpwefqn9ze8mDTzBnjzWxQsYqAqzCBRUpvCCL9aXlN8JeEQUN6jQ83+BL2Tw
	 8GNb2Si65U/4G9kidvW8zUF2Mg4zRC4vIbpJFygL+QjmSFcQzIi131ngK+TIVQaY2N3Wu
	 40DF1uKg9BWToob8bRkXRbjVKGa5y5Zkoce7F4LL/3AciU2pHkwtubxhgtqs0o6fXoKrt
	 Vl2Q38O2AC1TK/wTIkiH6eb04MBXrmhKauXaofGqxmRixeeDhFmANobqYm4QijPggFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eCaQUiyO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6435606A320;
	Sun,  8 Nov 2026 14:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eCaQUiyO
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794148794;
	b=aNkGVyxrBbbikCN668/flzS34u3NqryXGwDi8QKwgtg0hECTcM6R2QLj9ppE9u70J5CK
	 FYWSrV2LvkXndDEwG2wVO65EPTEQsvB7V1+tDc+9xFP0kWEopsJg7kn8WCVAlOBhwIDkC
	 vdCkMAE+Cgl3EGBxDJADEocnZrYxHnS/IGOSFh6L6fM5waiohb0iLq2guZHZfTgkbmo3g
	 WsP4xiLGzBwRQqD3O64ryKgYPDFWK0Koqh8vOPFXeoMgc/W78TE4rQ2vexumY3tRIEFC+
	 W6m3O6EZ77gCdSiTK/vfZDJFTjbxMiAu3tep1nouVh/cAYfdFTsHEQn8Q+K8bTjZrxQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794148794;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FMoAdPEcYt4xKfDhScvEiOopiYclkGEqczu8+BGmiOU=;
	b=B5Fs3a6t5Fe6HHSaxLn+EZ8xmFUzMmCDA7GlvwxjwVEF97jeerSD+pp/fZ8dL3G7v68A
	 qrSUeJmZgkx3sdTs/b4qTkxX5LiMJAT7kfdcGNDVDI/tByrpFr3qUMshT0R0Oue6NBFXw
	 7JPlu8ZiCK3alYEBCYOXRpHiadZPJ+YdR93BotsyHpMTMk4klso909nehkZRzEvVPatdu
	 OXvOpUvmGY+k0UHZgRN8Sl3JEggoMNFmYeOh1rtwdLBR6vVF5R4JvBP+EVCCtGfHxzd3l
	 VMoFLrkTdTHXZyH/86qF9ks9pWDD7fFeKBHHX4+0TX+dGINQx7rUQpGev6eictvdF3A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 07FA61F008A1;
	Sun,  8 Nov 2026 14:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794148794;
	bh=FMoAdPEcYt4xKfDhScvEiOopiYclkGEqczu8+BGmiOU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=eCaQUiyOoeulPWd1jbleynPgE7eZ3Ty9fm7XbqN7OirQTBApIZPLSvLt8VH24GS0B
	 UsgIanCOp77lHGcbawFvqAkbvceTHL6j6SCl//NlVyATYSAP6AN1sm8+kI5cRUJZwl
	 6ykpadFywOa37ZJTEGZ3vUlRfzpGFnvt+YAfwrrw2v0mnrupXtG7EKMXSR8Ds7RKGc
	 SGWor8tNAUs+9xJkpyLwk72sa5CGPA4iHLQBfGNmMJr4/SkC8WdpRS7jKgYj9apShg
	 XDO7+euT9zuyc2279h7QEQ0E8ce7iK7JY14cv2cv7mdKdrBRdc46lXiUz5lnBJVgnT
	 5TAyKhU+jwQ3w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8520647FBB;
	Sun,  8 Nov 2026 14:39:53 +0000 (UTC)
From: Yongjian Wang via B4 Relay <devnull+echoowall.gmail.com@kernel.org>
Date: Sun, 08 Nov 2026 22:39:52 +0800
Subject: [PATCH net-next v2 2/4] selftests/net: packetdrill: test
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
Message-Id: <20261108-mtu-probing-series-v2-2-355d6490c3db@gmail.com>
References: <20261108-mtu-probing-series-v2-0-355d6490c3db@gmail.com>
In-Reply-To: <20261108-mtu-probing-series-v2-0-355d6490c3db@gmail.com>
To: davem@davemloft.net, pabeni@redhat.com, ncardwell@google.com, 
 horms@kernel.org, kuba@kernel.org, kuniyu@google.com, shuah@kernel.org, 
 edumazet@kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 panweiping3@gmail.com, netdev@vger.kernel.org, 
 Yongjian Wang <echoowall@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794148792; l=1593;
 i=echoowall@gmail.com; s=20261026; h=from:subject:message-id;
 bh=dWQVgF2dw8T0SSpgY/AM6QslZB53fGfIfx1Y00i/T1Y=;
 b=w+o9ztOdtKWCEUBar9Cf62EYRn4QOlVk7ppE9m/R/+dUUhG/2pcVaLBJtqTQWmkp4PD/v/mpk
 hEcobO0HMGDDCsnGLco1DDnc/Dd3vlC7SSSKVdMQd5dM8w1sKEQ18qO
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



Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794242680;
	b=o6DZoI3G+FrdDtgV7VcJGyFWZ3OIpncAJDeGvEhdSEnf6iB5/koJY6TWwmF9/RGHdeeM
	 655gphSVhMDARi9Lon+PNorDTTuy0NwTYoWq6EZthUqlVgulLWR9gAHMuc6iFZvTZvHgO
	 M/pz4p88GjWrTew3EF/wOCqCfyFXjZeKty+OzrbUBbI9y+cWQbQnduOT2GRxk3DXLwQgg
	 znW5pKM989vpE90ZPDXbfknJT8CpwA7bx3ftc1otXK/SRbCaWZI1xkfa8Fgqx/IG+j5oS
	 iRkQ518CRwvM3qOuIf7N8KvT6oeY9tt9ZX2LGsz5J9IbAgxQtV6PTIjPMPUfMBmbyAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242680;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=8y9Jl+1LJ8OoB5nJzl2Bt+QCd/i+vREbZWGx+2qkt5U=;
	b=jbqYb4FedY7a+egb8BsMZwFXp/ME/lZ7BVHDkLwv+UnA+aO0GljpNqJMpzMdRscD2hFT
	 qbV1o0DxDjGNuJlLFIfafcU1c+HDIYmuVRNmc5NlogbC/MloZZzQxQ2Gzfc2HHbPD2ecx
	 Wy1M0dS7NSMc4llhStSUzwfLvf5NZKR/yC+YWNmufWOHFqPUBRhZChEVBq6if39pvv84y
	 mpqi8Qds3A/eOXL5h3gohItx0Y7j8x0gahQLJqD2+Kfq8bk/m04wJz6B0asA7FuE9FoyK
	 BcwBZ4Um2K8Og12ZD2Ubcrp75JSVeIkM7jFL/XHNOTpgXJ7K0ndDPZtXgnWVl32RwjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TGqkEQrp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C552606A326;
	Mon,  9 Nov 2026 16:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TGqkEQrp
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794242679;
	b=Eajp3lHVD6RwgtkCb6itK6TBMN3gPCF3D4EOGoifeH+mDWypFQsxi2ZhByJZRZJINNFl
	 veZxtRzqPV/pPbTGlNK0Zkc0mMVPQrNnl0u0zITgTSSwaQqAdSqQHWwRoOlH5mb3dENiG
	 b0ZsoGv9vrkBsTEeAMYts+52M5EUCuFalVCUdPB9fEbrMvPOsx6IoiER1k1aFWo/jRB0q
	 jP8/qa5xo+59nIdUg7nJsgmGtFBW0SPhEGTRugjT7jEMTJxBv1esSnMdNrvOSAIxxpB+B
	 lnbh1WejIORBfq+oBnMojxtNagTRScXqJWFwP0cK3TEGnosy1D87MkdfFqt1dbIDKNA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794242679;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=8y9Jl+1LJ8OoB5nJzl2Bt+QCd/i+vREbZWGx+2qkt5U=;
	b=3QWjciofk6xMIL3IUKQVya4w6m8kTNloyznGv1LJ/sMeJHi79jseHOaXkBWcfBPT5K7/
	 V4+mG8VJiLShgUF0v7BwUER/+VWQqTlqgtDi0kmgQ4VopVfWr0QKOw18XoBBbQ2sBrf6N
	 teMMv5HSG/JE/qtA11VgZnDIvDk9WY1mdAjI110mzg0GUWPsY1M6ZKcZbZnzs3ff1bHNI
	 iJw+tCni1NZEF/jjm9Z+FKgsQxCfdwbxWT78UYYJIQgvA0JQpWwkSA1s48tgaoQJ0E3lb
	 E+fAKxj5s0ga0H24zzAxBznJ2poYFOSkkaZ8IuYmAAxF5sjqEkLoUhN4vA9/R35/m9w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C82231F0089F;
	Mon,  9 Nov 2026 16:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794242679;
	bh=8y9Jl+1LJ8OoB5nJzl2Bt+QCd/i+vREbZWGx+2qkt5U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=TGqkEQrpnGnNmDlX2JNgXLjyTwCnVNew36ylvTYyKcnrMz+lS96a4IfVfNIVOYEAp
	 e3vfAQzELvMQtck1hGo4rs9597nzqREOEzK355nKZaHtH/IdDmKKcc7k5PdpGFsx9e
	 sp9gj1BJm+7L3ulEJ1IReSzdnX2F6WuwtIPotodTQah7HWB2WGdQuV7dYpt4hckT/F
	 plEwIw7oT3dyDHmZinYUxPOJA67mxvEUHON+h9KARig5HGbQxXn+fln/WxCiCDQaF4
	 F8OHPsMAF1eon8fWfPZcLkO5gjhQlxEimto1NzVPlAhfweQ/STixCPAwpGvw2DtWw2
	 X/MEvTQSZfwIg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 58D8148555;
	Mon,  9 Nov 2026 16:44:37 +0000 (UTC)
From: Yongjian Wang via B4 Relay <devnull+echoowall.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 00:44:38 +0800
Subject: [PATCH net-next v3 4/4] selftests/net: packetdrill: add TCP MTU
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
Message-Id: <20261110-mtu-probing-series-v3-4-dedfab25d641@gmail.com>
References: <20261110-mtu-probing-series-v3-0-dedfab25d641@gmail.com>
In-Reply-To: <20261110-mtu-probing-series-v3-0-dedfab25d641@gmail.com>
To: davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com, 
 shuah@kernel.org, kuniyu@google.com, horms@kernel.org, ncardwell@google.com, 
 kuba@kernel.org
Cc: netdev@vger.kernel.org, panweiping3@gmail.com, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Yongjian Wang <echoowall@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794242675; l=2652;
 i=echoowall@gmail.com; s=20261026; h=from:subject:message-id;
 bh=Mz0+KsqQBxhWJlyZhAiEUnDL/oZgfrLTgEwG3eDqtks=;
 b=E8pA1CIFCPMSMACXvS3bo4oPEIcOU1Q7aC5PE1l2aLEI7sUb8F92AtXZAmhcsrhJebjW/TiP1
 YmVX1Z+xl2WDlLnWgDNxa8bRYay/hON/Sere9+7/vdGdBfcWEd/rElO
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

The SYN offers timestamps and the scripted SYN-ACK declines them.
This also checks that MTU probing uses the negotiated header length
for the initial send MSS.

Signed-off-by: Yongjian Wang <echoowall@gmail.com>
---
 .../net/packetdrill/tcp_mtu_probing_search.pkt     | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/tools/testing/selftests/net/packetdrill/tcp_mtu_probing_search.pkt b/tools/testing/selftests/net/packetdrill/tcp_mtu_probing_search.pkt
new file mode 100644
index 000000000000..a48acff8685e
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_mtu_probing_search.pkt
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0
+// Test packetization layer path MTU discovery with tcp_mtu_probing=2: an
+// active connection starts at tcp_base_mss and raises its MSS by binary search
+// as probes are acknowledged.
+
+`./defaults.sh
+sysctl -q net.ipv4.tcp_mtu_probing=2
+sysctl -q net.ipv4.tcp_base_mss=1024`
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



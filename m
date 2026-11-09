Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794242680;
	b=s7sLinQ7lxQ8R2c4J6f75QtGpXKjr49GHopPIYUKIlghPDT7K1+LC7Rwjlu1Uzn1c1BT
	 jtdq4+645HKaUAKqYHsY03LDibQ96LP3K+MR4Er73mosVDXHRrrz44goyNB7v2GVlJ5Lu
	 dFnZlRw64xjKpuJRJWgLesV7pZjWMUe/MBUEi3VyJ62MpIuU+T3WjIbHjt8LBeZMj/Qjr
	 EmIwrIdhNAzcZQndq/IkUhfu1E+S/TYy3S63Khxo4yVO8KfpF6XCNLawnk3WgAjaz8iub
	 dx2YYC+kP3iauExgTkg0AJwunF7VH2H/h9s+vUGMV6Dl7hFHIWCzp9ekhnP1B9Uwz4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242680;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=yHGcCbfrpGwBJxir5Cx0kWqq2YkGcMrums3mCpUF4D4=;
	b=lOwH0/ORI/tdBb3gTR8zuugaPdauJ5ldfp7gqGxAv4t2nQ/dSOC0pV54AnWUXkGZUD5J
	 qoxH1wCHCV3cZbKO/T1oSlVpLz3VoHo3E+/Yw+JzvzR0rlDUUYC+2dmVP5Thw9PUenTvm
	 h2BSf0Niu1SLrJPAf3nwRUnoeIK168QQEmLSVvuBIeHrMC6+lt4aUm7b53bwpVOnPpiog
	 At3ixXPGufvdC3djlN/4SgJphf17s67ybdVhURByDAumqATDVAcEnDaN/b6xhYr8BeY2f
	 5u02tPGjUB3r5/OgfLsLBrtKQwvf9WrL2q8qtBMmjqy6r9SvA2cprJPLp4v7WFc3r4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EmuJY0+E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B73606EE8F;
	Mon,  9 Nov 2026 16:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EmuJY0+E
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794242679;
	b=wpdWT8TtioiNFx85SpIfzz/r3tNURVVwEDckKnn5di7WzHaAI9ntWiFjXXr0OMdbpsXS
	 oW/oKQ22hgW0JCg9HPR3uXVUsgByec4g0zIIRx5FvkyxM8JbBHZ5IboOkS+RJliLao5Nf
	 wnY8StenwdxgUzP/uyeYXP9noqQBowUVePX32R942A0ysH7cAjATBgCUAmCGmdjo0rZdG
	 hnSlcOwa9/eKLPtNLPypqXl7dSjfIEMpznIuQiVlFalvyO8qSTFNOCkSehqgX3k2MExLd
	 /msiMP1ksWyiR79aPP9K961Kdvi+PMsTtGhHWFZeiYf599tSgYVJ/4MMdF3oLULN3sQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794242679;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=yHGcCbfrpGwBJxir5Cx0kWqq2YkGcMrums3mCpUF4D4=;
	b=NTPfU3BNBrY5MVtC+ECPNBV9ap3JO47cwsXc/7W2GIZpW6ec61YKmmdbDS6w0F8rxWNO
	 9QXdjhWlByWjpaJ1ZHFyWiMG75Bs7JlWjKrNMxzs6c1Z4kx3HLcWT7f3ZuzoNS68uYm/8
	 4usVUGFjUXAWODAnmre9qDR3yGap4UFtAXr/T5ha1EU9Kgti/2pdGYiS4Wn6euCv8qel6
	 xva9hwn9DLLviwTNb2K8u3UjS3vaPMhypvCV9CWCS24i4AXc2Hk8IXeuej5ByHg2F1kVw
	 CMBjoC5xpAUlyJa1C+XyC6+0k9+M7CtoviJFHRfNmppZ+T60QyxMTECDMze2/t7T54Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A5C9C1F008A2;
	Mon,  9 Nov 2026 16:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794242679;
	bh=yHGcCbfrpGwBJxir5Cx0kWqq2YkGcMrums3mCpUF4D4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=EmuJY0+ELS7L3OY4V+Wt//l0nuS7dodEYs0y6KhY9aemmQaUI93A2y9BdTozebziV
	 6y6g1F+GKC9itBm5328q72iHP6PHBJ02jbdOj/DoWQJhdNunvD5WE4Xz9HiiVHWPsP
	 opYuO+4VI0pq8nahCO2eCte7sYAouXhH+RC+nm97ZgKPxUXHhpTiZIKseXSJYpCVvg
	 geu9Gn0pettnSSSkO4PuDqbWdI2IFgGXr9efLfW9nOJ4Um2tAXuWcaZZDBDe/Tqa+z
	 fVYzSegCwe+EhFI58Cmd64rzp/F8xyJcNL+3JLrxDwkCau9zZZ0/TQeqkni0HQOWrC
	 agxQG8FZtm/0g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 35D074854D;
	Mon,  9 Nov 2026 16:44:37 +0000 (UTC)
From: Yongjian Wang via B4 Relay <devnull+echoowall.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 00:44:36 +0800
Subject: [PATCH net-next v3 2/4] selftests/net: packetdrill: test
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
Message-Id: <20261110-mtu-probing-series-v3-2-dedfab25d641@gmail.com>
References: <20261110-mtu-probing-series-v3-0-dedfab25d641@gmail.com>
In-Reply-To: <20261110-mtu-probing-series-v3-0-dedfab25d641@gmail.com>
To: davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com, 
 shuah@kernel.org, kuniyu@google.com, horms@kernel.org, ncardwell@google.com, 
 kuba@kernel.org
Cc: netdev@vger.kernel.org, panweiping3@gmail.com, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Yongjian Wang <echoowall@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794242675; l=1599;
 i=echoowall@gmail.com; s=20261026; h=from:subject:message-id;
 bh=3lQsY78vSTiBOpqp4bdac9scSAkC/asJAFx3o/C4nk4=;
 b=WNdbhqL8efRbOln6bJ5NqYoztSQTDSAJrQRAeX6I1DlpYP4VQpb0Z0RXNg/+INkSH8p9JER24
 FAE8FYcq/YpBuwI9v9QZRaqEgGnzy6VFIQR+oIWnUWP0jQZ9OX4nQms
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



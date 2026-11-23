Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795431862;
	b=YM0iJDYRu8X84v4F9ZDGlX+zQzYeRoZnvcLbwO8nAeqg4GxXSZPrE1ylLMn4f1Zt6TzG
	 B9iOdyibBF5/392N8l7YKyQJb83tRC2QiBBAacf1vvJ4BpAPOVj1Kf5skJnH4lhQ51SMF
	 XySez1c6Gy71cohl74FeqxOiTnWcUO/cZpiuOlSlzmdWfHiKr0NGBAk4hw/Bd5eFX/64K
	 Ccddj1RIfkVYhUjelQvl6ZWPGrvHBwMh+h91zc3zLyqdaxFgOXOPMh1t16DX9hky2Rw3x
	 ivjZa5ZSCjmdUZJ8q5g0+HcaGLx4ToqSHQBwd2SnoOsjXvCOD7b6/wFC4uZyTPwIiRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431862;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=cp7jVLyfy7qosA+llzUSJcDBk8mNpOqESOfJOfHRX9A=;
	b=juEfmuR6sQhMuH0zEfLIpgaiciN1uwXgmVU9jXWz0lfUmFAShkXBf+8Ciy1lCY2AmgyR
	 9YxsCNJIlAjhFZyW/H7y7EKtF+54rk/hzJ345imcNk4R/V6yOQ3Seipdou2bIoit1s/p+
	 kHRC5eXg/BsGmebBbJV2NJhtWhTCiY95nDvLqtGB8tqMZPSXilAfsGTw/bV8Qkh07qpC0
	 dV2MXbHsmJ88HIXvPI4V7etAI0Iv7BFhZ75wRx4ohS9de/lqxogQyD64+4NqL+llQ7EUu
	 pHtIYRrGyJgQM1Ze4m3HyfbFMaNKB/bT2j+lQd93gSG9HEWoKq4LmlDn6YGhNYpfAPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BKRnsZzE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB18606A69A;
	Mon, 23 Nov 2026 11:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BKRnsZzE
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795431861;
	b=F5PvO9ZS5AljJn307vyVy85ut+kJ44hEqi7tQiDRxa0MGd8ALGfEqu1tcoT/iOx72drD
	 J6ykQvK554EX4yuolPZjxir1IePxjs5vrOxietCR+u2x/WcIF5CxjiKH9oLxfG3NgpHU8
	 r19dK0TURpoUJ5Yi5T2SPI+A7wFTsRsi/JwpnPguvcBxWGGlH519QWvbuZ4OhLlsaPStr
	 d3zu0LJIrjRbGGbz1rPcXICnlRcEH1SlvSWp2pr3vlXpTzVTwplXoTqrNugNMdHLEc6yx
	 8ir3q/viMjSKB72+JdC+uAWf7UQwUYbZR6Fv5m5ccgfY//gPWRiKPfpEdZlpnOxTlnw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795431861;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=cp7jVLyfy7qosA+llzUSJcDBk8mNpOqESOfJOfHRX9A=;
	b=UJL+/BFeS9c4PXrMgSrLgBru6i2ePrATGUw1Mc4QL9gbvtS6d6P2JXu3USh+9/Dn6y4M
	 7nGHUkqKf0RMJkDfd3NA6Xn4o8YHk3k8mw9oHnGrvWuR1HPTqdVx2XJBswCZ1G1S5RAnb
	 MgfTwQZviqb19wjxs8s1/nnTgx0kFZ/XKhPxxrfh6UdK3zDs2gZkOcY36Yxp5LyjE1HHp
	 uJHDWGhPm41UsAXWZqTNTVPtCoUuZNAk7UoF4unKH7qLggNGOjEj6vcjoWepy8inVlLIA
	 BMdtA7JcPJY6egwhRoDQnk00raXQM844TS88NaCTRGFswzWQuXFDu/yqQt26Tr60FJw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8A40F1F000CA;
	Mon, 23 Nov 2026 11:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795431861;
	bh=cp7jVLyfy7qosA+llzUSJcDBk8mNpOqESOfJOfHRX9A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=BKRnsZzEVevC2TEytdcaXJWmAHhZyNsbVtd7iT7CgJ8LTnIwZXLkL+hqZ+E9Emx7a
	 g2zbAFV8SRUIVjI8S4zl499kuVIF9klWzoKDwuC0B8QwOZGDu+MU2+b/WuZd2qU/44
	 nUFmGfttSZ22enQith15gVrqODP3YTeIXBCanTT+Ibc92sKR2MmlKgCOgI5xXP7uHF
	 FjjF7DrvuE89JAoJneczRJmRQTLECOKTCEENSJIhGq9ST13by3IZB7DOHNJRiC2W3d
	 bS5gcEoWFn0JmVlK9R9VEXNiH4acEaKTqXnV9yrcA0XMutI8/bSAnqfcXWIIiWPxZ0
	 XUQMbELzyQQkQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1B5784C436;
	Mon, 23 Nov 2026 11:04:11 +0000 (UTC)
From: Yongjian Wang via B4 Relay <devnull+echoowall.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 19:04:09 +0800
Subject: [PATCH net-next v3 1/2] tcp: document black hole detection for
 tcp_mtu_probing
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
Message-Id: <20261123-tcp-mtu-probing-doc-v1-v3-1-c288c2df9666@gmail.com>
References: <20261123-tcp-mtu-probing-doc-v1-v3-0-c288c2df9666@gmail.com>
In-Reply-To: <20261123-tcp-mtu-probing-doc-v1-v3-0-c288c2df9666@gmail.com>
To: corbet@lwn.net, kuba@kernel.org, edumazet@kernel.org, pabeni@redhat.com, 
 davem@davemloft.net, shuah@kernel.org
Cc: Yongjian Wang <echoowall@gmail.com>, ncardwell@google.com, 
 kuniyu@google.com, rdunlap@infradead.org, linux-kselftest@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, skhan@linuxfoundation.org, horms@kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795431849; l=2508;
 i=echoowall@gmail.com; s=20261026; h=from:subject:message-id;
 bh=Frl+i4oYaux9oiKFjwNbjA51vHapvkpGWp30QDI+s2s=;
 b=f5etkxrWA6fQgRh+NwtBZBF3MUJxwU5qu/NnCZXzkgU3bAw/BDpDr6GyWU5H+bZLECY3ZseNL
 auuw2Q3ESx9BVoH9aIW/ea6xjO817LDQ1sKX66b19N2MTOge9NmLrDr
X-Developer-Key: i=echoowall@gmail.com; a=ed25519;
 pk=9XP6JhqjjPsHCF6UZZZTeqTRnXIa4+ufggnxXtTJ+no=
X-Endpoint-Received: by B4 Relay for echoowall@gmail.com/20261026 with
 auth_id=1323
X-Original-From: Yongjian Wang <echoowall@gmail.com>
Reply-To: echoowall@gmail.com
Content-Transfer-Encoding: 7bit

From: Yongjian Wang <echoowall@gmail.com>

ip-sysctl.rst says that tcp_mtu_probing=1 enables MTU probing once an
ICMP black hole is detected, but not when that happens or what TCP
does then.

Describe both, as implemented in tcp_write_timeout() and
tcp_mtu_probing(). Also add the missing defaults of tcp_mtu_probing
and tcp_base_mss.

Signed-off-by: Yongjian Wang <echoowall@gmail.com>
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
---
 Documentation/networking/ip-sysctl.rst | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
index 0b7bfbd98a92..a4a28b452d25 100644
--- a/Documentation/networking/ip-sysctl.rst
+++ b/Documentation/networking/ip-sysctl.rst
@@ -412,6 +412,8 @@ tcp_base_mss - INTEGER
 	Path MTU discovery (MTU probing).  If MTU probing is enabled,
 	this is the initial MSS used by the connection.
 
+	Default: 1024
+
 tcp_mtu_probe_floor - INTEGER
 	If MTU probing is enabled this caps the minimum MSS used for search_low
 	for the connection.
@@ -711,6 +713,26 @@ tcp_mtu_probing - INTEGER
 	- 1 - Disabled by default, enabled when an ICMP black hole detected
 	- 2 - Always enabled, use initial MSS of tcp_base_mss.
 
+	A black hole is detected when the retransmission timer fires after
+	the handshake and retransmissions have stayed unacknowledged for as
+	long as tcp_retries1 retransmissions would take with an RTO starting
+	at 200 ms and doubling each time, which is 3 seconds with the
+	default tcp_retries1. This time is counted from the first
+	retransmission and only checked when the timer fires, so a flow
+	with a 200 ms RTO detects the black hole at the fifth timeout,
+	about 6 seconds after the original transmission.
+
+	With value 1, the first detection enables MTU probing and lowers
+	the MSS to tcp_base_mss if it is larger. After that, and from the
+	first detection with value 2, each timeout at which a black hole is
+	still detected lowers search_low to half its MSS, capped at
+	tcp_base_mss but never below tcp_mtu_probe_floor or tcp_min_snd_mss,
+	and lowers the MSS to match if it is larger. Once MTU probing is
+	enabled, the connection also probes for a larger MSS, as with
+	value 2.
+
+	Default: 0
+
 tcp_probe_interval - UNSIGNED INTEGER
 	Controls how often to start TCP Packetization-Layer Path MTU
 	Discovery reprobe. The default is reprobing every 10 minutes as

-- 
Git-157)



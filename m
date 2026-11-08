Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794148795;
	b=pXLgbhyQ2ACDu4cRj2Myffhrk0Cp85FdvBBPQoL67+ja9lCNSKfzMdJyE7WFJQ5ddqdQ
	 MFlXCmzoFy9BAY5w1Azn36ykhdM3EVMX/37u1UPCBXF9R1NtfVri9RCR4kdBdAdpDDvM1
	 DHVF2WifHTizjlP5I5lfAXyZY7Xh8jjrtorb4jCD6SlkRRQwJZA7HJCGPe1vMcrlEgX+F
	 4s+OgH2Sjywrp9Lsif4hKGNQQQQFOxm68xY/A8LEOgMpG09GFdJsz3z2RfoekzNracV5i
	 QhxdLCIeKy8oNeybM5tnHKPumhgWIMqUWsl/z24fVl7GvTUfMJniOMnFWk/P8H/W7sw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794148795;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hXeI62DSFtg21C1JMTtd10sZYn1mo2l5z5W1qlk0TXc=;
	b=3OT93Xdjc+xEveK+UDY+0nMTeE+93ZMgWQmntclnKMX4fpNjQM1H0/0oFqxjf07oeZin
	 2syc++iN207Kd5LM6Vcjnw0LIIw72WpHe6QjQcnZ+qdCp6FadMqruB7VHsgYHBZGPFZa/
	 EjL6R0XAa4QUieS8aDyt5nLrieHbgC7Vo1EdFyccO5OFukBqS5Oxay6mCfrFsB4dePau7
	 ZqnPKX6oQ5iAlz5OfoGiutdz+BYi0Db9/4uFFrnk51Oq0gU37t4unPSdDcO4DxeOCOcI0
	 ml25UJ0/RP0dXiVkdr37qsfgeV7oRwoT3RXwcvgcII5xi0u+4AOxBOqwVLvyPmyi3+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O4TkbOuZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BEF606A31C;
	Sun,  8 Nov 2026 14:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O4TkbOuZ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794148794;
	b=1hkRxEOVRycm3cXrBPIMjTX/WKY2BSapT3kMXolPPItFNL30aJ/zdkxFMCN92N/4NMlm
	 d/mvhR1d4EGxZMZuakJQTfGW/gPbyzt3DemZwJcXXxoVepPkJ5yu37lMvtvYz9jSvoZTK
	 etv6YZVWIUg+wPPiIsPafs0xyzWDjP1cwRtK0pllae2fW2A3XnKWotP/GLtIVjFalFmvZ
	 ruYkxDqYfwGnHOAYzpCf+ZehQn3wbJcZhAq4jvCrGZ50jLXPQf8u4p70RgpXSb075Cu08
	 D5RQpK9wJivvhz1qk+Bue9yBvm63DsVo+eYf+NDGJ7NinWpelKdaeCbWWm9Oh+58A0g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794148794;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hXeI62DSFtg21C1JMTtd10sZYn1mo2l5z5W1qlk0TXc=;
	b=cbhtiYIfoJprPEll/9AB4preID4jq9GDh6MjPLxQCeL7DMWTWeVjKJW0j0pRGbA3BRhg
	 0xlRlPRuUNgPwE+JK9WOrwTHcFLUrEPENk4w8Agmzr7EoYCkqDYDOTFoEnK+poyLr4og5
	 ysTS2Fo8p963fFwW5MnSNMrTopoUVHbLWWFypvGFiVI01SBk3RENLW2gdQoLIApaROUkg
	 FiMhArtC/bHcsWohqc2I+0mV3MUTrgxPe+sCo34+jlbiKwHebb2Da6dW8z4wQ6f/56Njy
	 j9in+gwuBXRpqsygMLHFsfsk1UHvYF2pDQABcRxGv+ziKtfCqcNUZUB8oF6qXMca7gA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 07F931F0089F;
	Sun,  8 Nov 2026 14:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794148794;
	bh=hXeI62DSFtg21C1JMTtd10sZYn1mo2l5z5W1qlk0TXc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=O4TkbOuZnzoleTLoEoQzZE05v8Sw7i+EY240rEgKUdOhdV9PnyTSnkLlwOVJUbv2y
	 RMGX7mB2XevBUsSdEygVUCx1bdhDDJqz1UTvPnC9JuXXqhiMnQereirrD33hSKNDs9
	 G34K5gtmQWislTADwpippU2kwEWmq1cF12GUaP0tVPdoa+M/X292ht2Elk9PqJCAZs
	 ihgM4n9enNiGLs4tQIDDVU7WodSdFmJnfNyWXexgQjzWPfcrFIOtN4lZ5bJc4ccuJt
	 Pp+sWwaGJ+VCIEfvDjdzfKKA8qyNiaHT6hRWZ8zvUZh0LuFqoerD48ZFSRJLY36+oK
	 5DPxPaVw/FROQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7408747FB5;
	Sun,  8 Nov 2026 14:39:53 +0000 (UTC)
From: Yongjian Wang via B4 Relay <devnull+echoowall.gmail.com@kernel.org>
Date: Sun, 08 Nov 2026 22:39:51 +0800
Subject: [PATCH net-next v2 1/4] tcp: initialize MTU probing before syncing
 MSS at connection setup
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
Message-Id: <20261108-mtu-probing-series-v2-1-355d6490c3db@gmail.com>
References: <20261108-mtu-probing-series-v2-0-355d6490c3db@gmail.com>
In-Reply-To: <20261108-mtu-probing-series-v2-0-355d6490c3db@gmail.com>
To: davem@davemloft.net, pabeni@redhat.com, ncardwell@google.com, 
 horms@kernel.org, kuba@kernel.org, kuniyu@google.com, shuah@kernel.org, 
 edumazet@kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 panweiping3@gmail.com, netdev@vger.kernel.org, 
 Yongjian Wang <echoowall@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794148792; l=3020;
 i=echoowall@gmail.com; s=20261026; h=from:subject:message-id;
 bh=gw30lCB+koCBeK4NDEFhdJcvv5kKyqfKEqHHq/I2PBw=;
 b=d+knAXPHjjfjhogITvEfYp/NIR++8iBt7OCZNIm4Nfzysv1U4OGGLjWrYClj5IhqKNiihAF4s
 cB5ap0kXCKFD1JmMYtdbB35iEWFJ/jqLt5UZy8XaS/jjAMhX7xCKsR8
X-Developer-Key: i=echoowall@gmail.com; a=ed25519;
 pk=9XP6JhqjjPsHCF6UZZZTeqTRnXIa4+ufggnxXtTJ+no=
X-Endpoint-Received: by B4 Relay for echoowall@gmail.com/20261026 with
 auth_id=1323
X-Original-From: Yongjian Wang <echoowall@gmail.com>
Reply-To: echoowall@gmail.com
Content-Transfer-Encoding: 7bit

From: Yongjian Wang <echoowall@gmail.com>

With tcp_mtu_probing=2, a passive connection starts at the full MSS
rather than tcp_base_mss. The IPv4 and IPv6 syn_recv_sock() paths
call tcp_sync_mss() before tcp_init_transfer() enables MTU probing.
With tcp_base_mss=1024, the first successful probe can therefore lower
the MSS from 1460 to 1242. On a black hole path, the first reduction
skips 1024 and goes straight to 512.

Commit 4d83e1773031 ("tcp: delete redundant calls of tcp_mtup_init()")
removed tcp_mtup_init() from the passive setup paths.
Commit 27204aaa9dc6
("tcp: uniform the set up of sockets after successful connection")
later moved MTU probing initialization into tcp_init_transfer(),
away from tcp_sync_mss().

Initialize MTU probing immediately before the existing tcp_sync_mss()
calls in the IPv4 and IPv6 passive setup paths and when processing
a SYN-ACK for an active connection. Remove the late initialization
from tcp_init_transfer(). This lets tcp_sync_mss() apply tcp_base_mss
without adding another MSS calculation to connection setup. The
crossed-SYN path already uses this order.

Fixes: 4d83e1773031 ("tcp: delete redundant calls of tcp_mtup_init()")
Suggested-by: Kuniyuki Iwashima <kuniyu@google.com>
Suggested-by: Neal Cardwell <ncardwell@google.com>
Signed-off-by: Yongjian Wang <echoowall@gmail.com>
---
 net/ipv4/tcp_input.c | 2 +-
 net/ipv4/tcp_ipv4.c  | 1 +
 net/ipv6/tcp_ipv6.c  | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index 3fd0e2153..2b54b99f1 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -6763,7 +6763,6 @@ void tcp_init_transfer(struct sock *sk, int bpf_op, struct sk_buff *skb)
 	struct inet_connection_sock *icsk = inet_csk(sk);
 	struct tcp_sock *tp = tcp_sk(sk);
 
-	tcp_mtup_init(sk);
 	icsk->icsk_af_ops->rebuild_header(sk);
 	tcp_init_metrics(sk);
 
@@ -7020,6 +7019,7 @@ static int tcp_rcv_synsent_state_process(struct sock *sk, struct sk_buff *skb,
 			tp->tcp_header_len = sizeof(struct tcphdr);
 		}
 
+		tcp_mtup_init(sk);
 		tcp_sync_mss(sk, icsk->icsk_pmtu_cookie);
 		tcp_initialize_rcv_mss(sk);
 
diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
index 0dc3b0876..fb968798b 100644
--- a/net/ipv4/tcp_ipv4.c
+++ b/net/ipv4/tcp_ipv4.c
@@ -1740,6 +1740,7 @@ struct sock *tcp_v4_syn_recv_sock(const struct sock *sk, struct sk_buff *skb,
 
 	tcp_ca_openreq_child(newsk, dst);
 
+	tcp_mtup_init(newsk);
 	tcp_sync_mss(newsk, dst4_mtu(dst));
 	newtp->advmss = tcp_mss_clamp(tcp_sk(sk), tcp_dst_advmss(dst));
 
diff --git a/net/ipv6/tcp_ipv6.c b/net/ipv6/tcp_ipv6.c
index b1dec5d86..8ea1ae1ad 100644
--- a/net/ipv6/tcp_ipv6.c
+++ b/net/ipv6/tcp_ipv6.c
@@ -1490,6 +1490,7 @@ static struct sock *tcp_v6_syn_recv_sock(const struct sock *sk, struct sk_buff *
 
 	tcp_ca_openreq_child(newsk, dst);
 
+	tcp_mtup_init(newsk);
 	tcp_sync_mss(newsk, dst6_mtu(dst));
 	newtp->advmss = tcp_mss_clamp(tcp_sk(sk), tcp_dst_advmss(dst));
 

-- 
Git-157)



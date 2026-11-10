Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794329160;
	b=ZAWqETLVHedpNcTtUQi0z8/Faz0+OCFTqGt31U1MFFI8E3Au+H3vVe9eHJUfS54+KX3h
	 qbLiIDZlSzIXf2X+joaMTObw5/SZJu/C+1QtkXZKOJaK2kJsNo2K6gxHFMmH0UiENxKhl
	 BfUFmb+zrixq+9zBWJ4K9H+L7a5GdSPMlGmxNIMjZobTeKfl1ZnAQi8x6HCcsOmWziHdj
	 7vjLTkQs2mBGuOLArkYJ29N3j2NzSFznCW9VJXPROXfP7nkcVzKQvl5ymMWvwwexcvc7E
	 HK92Y8ElYsJUdd7Y7bIE3L9ldz1efPVP8iNi5R7riFBoZSd9d4pVaq17OU6nOjfXm7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329160;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Ex4CIgJnnaVzBcgad3HZ6oNEALo0xHeE/NCSIrezaqg=;
	b=oayLlQ2X0ooar91BXWwhE5UbcXR87+WDVE8o9wcvfR7DG8JH6gxFRxXm1GMk+rdLSuYT
	 ypIJRZyLDzibXpr3ZRbpZHXHVMolVMZcfrOZumVUfuPOrJgXtQEvrFORctQVORCt7+7wp
	 AaYTenJLEttxLJbKurK9mpr8qv0xBjO4YgmnLSc5ITfvNmIb8/1Z0D1kufpBZ6pxrsV0T
	 GD2PPIZGRQqdv2jd2M7OTZwyCLK48CBmE8h65m3XTUIqVI0HCDCiilPjxLBartV1+XWAw
	 kUw9Zgb7d4MflHyMEofRcC8cnNldjJcfL6Yo3GtChBKyn5/HONxwYElkF1xJXR94zsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UdMCV8b2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B50606A331;
	Tue, 10 Nov 2026 16:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UdMCV8b2
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794329159;
	b=BtBVdW/SIdabtaR4QZTCqTCexw4doMTe90kGMP18KkpIFWvgmG8rSHNtOvoimw4Aw0RK
	 IxqrI+EcifIt1xQFn2KppaCsE0x38i2YIquT6q4nuvlP6UenkGzLzzVeKEZirTG0NaSvH
	 A971jcVDOhjbHh5xVgjjqcayxn4laqGhscEEelbKte1Oa7ddGW4cRUSRmlZ6d0HC2fwY1
	 f2fquGs1aagImE07pdqzNQ6jfnZx23hwYifo0yTrh/t4jZc45Hxu3Lg/IEmymmQG4mMaw
	 UZb3q/syA2ixFgnCi2XJRaI0QQHxPGo54LbKxR8yb2RH8ZBrAoPCa/a5I38rev6lUfA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794329159;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Ex4CIgJnnaVzBcgad3HZ6oNEALo0xHeE/NCSIrezaqg=;
	b=Em7QOTY6hJnV/4jZfmil6OqJijqYjJVbI8vLOG3Yw0XiM9vETNSmf4eTmP8TFaYSlHU2
	 gZ9ZTzuytLOQASLH9GpUOAryhkErR4LkMcZJYj2NFPQKuIfn+4vqVzaEobQD7DpLqU5Tj
	 czMr7B8lmlNqheoMlBwT9PP0jBdcpT6mA4CTKfsBhVNJ8rrb7zW/cncdmSJgCYs65TTZ7
	 ouaL9lBicxxnOJZ9UemxQXyuPR2lVTuCI5nIYVCNTuLmuX6KojfI0E1k7PO3heme3kG+O
	 LwgvXv0Qe3VGIXLenvne+cpnR637aK+/mze8CtGdAKg/OEsusOEdCpeQcySQQXmEnUA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5D5071F0089F;
	Tue, 10 Nov 2026 16:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794329159;
	bh=Ex4CIgJnnaVzBcgad3HZ6oNEALo0xHeE/NCSIrezaqg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=UdMCV8b2VeoM3w+D732bVQdtMCSluvH5LcKS4jctOWeuYgJUM/BIoVB9nx/qEhgN/
	 UkdoA6JjUQE275VRFPngMjutTwgBR0wtAZ7N+Jick1DDeThcBRMG1NPg6ZLpd4A78U
	 lh76R7o97dx1i+iyCSv5+BwcZUWT9+d/PQdPIRkpedjt0jOqp/8i/yZNUbrxAhGRT+
	 vbpv9qpra/6L5DzLqzn5yj4kP2qFXuwvGiTnuc49fZSMwK7JBrTBAzYGU7ngs3scWi
	 zQq9kIuXc6VRVLtMCnlGSm+vFDf/5XyWjjVLcUw64DlLPv9/rhwfB9wU1IHlomHTvT
	 ChFgr4a2zAq8g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D725348BE0;
	Tue, 10 Nov 2026 16:45:57 +0000 (UTC)
From: Yongjian Wang via B4 Relay <devnull+echoowall.gmail.com@kernel.org>
Date: Wed, 11 Nov 2026 00:45:55 +0800
Subject: [PATCH net-next v4 1/4] tcp: initialize MTU probing before syncing
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
Message-Id: <20261111-mtu-probing-series-v4-1-6f2e484ca8ea@gmail.com>
References: <20261111-mtu-probing-series-v4-0-6f2e484ca8ea@gmail.com>
In-Reply-To: <20261111-mtu-probing-series-v4-0-6f2e484ca8ea@gmail.com>
To: pabeni@redhat.com, kuba@kernel.org, shuah@kernel.org, 
 edumazet@kernel.org, horms@kernel.org, kuniyu@google.com, 
 ncardwell@google.com, davem@davemloft.net
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 netdev@vger.kernel.org, panweiping3@gmail.com, 
 Yongjian Wang <echoowall@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794329156; l=3243;
 i=echoowall@gmail.com; s=20261026; h=from:subject:message-id;
 bh=fc7GUdhcvf9vRkZ3ScF2x8cdgOAMENFCNY8ojAS8WTM=;
 b=wKZ+Ok+q/a8mkHceG56FgZXCEjtucb1MXa1ZWmh9WCQ+d8VksNSwEGcZ+i6rhSDL1yQz+RJzb
 25sZVzwNdUaA6i/v5L1Qu+XEtsUlr2UYzCj6luNe0+EjO0xGqUZmsKT
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

The issue surfaced while developing packetdrill coverage for MTU
probing and comparing the initial send MSS on active and passive
IPv4 connections.

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
Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
---
 net/ipv4/tcp_input.c | 2 +-
 net/ipv4/tcp_ipv4.c  | 1 +
 net/ipv6/tcp_ipv6.c  | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index 3fd0e215324d..2b54b99f1f45 100644
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
index 0dc3b087665d..fb968798be36 100644
--- a/net/ipv4/tcp_ipv4.c
+++ b/net/ipv4/tcp_ipv4.c
@@ -1740,6 +1740,7 @@ struct sock *tcp_v4_syn_recv_sock(const struct sock *sk, struct sk_buff *skb,
 
 	tcp_ca_openreq_child(newsk, dst);
 
+	tcp_mtup_init(newsk);
 	tcp_sync_mss(newsk, dst4_mtu(dst));
 	newtp->advmss = tcp_mss_clamp(tcp_sk(sk), tcp_dst_advmss(dst));
 
diff --git a/net/ipv6/tcp_ipv6.c b/net/ipv6/tcp_ipv6.c
index b1dec5d86d63..8ea1ae1ad2b2 100644
--- a/net/ipv6/tcp_ipv6.c
+++ b/net/ipv6/tcp_ipv6.c
@@ -1490,6 +1490,7 @@ static struct sock *tcp_v6_syn_recv_sock(const struct sock *sk, struct sk_buff *
 
 	tcp_ca_openreq_child(newsk, dst);
 
+	tcp_mtup_init(newsk);
 	tcp_sync_mss(newsk, dst6_mtu(dst));
 	newtp->advmss = tcp_mss_clamp(tcp_sk(sk), tcp_dst_advmss(dst));
 

-- 
Git-157)



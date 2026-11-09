Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794242680;
	b=NDuKUgHM1gv7jSfBWyoc7VRmCISYD1oUc20LrpDc+7f0jcIA8uiAHyYHDdxr0p5PVlKI
	 QUmdSxPrpGoMsjN/UgesjRLTTGdeXmcB7rcPWmKCPKhEaZa1eG8IQrojv3OwsLYqn60He
	 UtxSbblvptvtyECMKdvYuUEQv3AsBxWe29MrcvqArg/EQ1VnEnYfc/7mKZOV24tpAB9TP
	 YpHTiDFYfOJ9MP45rcYn0lRe/Phm90uB2iQunRMH/yBb/U/CksoN4o2T0ucz5UbySNfBB
	 XyPTbU8nM9LAXK0TrLZaZLwqDiwSD1M21T/1oFPTNJA0Oj8wiSrIpP2C9EQPgqK5LqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242680;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=NIiRj2RlfhuVRBMzB30J6neNTajQNxPn7bfacS8JNPM=;
	b=g9v7Ir7a5eNtcen/e6X8YQTNi9Xiy3AfaT0BXam0cTO0MBF1Zr+6VmkKkIkrmR9oNQPW
	 zvefruQPJo4Tp8635mxiI3eNz0shUKYA2xkDESAzBUYUJpYYYz76uCgnyV3HgQ3VrBnLT
	 g0ZneD0aO3eQThLYY6Bi2CkRKhpXljyFb98GargCJg7u/TDjVD0I4T9o8rppoMF+E6UWE
	 9uVLx3zphshpPIw7QtNYEYvMVKx79mwdU0LlQveIXiyj6SwCIY5JuHaSuNaN9CxMPyVw2
	 f0U4q2eSogSOJa8rehuqpXw49ZgMGKuXPADrYptmSc3/6wScpJG28DgyVepps5GKO0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I3eEBvHD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD86606A33B;
	Mon,  9 Nov 2026 16:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I3eEBvHD
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794242679;
	b=1TVkXNyZelOlv6peAw/dKj5NrIJUONuRfoZQeVty2/OwtFLYDgpA+8ZxYAuxedZPsCf3
	 RKqWI8z53KdjmbU4lWwvDca+XABZtaC8cJqKacqQ11pQ3ZmIQQuY6gbr1jCb0r73q+xKY
	 OOR9DnvDGjUe8qT54p8QoF3RH7tR4yBvpk6a4YQ9VwWG6Ttby765VGeggPVHh9Pv+W5wc
	 7BkWN7YnbPYFlburcip4p/T3xnjHpo1WJxy7duZuLUhClJ/ox6H3TfWBEjkT9p8JfzGUA
	 TFc1GTtWWeuemu+41ihQ8UlB74Oe9c+CNb9auf3SafQC9WYxjttCWrIEh/B1T7b/c9Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794242679;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=NIiRj2RlfhuVRBMzB30J6neNTajQNxPn7bfacS8JNPM=;
	b=MlnuEKkxvAndOOFiA1t+alhYVKFWQcgILE1GmsuTdMsZ9F7vwJKDJ02fZnRClPX5u9WH
	 hmrdz8fL/FqOS0Jcf5Cn4eX/heXP4ZnvlD7KpU1tF4xVdEkvxw2Qdnnnqvek7njO2yRgL
	 U6SLx569RluSrKXvsBeG9gCA6mjSDAN11pxvKISgRbfct1eVYk2dvZeKXJ0fWU2FfGHYQ
	 t9mQGpvjvMTxgrOKaKWy2VyLuqqcYqS8+zC8VvGKpWgmo/JhWlVtvQZfpo7ybr3A9DkV3
	 TH0mhwlgKdLHeAxhtgqOL0PB4XXY5pSEhQ767YN0MhDflzjlBJYrtf9R8x5U4IVlSWw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9492D1F008BC;
	Mon,  9 Nov 2026 16:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794242679;
	bh=NIiRj2RlfhuVRBMzB30J6neNTajQNxPn7bfacS8JNPM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=I3eEBvHDf9vidJt9SrivJwObNYLyFEQ4DKFLfEjfyVRCDM74sNPlD2NgAeYiL8lo+
	 Jqo2XJAFEBxAg+3tOWIiwc0tenHGpseFZuU3a2iC9DJ/uNeurJDgB83XMcL1eMhNR8
	 Q23Z9W0B6SjFYthbbdKIr0se6IUNxU6wZtTxLwBlvNNmnhrlCExdfyxQWqUN4iujDG
	 /HSx1w9DkV4BG2HJlwupSd1t5vkH+G+KMkPZVt0ZIodlW4lD6dk6ddCx2MBqeafGt9
	 PxfKrf1CBvPbyEuNlgMFKujwHPSNCLezb2y6n5vAcoOFWCoY1zw3Lin5wIKXVlRnPD
	 c7TiZm4+dSe5Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2561D48549;
	Mon,  9 Nov 2026 16:44:37 +0000 (UTC)
From: Yongjian Wang via B4 Relay <devnull+echoowall.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 00:44:35 +0800
Subject: [PATCH net-next v3 1/4] tcp: initialize MTU probing before syncing
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
Message-Id: <20261110-mtu-probing-series-v3-1-dedfab25d641@gmail.com>
References: <20261110-mtu-probing-series-v3-0-dedfab25d641@gmail.com>
In-Reply-To: <20261110-mtu-probing-series-v3-0-dedfab25d641@gmail.com>
To: davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com, 
 shuah@kernel.org, kuniyu@google.com, horms@kernel.org, ncardwell@google.com, 
 kuba@kernel.org
Cc: netdev@vger.kernel.org, panweiping3@gmail.com, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Yongjian Wang <echoowall@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794242675; l=3191;
 i=echoowall@gmail.com; s=20261026; h=from:subject:message-id;
 bh=dheRlUn7XAqkq1CdSHyUrNsJDtsi4JPPCVAWaWCPNZs=;
 b=vA4c2zdS27JqROPN10pJMy5VSqbgq2gP+93UQGmEPJfvwSqis580F4ytRmOMhK6iMVnhku4yU
 JMiQKa2HeG7C+FUTBHRK4SPirJqHg2OLNQUmqG6Lg4LaQkV7SyyysTf
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



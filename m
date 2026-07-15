Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D1939EF19
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 14:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784127267; cv=none; b=m+8gYQtbpA9SnP4bDVnKLhkk1CQXmHK5ExAksn7wMWSbWyN8W0VOyWjyZQqEZe1bxQV1PFcEywG+AkOVDYZ0m0qHGP85xUxrzrWHBLVrLaTYA/LV0S93pmeK7lK8cGykusx5SryZQiaS1KpYW3QB9m/qNp9n38NJlGcQsRIQ3eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784127267; c=relaxed/simple;
	bh=YyPEuMuyqMojfkauQ1cJlUP1yepRyWdPdGctS43UDF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y6b7gzyWiyWiVbR7q3tIXnJjOS2e3xpYxfGv3QjZ0mIXLBQrlN6cJb6N3K6Lpiy0GmMRJBijrf9D6Z3W5baO5Or+Y71M7cgP2zdsqYwifkq9GA8vJ1JcWSvPtFEQA/xlqzJq44ri5yXQbi0PGz/TcLeVEU6bWaQjbj8SZppPi/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=daUlspi8; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="daUlspi8"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784127260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hwZLS8o3i4sMyxo+i8ArT9POnhAqjleO4BkvUvWUla0=;
	b=daUlspi8tAUflgYybjOPKInf9VJHf2qWkYwQPKcpXc+ot9Tc5cLKt1VRH1Iz1S84q1AqkM
	eutn+riCgtZNoVMOALPYaQixlwo85wW/RDUtqJP7EiuaWl891pbO3k/19zOTEHjO1hruPu
	XgD29kthOoOccfZdEeZttqe/kFK1N6A=
From: Leon Hwang <leon.hwang@linux.dev>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ij@kernel.org>,
	Leon Hwang <leon.hwang@linux.dev>,
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>,
	Yung Chih Su <yuuchihsu@gmail.com>,
	Wyatt Feng <bronzed_45_vested@icloud.com>,
	Jason Xing <kerneljasonxing@gmail.com>,
	Lance Yang <lance.yang@linux.dev>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [RFC PATCH net-next v2 1/2] tcp: Add net.ipv4.tcp_purge_receive_queue sysctl
Date: Wed, 15 Jul 2026 22:53:26 +0800
Message-ID: <20260715145328.54597-2-leon.hwang@linux.dev>
In-Reply-To: <20260715145328.54597-1-leon.hwang@linux.dev>
References: <20260715145328.54597-1-leon.hwang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Introduce a new sysctl knob, net.ipv4.tcp_purge_receive_queue, to
address an unreleased SKBs issue related to TCP sockets.

Issue:
When a TCP socket in the CLOSE_WAIT state receives a RST packet, the
current implementation does not clear the socket's receive queue. This
causes SKBs in the queue to remain allocated until the socket is
explicitly closed by the application. As a consequence:

1. The page pool pages held by these SKBs are not released.
2. The associated page pool cannot be freed.

RFC 9293 Section 3.10.7.4 specifies that when a RST is received in
CLOSE_WAIT state, "all segment queues should be flushed." However, the
current implementation does not flush the receive queue.

Solution:
Add a per-namespace sysctl (net.ipv4.tcp_purge_receive_queue) that,
when enabled, causes the kernel to purge the receive queue when a RST
packet is received in CLOSE_WAIT state. This allows immediate release
of SKBs and their associated memory resources.

The feature is disabled by default to maintain backward compatibility
with existing behavior.

Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
---
 Documentation/networking/ip-sysctl.rst        | 18 +++++++++++++++
 .../net_cachelines/netns_ipv4_sysctl.rst      |  1 +
 include/net/netns/ipv4.h                      |  1 +
 net/ipv4/sysctl_net_ipv4.c                    |  9 ++++++++
 net/ipv4/tcp_input.c                          | 22 +++++++++++++++++++
 5 files changed, 51 insertions(+)

diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
index 208f46967ee5..abbee0326f15 100644
--- a/Documentation/networking/ip-sysctl.rst
+++ b/Documentation/networking/ip-sysctl.rst
@@ -1448,6 +1448,24 @@ tcp_rto_max_ms - INTEGER
 
 	Default: 120,000
 
+tcp_purge_receive_queue - BOOLEAN
+	When a socket in the TCP_CLOSE_WAIT state receives a RST packet, the
+	default behavior is to not clear its receive queue.  As a result,
+	any SKBs in the queue are not freed until the socket is closed.
+	Consequently, the pages held by these SKBs are not released, which
+	can also prevent the associated page pool from being freed.
+
+	If enabled, the receive queue is purged upon receiving the RST,
+	allowing the SKBs and their associated memory to be released
+	promptly.
+
+	Possible values:
+
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 0 (disabled)
+
 UDP variables
 =============
 
diff --git a/Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst b/Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst
index 3dc03bff739e..2945de40ad78 100644
--- a/Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst
+++ b/Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst
@@ -126,6 +126,7 @@ unsigned_long                   sysctl_tcp_comp_sack_delay_ns
 unsigned_long                   sysctl_tcp_comp_sack_slack_ns                                                        __tcp_ack_snd_check
 int                             sysctl_max_syn_backlog
 int                             sysctl_tcp_fastopen
+u8                              sysctl_tcp_purge_receive_queue
 struct_tcp_congestion_ops       tcp_congestion_control                                                               init_cc
 struct_tcp_fastopen_context     tcp_fastopen_ctx
 unsigned_int                    sysctl_tcp_fastopen_blackhole_timeout
diff --git a/include/net/netns/ipv4.h b/include/net/netns/ipv4.h
index cb7f8bf15671..ab9b92807d9f 100644
--- a/include/net/netns/ipv4.h
+++ b/include/net/netns/ipv4.h
@@ -222,6 +222,7 @@ struct netns_ipv4 {
 	u8 sysctl_tcp_nometrics_save;
 	u8 sysctl_tcp_no_ssthresh_metrics_save;
 	u8 sysctl_tcp_workaround_signed_windows;
+	u8 sysctl_tcp_purge_receive_queue;
 	int sysctl_tcp_challenge_ack_limit;
 	u8 sysctl_tcp_min_tso_segs;
 	u8 sysctl_tcp_reflect_tos;
diff --git a/net/ipv4/sysctl_net_ipv4.c b/net/ipv4/sysctl_net_ipv4.c
index ca1180dba1de..82412fd98e0e 100644
--- a/net/ipv4/sysctl_net_ipv4.c
+++ b/net/ipv4/sysctl_net_ipv4.c
@@ -1652,6 +1652,15 @@ static struct ctl_table ipv4_net_table[] = {
 		.extra1		= SYSCTL_ONE_THOUSAND,
 		.extra2		= &tcp_rto_max_max,
 	},
+	{
+		.procname       = "tcp_purge_receive_queue",
+		.data           = &init_net.ipv4.sysctl_tcp_purge_receive_queue,
+		.maxlen         = sizeof(u8),
+		.mode           = 0644,
+		.proc_handler   = proc_dou8vec_minmax,
+		.extra1         = SYSCTL_ZERO,
+		.extra2         = SYSCTL_ONE,
+	},
 };
 
 static __net_init int ipv4_sysctl_init_net(struct net *net)
diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index 61045a8886e4..4f1027173e95 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -4853,6 +4853,7 @@ void tcp_done_with_error(struct sock *sk, int err)
 /* When we get a reset we do this. */
 void tcp_reset(struct sock *sk, struct sk_buff *skb)
 {
+	const struct net *net = sock_net(sk);
 	int err;
 
 	trace_tcp_receive_reset(sk);
@@ -4869,6 +4870,27 @@ void tcp_reset(struct sock *sk, struct sk_buff *skb)
 		err = ECONNREFUSED;
 		break;
 	case TCP_CLOSE_WAIT:
+		/* RFC9293 3.10.7.4. Other States
+		 *   Second, check the RST bit:
+		 *     CLOSE-WAIT STATE
+		 *
+		 * If the RST bit is set, then any outstanding RECEIVEs and
+		 * SEND should receive "reset" responses.  All segment queues
+		 * should be flushed.  Users should also receive an unsolicited
+		 * general "connection reset" signal.  Enter the CLOSED state,
+		 * delete the TCB, and return.
+		 *
+		 * If net.ipv4.tcp_purge_receive_queue is enabled,
+		 * sk_receive_queue will be flushed too.
+		 */
+		if (unlikely(READ_ONCE(net->ipv4.sysctl_tcp_purge_receive_queue))) {
+			struct tcp_sock *tp = tcp_sk(sk);
+
+			skb_queue_purge(&sk->sk_receive_queue);
+			WRITE_ONCE(tp->copied_seq, tp->rcv_nxt);
+			WRITE_ONCE(tp->urg_data, 0);
+			sk_set_peek_off(sk, -1);
+		}
 		err = EPIPE;
 		break;
 	case TCP_CLOSE:
-- 
2.55.0


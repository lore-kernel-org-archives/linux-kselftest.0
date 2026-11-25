Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795641478;
	b=K+tAK4EkLzS9i9oHTfLHw49+m36Cy2IZVVe7e9XUVYU9F2d4oiZy603ZvGK0z7q/v8qf
	 D1t+SI7dfOkwtX0xs6KiwKOnZWshjgb4lZ0C+Vu9Zc3yme4Jxn8BPY9MqECBmOh1sDLuL
	 lS3Y3S7XTCipiYKN7a+Gb7dYX09aL36Div8/W8wjvtB1olyPOEVkbdMWb1EycoRz0xkHJ
	 5xelsXnqV8+uGCGYJsErGx93WyRxbH60U1blYC4GPubTpRmcpR3m3m6xmZkdsaQ+cL1pT
	 LvQ44m9wMQOCdAYV6jjkZJGFJHQ60+LNHNzkDwqUwceSUnlXKXyoXZNqc2LPEDxw/hw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641478;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=KMUJkdmWR9o36UWMZ54x3x27bnMAHlQEQEtkk7tI4lc=;
	b=0vIuqKCtwjSs/F4QcJlPs41dKV0rhH0N8lF3/l2uhmgbQTcm0UQl9gY5orOSzazZBfFY
	 RD5kskEYMdztdH4vTN+NVnN1u9TrQIVuCFrgZlsDjRPFc2hNQ2+eNVQ51ft7WiNUbCw6J
	 UDZ9ooBBRj4tLSZAdLQAdGtj/InSfaLgwmwRon14RcziHlCbw2k/Lr5qKg4SsAYzfE6/a
	 pZS8H40ozPCNMMlhFQTRGQgqok8+dVUQ1fDnU5lSXHEmDiq9LAsnrWn335cJ7oaBKJlz6
	 4KX+VsRBeBXvGk35F3dKsUIzWavrBrmjx62FHuUtgibo9NUl/tUFWzMGaqpokBzKNmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C+nZQ+9g;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556A1606A338;
	Wed, 25 Nov 2026 21:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C+nZQ+9g
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795641477;
	b=MtIxSGjcLMsw+gaNh9z1i877mxElKjQ2Mjk7f8b+Bd5IypM11Vaox4XiXfWPTllybzJW
	 aPhs7CD+KOCLG+gmZyZ8Cms06gOHClrKA+TAfM6L/4QiRKuMYhFJQr1H2HE9sk4aFBNWK
	 uo2dpFdgKXY6HYh1DjYmoTk4VXOH0OC3lU2tCVDDRIHyhzDTf8yM0MiwWuHNDzrCiAzL3
	 MvyW1q6Ukq3ipXEUC70gtwKWYazFwzGn11QWUGEASSY8dv5Mwqv3WpswW/adL4kLzKSjW
	 QHyAIFSixpjR8XGYSwzZj7auAYdv5fiwoPoc/bXGpovHi58gAMlQo/ww4/E2YTpK4rQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795641477;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=KMUJkdmWR9o36UWMZ54x3x27bnMAHlQEQEtkk7tI4lc=;
	b=YZhwX4QzzNPMYtVQdv/YU5Jnd7Qg4AyDSVPY9s7go7MtLCztLM/97fT45IwPQp2QqmAP
	 +VRHLeDXGiwRsQYnZM4N/fX2WiZy0XExvnFCvdVwDswXaL5eWTMvHhgOXk8ytn/eSC9R2
	 kSzoY9QqBlnibwujy80/1DW28LQdUSpV9iZLuwHflLHclDFNofGgbcnl8KTXf4lyfvCVN
	 O9Qca+g1K6fiR+7c5lZUpAQVz3jLKHSYXYMRl81pN/UVbgdKrcqQWtRX05ghX6OLUyS8a
	 18oXFpxXjREhxLq+A3zReuhHeiFjNlMPB4y684UYf0KPGq/lFnY34Mr9P7kEiRxv5+g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 611A81F000CA;
	Wed, 25 Nov 2026 21:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795641477;
	bh=KMUJkdmWR9o36UWMZ54x3x27bnMAHlQEQEtkk7tI4lc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=C+nZQ+9gEInkH4MHMEcpsUQCAHyNACe+vDVyoLa8E8SIEJtLIawBpPUQFZ6SDcKLW
	 v0HCcPMVJ53AHet17bcSh/kCSscoRuTDIz7cHdTZh1fVjHfqHAq9k1LtFaSLw66CDM
	 tjAHIx29ZNI783v2lB1im9WSEkD78XD8GqxVL32kC0Qydckufqd/IYJcnRPonSjRcS
	 m1ICt4FJFVybdxpB/jkUNS76i+vghPPHUUmlJuoE6P9z+19ataRfZC/R50EDEal2Kl
	 6uMWeCRdxGcl0Lu893/F8dtyrbBn8R8P1W7mw4LZwqnnk6TNQqBG6jAbDx90t6SbqR
	 Csv8vwU3Sb99g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D9CA24D063;
	Wed, 25 Nov 2026 21:17:46 +0000 (UTC)
From: Kalash Nainwal via B4 Relay <devnull+kalash.nexthop.ai@kernel.org>
Date: Wed, 25 Nov 2026 14:17:46 -0700
Subject: [PATCH net-next v2 1/2] tcp: add net.ipv4.tcp_l3mdev_exempt_ports
 sysctl
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
Message-Id: <20261125-tcp-l3mdev-exempt-ports-v2-1-b920f3ff8f5e@nexthop.ai>
References: <20261125-tcp-l3mdev-exempt-ports-v2-0-b920f3ff8f5e@nexthop.ai>
In-Reply-To: <20261125-tcp-l3mdev-exempt-ports-v2-0-b920f3ff8f5e@nexthop.ai>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, David Ahern <dsahern@kernel.org>, 
 Ido Schimmel <idosch@nvidia.com>, Neal Cardwell <ncardwell@google.com>, 
 Kuniyuki Iwashima <kuniyu@google.com>
Cc: Shuah Khan <shuah@kernel.org>, Joel Granados <joel.granados@kernel.org>, 
 netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Kalash Nainwal <kalash@nexthop.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7950; i=kalash@nexthop.ai;
 h=from:subject:message-id;
 bh=wcvbsSxrpUoGrMTeVR92LKZ2d/1VPd07LUNBhBCdv/E=;
 b=owEB7QES/pANAwAKAdTKslu1X9B2AcsmYgBrB1B5nkFonQ0McocwlQjUpz7qpWYDKx3oTjwv+
 yOECR9vkRKJAbMEAAEKAB0WIQSWKdfHnHcAucb08LDUyrJbtV/QdgUCawdQeQAKCRDUyrJbtV/Q
 dg4XDACErpMjRUK2baFsuftBCJhgFzZ4OKyxfuEFa7S1LNHmwI0pHweLkzvC9nwx4ldOCjEd3YJ
 ClngCf9jo8r8pXFYWkBqXnsEGcd31D/NLgQ4eGIInTwPUtIcoYRv92oOJHQYj8HKRuzPVDC2Pd7
 T1rPrquj9mVrMfDIEeCpUSdKfkxnxNKR+4XHX4QEHKs+KK8mkHfE6nIGEaRG6GK+9bdBUM+PSEm
 hHK2J1WfuZqZO1qvJ+i5dWV/svYa0GpYRMovjtQ6VfUpm+5Q2u1nMGDByfVoERQ/yeTSN9YiwM+
 EvahxJ5V/ao3OzRvQKdBF7X8dz5s6WTLkMj/cTv2Ehd+wv5KEEhWjfVzkcNaKezPB0Sv2ISbr2E
 00jl5pdeh1X1xvnxfqz1T6Ydt7g89b1aFnRj/gE6GAJHs1NO4M765f6avP3aMg5ex/6fd5Ku1R9
 cAcsSFIY34GUcCCcco/Zk1iv4SR6k2fX8c1a2WyY6U+nHSUjSTNWnKgTayRrj/v+87P24=
X-Developer-Key: i=kalash@nexthop.ai; a=openpgp;
 fpr=9629D7C79C7700B9C6F4F0B0D4CAB25BB55FD076
X-Endpoint-Received: by B4 Relay for kalash@nexthop.ai/default with
 auth_id=1588
X-Original-From: Kalash Nainwal <kalash@nexthop.ai>
Reply-To: kalash@nexthop.ai
Content-Transfer-Encoding: 7bit

From: Kalash Nainwal <kalash@nexthop.ai>

With tcp_l3mdev_accept=1, an unbound listener also matches connections
that arrive in a VRF. If a VRF-bound listener exists on the same port
and both use SO_REUSEPORT, the lookup returns whichever is first in the
listen bucket, not the VRF-bound one. Since AF_INET and AF_INET6
reuseport sockets are inserted at opposite ends of the bucket, the same
setup can pick the VRF-bound listener for IPv4 and the unbound one for
IPv6.

This breaks, for example, a BGP daemon with a TCP-MD5 key only on its
VRF-bound listener: IPv6 peers in the VRF reach the unbound listener
and the session comes up without MD5.

Add net.ipv4.tcp_l3mdev_exempt_ports, a per-netns port list in the
same format as ip_local_reserved_ports. For a listed port, an unbound
listener does not match connections that arrive in a VRF, so only a
listener bound to the VRF or to the receiving device can take them.
Only listener lookup changes. Other ports and default-VRF traffic are
not affected. The default is empty.

Signed-off-by: Kalash Nainwal <kalash@nexthop.ai>
---
 Documentation/networking/ip-sysctl.rst             | 24 ++++++++++++++++++++++
 .../net_cachelines/netns_ipv4_sysctl.rst           |  1 +
 include/net/ip.h                                   | 15 ++++++++++++++
 include/net/netns/ipv4.h                           |  3 +++
 net/ipv4/inet_hashtables.c                         |  5 +++++
 net/ipv4/sysctl_net_ipv4.c                         | 21 +++++++++++++++++++
 net/ipv6/inet6_hashtables.c                        |  4 ++++
 7 files changed, 73 insertions(+)

diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
index 3cc80d9b024..c66b9420cdf 100644
--- a/Documentation/networking/ip-sysctl.rst
+++ b/Documentation/networking/ip-sysctl.rst
@@ -619,6 +619,30 @@ tcp_l3mdev_accept - BOOLEAN
 
 	Default: 0 (disabled)
 
+tcp_l3mdev_exempt_ports - list of comma separated ranges
+	TCP ports for which tcp_l3mdev_accept does not apply to listener
+	lookup. When tcp_l3mdev_accept is enabled, a listen socket that is
+	not bound to a device also matches connections that arrive in an L3
+	domain (e.g., a VRF). For a port in this list, such a socket does
+	not match these connections; only a listen socket bound to the L3
+	master device or to the receiving device can accept them.
+	Connections that do not arrive in an L3 domain are not affected.
+	This applies to both IPv4 and IPv6.
+
+	Only the choice of listen socket changes. Lookup of established
+	sockets and bind() port conflict checks still follow
+	tcp_l3mdev_accept.
+
+	This is useful when the same port has both an unbound listener and
+	a listener bound to a VRF, and VRF connections must reach the
+	VRF-bound one (for example, when only it has TCP-MD5 or TCP-AO
+	keys configured).
+
+	The format is the same as ip_local_reserved_ports, e.g.
+	"179,5000-5010". Writing to the file replaces the current list.
+
+	Default: empty
+
 tcp_low_latency - BOOLEAN
 	This is a legacy option, it has no effect anymore.
 
diff --git a/Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst b/Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst
index 2833ce6cba1..062153c2793 100644
--- a/Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst
+++ b/Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst
@@ -150,6 +150,7 @@ struct_ping_group_range         ping_group_range
 atomic_t                        dev_addr_genid
 unsigned_int                    sysctl_udp_child_hash_entries
 unsigned_long*                  sysctl_local_reserved_ports
+unsigned_long*                  sysctl_tcp_l3mdev_exempt_ports                                   read_mostly         __inet_lookup_listener/inet6_lookup_listener
 int                             sysctl_ip_prot_sock
 struct_mr_table*                mrt
 struct_list_head                mr_tables
diff --git a/include/net/ip.h b/include/net/ip.h
index 5035b313a26..a5f9efe15b2 100644
--- a/include/net/ip.h
+++ b/include/net/ip.h
@@ -396,6 +396,21 @@ static inline bool inet_port_requires_bind_service(struct net *net, unsigned sho
 }
 #endif
 
+/* For ports listed in net.ipv4.tcp_l3mdev_exempt_ports, a listener that
+ * is not bound to a device does not match connections received on an L3
+ * master device slave, even with tcp_l3mdev_accept=1. Only listener
+ * lookup uses this. Applies to IPv4 and IPv6.
+ */
+static inline bool tcp_port_l3mdev_exempt(const struct net *net,
+					  unsigned short port)
+{
+#if defined(CONFIG_SYSCTL) && defined(CONFIG_NET_L3_MASTER_DEV)
+	if (net->ipv4.sysctl_tcp_l3mdev_exempt_ports)
+		return test_bit(port, net->ipv4.sysctl_tcp_l3mdev_exempt_ports);
+#endif
+	return false;
+}
+
 __be32 inet_current_timestamp(void);
 
 /* From inetpeer.c */
diff --git a/include/net/netns/ipv4.h b/include/net/netns/ipv4.h
index 3efbc7f4b4f..bff91c8b30c 100644
--- a/include/net/netns/ipv4.h
+++ b/include/net/netns/ipv4.h
@@ -271,6 +271,9 @@ struct netns_ipv4 {
 
 #ifdef CONFIG_SYSCTL
 	unsigned long *sysctl_local_reserved_ports;
+#ifdef CONFIG_NET_L3_MASTER_DEV
+	unsigned long *sysctl_tcp_l3mdev_exempt_ports;
+#endif
 	int sysctl_ip_prot_sock;
 #endif
 
diff --git a/net/ipv4/inet_hashtables.c b/net/ipv4/inet_hashtables.c
index 860145d810e..063f6dd00a6 100644
--- a/net/ipv4/inet_hashtables.c
+++ b/net/ipv4/inet_hashtables.c
@@ -362,6 +362,11 @@ static inline int compute_score(struct sock *sk, const struct net *net,
 
 		if (!inet_sk_bound_dev_eq(net, sk->sk_bound_dev_if, dif, sdif))
 			return -1;
+
+		if (!sk->sk_bound_dev_if && sdif &&
+		    tcp_port_l3mdev_exempt(net, hnum))
+			return -1;
+
 		score =  sk->sk_bound_dev_if ? 2 : 1;
 
 		if (sk->sk_family == PF_INET)
diff --git a/net/ipv4/sysctl_net_ipv4.c b/net/ipv4/sysctl_net_ipv4.c
index 9df93ad219d..153b21f607a 100644
--- a/net/ipv4/sysctl_net_ipv4.c
+++ b/net/ipv4/sysctl_net_ipv4.c
@@ -903,6 +903,13 @@ static const struct ctl_table ipv4_net_table[] = {
 		.extra1		= SYSCTL_ZERO,
 		.extra2		= SYSCTL_ONE,
 	},
+	{
+		.procname	= "tcp_l3mdev_exempt_ports",
+		.data		= &init_net.ipv4.sysctl_tcp_l3mdev_exempt_ports,
+		.maxlen		= 65536,
+		.mode		= 0644,
+		.proc_handler	= proc_do_large_bitmap,
+	},
 #endif
 	{
 		.procname	= "tcp_mtu_probing",
@@ -1708,10 +1715,21 @@ static __net_init int ipv4_sysctl_init_net(struct net *net)
 	if (!net->ipv4.sysctl_local_reserved_ports)
 		goto err_ports;
 
+#ifdef CONFIG_NET_L3_MASTER_DEV
+	net->ipv4.sysctl_tcp_l3mdev_exempt_ports =
+		kzalloc(65536 / 8, GFP_KERNEL);
+	if (!net->ipv4.sysctl_tcp_l3mdev_exempt_ports)
+		goto err_l3mdev_ports;
+#endif
+
 	proc_fib_multipath_hash_set_seed(net, 0);
 
 	return 0;
 
+#ifdef CONFIG_NET_L3_MASTER_DEV
+err_l3mdev_ports:
+	kfree(net->ipv4.sysctl_local_reserved_ports);
+#endif
 err_ports:
 	unregister_net_sysctl_table(net->ipv4.ipv4_hdr);
 err_reg:
@@ -1729,6 +1747,9 @@ static __net_exit void ipv4_sysctl_exit_net(struct net *net)
 	unregister_net_sysctl_table(net->ipv4.ipv4_hdr);
 	kfree(table);
 	kfree(net->ipv4.sysctl_local_reserved_ports);
+#ifdef CONFIG_NET_L3_MASTER_DEV
+	kfree(net->ipv4.sysctl_tcp_l3mdev_exempt_ports);
+#endif
 }
 
 static __net_initdata struct pernet_operations ipv4_sysctl_ops = {
diff --git a/net/ipv6/inet6_hashtables.c b/net/ipv6/inet6_hashtables.c
index 1eea584d80d..43c52b56e8b 100644
--- a/net/ipv6/inet6_hashtables.c
+++ b/net/ipv6/inet6_hashtables.c
@@ -141,6 +141,10 @@ static inline int compute_score(struct sock *sk, const struct net *net,
 		if (!inet_sk_bound_dev_eq(net, sk->sk_bound_dev_if, dif, sdif))
 			return -1;
 
+		if (!sk->sk_bound_dev_if && sdif &&
+		    tcp_port_l3mdev_exempt(net, hnum))
+			return -1;
+
 		score =  sk->sk_bound_dev_if ? 2 : 1;
 		if (READ_ONCE(sk->sk_incoming_cpu) == raw_smp_processor_id())
 			score++;

-- 
2.43.0



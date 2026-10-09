Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563752D8378
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 12:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791548679; cv=none; b=ubYxRR8WKLlHehHDyvTj2UUUqi1O02+PZCadrcCNofQeaR+dS6FA0TqmnfBWjYr0vWGNAjnMCVq75nScaMu1SN/FBTEW/fUNWJNrHpt2ilwb3jLOLo3KHrdzpVmNscE8PGG8OW34as0lhgwtqVFmj7CJej38ju06vlMajUn9fro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791548679; c=relaxed/simple;
	bh=FafXNBaNk0cG2dtQWl72g13JEc6h8ghApT9Z9T1waXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BSZcWenWQWEg6aa3jepC7zamsohQTdVRq/iVqoZ6nWlBusrywHLsqHO66+5IO/SJW++uEUC20kAkCS6cDtckxpknYDb6Q5RB8wc8OARq5qovLczqO6Sa1GWDeFx0CLxqobx6RGhwXg/3kf0CoF+XrqemSV5F95a+7Rz2ovzUhJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=LEASF/i3; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="LEASF/i3"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso3627317a91.1
        for <linux-kselftest@vger.kernel.org>; Fri, 09 Oct 2026 05:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1791548672; x=1792153472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iuOXZ6GNDsSWzbOB5HKjThv6DdLSuE1VHNq9L4RX/IM=;
        b=LEASF/i3sL4adn1dDsWR7DvfCdgFmhONFL3CJoDBpUNhW4yQpOi9Ku1T77yth9BS7C
         yWmwkOVEwDMo+P5XQEvyYyt62dLLK1+A7Vy2zLVEo37TlfE9KMr6QaUXJU4a9iCBfXq6
         s+ayYvP3QhQMeT62wH3nKssfkGLj2f1b9HiCLE0CQg6HRwrWL73ObSa9cFtU3hVtOnX0
         ATpuHSbRrB0L6lJHK71RoipL8e1e2chtDb5Y/0l8h0d58hN/oavj+O3HnSetc7iMu98W
         tlwPh5NNtKVSRlNlD0tct4RwBWcIL/nDuKJhFMtXcEk8HqgOEjfOEdFNE2ynwgVWS4ZT
         NCvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791548672; x=1792153472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iuOXZ6GNDsSWzbOB5HKjThv6DdLSuE1VHNq9L4RX/IM=;
        b=cVE1jfu1rMyQr9skRtC7kqE8pAg7KhGSh1wweUUSdZ+v+sQvmYR7h4lL7zLzxLcNEi
         TnHfsUlvPZ9ratqjbrbvcrb/dq0fKTaeKb7RGr7SA4AGG69e5mo7qX8JaCIlXHMLF3LB
         qGD9K174KMPTH4a2VgdMUjc5IbF7OhNsNDufpbJxFCZQe11Yhb+pgY2+lCTzqlbbWOHX
         hE/HMJXDmLlVYyibrQKH2U3WgSQ6V9m1wDRFmLeTLb+ru9Yiuz4z201ULAGcqHCt/T06
         BdFeGSZG9779sU2MScklYuYx1A7HmGbqMU/ZPCgccmJpdulnIrU4Tm3pN1IphbrjCJkt
         1M/g==
X-Forwarded-Encrypted: i=1; AKwUvBw66d5aRcsPu5TE1WKkQiFAVnOfeCSI4+u+H6/v/9zSp1kPD4eTDjYqTc/OpP/0vxBXS7YjizCY6w4Wu/oGEb8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1iPes8NIBA7wbr12jlQ1DwRssYSU9m2q01ebkC9sus6ybxjQj
	yyUrA71HVTZ9hzp/ZYEGGhmhh3IR3cnxzmI2+JHkxII+yPLkDZElphRGaQFV9AwhQGA=
X-Gm-Gg: AYBFou3wOoZBIiRvs0Lugj/zn1HwQ2FG/082pjaX97/GM3lImkRHEfgCsPlo2pEgKhM
	wzI6osFsWdAHiwjrDwmc2lUA2sAz4EKFMClB1Sb+rTmmVTuwWLdMF+ZtqB9JpcSofBgb+zn7HOR
	uKKTJw/bLE25UzLDrmRn6+Tf7AgykhmTdUjnld8ijbHeUZ8lB0UwUaVXFGkQXhX1KWh2sqzANJB
	vcfjpgH4s2vKiQyN1F5Sk80grXXYOd88l+C3uf6GK3zPou1vK9OvQXJBsyB74EBWQ6R57/hvLGL
	aw+/mm9mGpaPQbv4WVmd+oW+HCG0K59bvtOaKKlmzZSg4NQHp/8ct8BX5SuIqx66sdHq3Gd8CJl
	i4tdLl5j2j8jyVcsjOoBaIKpM8hhTNYvjF9GkAwX57M3jgs2+agRK01lt9memltNsASOHW/f6J7
	AayShdoghbJl7F/y3J1NblUJVHOqJZbfedC41deUM4D87OSSIb9nwjZp/m+9LYUH9+RKQbxjxHQ
	0x4yaB6FNvGsrt1KSK6uAY1W9xrEe7ZsAge7Lfj
X-Received: by 2002:a17:90b:5346:b0:3a9:4e51:984b with SMTP id 98e67ed59e1d1-3ab3a747329mr1724018a91.14.1791548672432;
        Fri, 09 Oct 2026 05:24:32 -0700 (PDT)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab55e41eefsm1660502a91.10.2026.10.09.05.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 05:24:31 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 01/13] amt: create an AF_INET6 encapsulation socket for an IPv6 outer address
Date: Fri,  9 Oct 2026 12:24:14 +0000
Message-ID: <20261009122426.551178-2-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009122426.551178-1-omar@blockcast.net>
References: <20261009122426.551178-1-omar@blockcast.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The amt device binds one AF_INET UDP socket on the relay port, so a
relay and its gateways can only talk AMT over IPv4. RFC 7450 defines the
protocol over either IP version: the Relay Advertisement carries an IPv4
or an IPv6 relay address, and the relay answers in the IP version of the
Discovery (s5.1.2.5), so an IPv6-only access network needs an IPv6 outer
transport to reach the relay at all.

Add the outer IPv6 local address to struct amt_dev, and amt_v6(), which
reports the device's outer family from it. The inner family is
independent of the outer one: the bool v6 arguments keep selecting IGMP
or MLD, and a device of either outer family carries both IPv4 and IPv6
multicast. amt_create_sock() binds an AF_INET6 socket for an IPv6
device. The socket sends and verifies the UDP checksum, which RFC 8200
s8.1 makes mandatory over IPv6, and it is V6ONLY, so that it does not
also claim the IPv4 wildcard port, which an IPv4 amt device in the same
netns may hold.

The socket is also bound to the underlying link, IFLA_AMT_LINK. The
IPv4 paths pass that link as the output interface, and an IPv4 route
lookup then only uses routes through it. An IPv6 lookup that has a
source address, as every AMT send does, treats the output interface as
a preference unless the socket is bound to a device, so without the
binding the outer IPv6 traffic could leave through another link while
the device's MTU and headroom are derived from this one. The binding
also keeps packets that arrive on other links away from the socket. A
link-local address is unique only on its link, and relay tunnels are
keyed on the gateway's address, so two gateways on different links
with the same link-local address would otherwise share a tunnel, and
the replies would go out the wrong link.

The new socket also hands ICMPv6 errors to amt_err_lookup(). This relies
on amt_parse_type() pulling the AMT header behind the transport header,
as "amt: pull the AMT header behind the transport header in
amt_parse_type()" (eb0c18404c89) makes it do, since on the error path
skb->data points at the quoted IPv6 header.

Nothing sets local_ipv6 until the netlink attribute added at the end of
this series, once every path can use it. No functional change.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 34 ++++++++++++++++++++++++++++------
 include/net/amt.h |  2 ++
 2 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 81d26ef..423ed77 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -80,6 +80,14 @@ static struct in6_addr mld2_all_node = MLD2_ALL_NODE_INIT;
 static struct mld2_grec mldv2_zero_grec;
 #endif
 
+/* The outer transport family is fixed when the link is created: an IPv6
+ * local address selects IPv6, otherwise the device runs over IPv4.
+ */
+static bool amt_v6(const struct amt_dev *amt)
+{
+	return IS_ENABLED(CONFIG_IPV6) && !ipv6_addr_any(&amt->local_ipv6);
+}
+
 static void __amt_source_gc_work(void)
 {
 	struct amt_source_node *snode;
@@ -2984,19 +2992,33 @@ drop:
 	return 0;
 }
 
-static struct sock *amt_create_sock(struct net *net, __be16 port)
+static struct sock *amt_create_sock(const struct amt_dev *amt)
 {
 	struct udp_port_cfg udp_conf;
 	struct socket *sock;
 	int err;
 
 	memset(&udp_conf, 0, sizeof(udp_conf));
-	udp_conf.family = AF_INET;
-	udp_conf.local_ip.s_addr = htonl(INADDR_ANY);
+	if (amt_v6(amt)) {
+		/* Bound to :: by the memset, and to the underlying link, so
+		 * that IPv6 route lookups are strict about the output
+		 * interface, as IPv4 ones are, and a link-local peer is
+		 * unique. V6ONLY leaves the IPv4 wildcard port to an IPv4
+		 * amt device.
+		 */
+		udp_conf.family = AF_INET6;
+		udp_conf.bind_ifindex = amt->stream_dev->ifindex;
+		udp_conf.use_udp6_tx_checksums = true;
+		udp_conf.use_udp6_rx_checksums = true;
+		udp_conf.ipv6_v6only = true;
+	} else {
+		udp_conf.family = AF_INET;
+		udp_conf.local_ip.s_addr = htonl(INADDR_ANY);
+	}
 
-	udp_conf.local_udp_port = port;
+	udp_conf.local_udp_port = amt->relay_port;
 
-	err = udp_sock_create(net, &udp_conf, &sock);
+	err = udp_sock_create(amt->net, &udp_conf, &sock);
 	if (err < 0)
 		return ERR_PTR(err);
 
@@ -3008,7 +3030,7 @@ static int amt_socket_create(struct amt_dev *amt)
 	struct udp_tunnel_sock_cfg tunnel_cfg;
 	struct sock *sk;
 
-	sk = amt_create_sock(amt->net, amt->relay_port);
+	sk = amt_create_sock(amt);
 	if (IS_ERR(sk))
 		return PTR_ERR(sk);
 
diff --git a/include/net/amt.h b/include/net/amt.h
index 2846dde..8df7d43 100644
--- a/include/net/amt.h
+++ b/include/net/amt.h
@@ -344,6 +344,8 @@ struct amt_dev {
 	__be16			gw_port;
 	/* Outer local ip */
 	__be32			local_ip;
+	/* Outer local IPv6 address, :: unless the outer transport is IPv6 */
+	struct in6_addr		local_ipv6;
 	/* Outer remote ip */
 	__be32			remote_ip;
 	/* Outer discovery ip */
-- 
2.43.0


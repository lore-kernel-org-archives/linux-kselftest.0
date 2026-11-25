Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634094;
	b=vDoZA139/LDfxHoaBxUIBrnRzuFC9M/L/lQTyYcun6q5EO+lgeX+A55rUMuUcvS+1K8E
	 O0edKNeR4zPc0iYLolce0Y9v0zBI/xECan7OwEJtfu1dXjc/etPZUB/HsYf6AaUK3H+Ok
	 0564vp6u3JnHzB3xqenlDJvpyrbYGHet4B23edDqUWB9AM56XsQeQumErJLV8il1MyP8v
	 hl5hzOjPLB6lHVa8jKY+f8ab+Q/y0+8vFbBWpGcorCnEPYjP+tBf4lU0KAvZTZFZ73pZg
	 1Gysm1dV9Xa1P47kKpR7cDkGi4G3Xh96zEy5ewOKUmbeiUL1Ak27fGPrv/sRYEU5mgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/u8JtBXWrTUayWu9Ilvo6hMsG+mxMh8x/BdVXPiMsSk=;
	b=UL7+sKw0ODLiDaSkUkrOck/b7m40EXGjR67JBeWjUNxMUAJC1j2TthCsxFskLO9Gw3Ls
	 hANuH/cD5C0irPQO2B/qQa5gFjblT/9VGBr0I1ZWC2cQ24mXOstF5SAI7cGUUvrliHKjZ
	 dC9mttDhQoqieymYTrK6wykYv2C4uE6iifXHeJVx7NXZi4VOpx6uDiB+jiezLETuZ9JbM
	 7wBmBXudquGsTLIb83FeqOz++PQi0KvgRWHIICUF7uEozEad/n5U1/gEBobAW9R0oLxKV
	 5Qe63nSJGSTnROqrnLh/TmydTToGFDoq0dTvVOaFZDQwmz6ykvpbc11I9lMdAHdbrPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=O2aUqdxr;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C093606A337
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 19:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C093606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=O2aUqdxr
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cde1479f76fso3459347a12.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 11:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795634093; x=1796238893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/u8JtBXWrTUayWu9Ilvo6hMsG+mxMh8x/BdVXPiMsSk=;
        b=O2aUqdxrWCjg7dDaNkqMKwj5QsKJip9yrAyWbYm1i6328Dt7cKh9pGyObbHSa1MTgu
         OUjc9PiplFLo+3+r3EF+2qr7fnF0CctereiYWoCsaJOOY2WoVj8f2672qHEoXX8IR0aR
         XnvpywPlrIDlW4G2EoMxMLo8kslAPvSsxr9vab0Utc06SkccZXW2It83xdGu2J/4azVB
         Azh0srKy7BVovY8LxDSvnKpTd9lnrMohr48NPssmVDPpeFGnfYWJPqchDfIC5eFEG2tQ
         uR7XAVZFusswf1ukpVOsLo+vpoJ7BGqEz8ug2odaw7KGOqOWGSd6JN2TIIdzqD3r0fVx
         srQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634093; x=1796238893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/u8JtBXWrTUayWu9Ilvo6hMsG+mxMh8x/BdVXPiMsSk=;
        b=Go8yNQ1E0bSE5t9H3aBlTeYhwTflHs752lzo8NlxY9g7UNqk1TSFEMKHWjZaKe+i40
         zf9N+TzB0dg6QwX0o24mdhDufP6mxiR6lrCx7mjjuyf1y2pAs8EBBeQssRZ/Q0j7HmDt
         oX4XnMB7VLcxCfGSU73q7Owta7U/dmlLFWNoMmKle0I9z1tOsZMFju6RXRWvEN5HHvkR
         wiVVbY6Lo02UyMTvLQ8CibennnH0kfI855AYZPgssrfXIQGAMm47Ui6umGdGeIXCkyUD
         cQUxE6HUJAH3nvDL2KbtrAwciUmkggBosRg8n02k2ouWWOxgU7QCVHT88fT5Rh5nfnjK
         dSdw==
X-Forwarded-Encrypted: i=1; AL+hErFDbX7N4zU0GfqFjRvC0xfOwGM3omOZwAIK/IEiLmGXl99sKRIC6ayvtobKSXHubB94AbHsxicCYBSe0JD4ewE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+I19NsGjcuTvJ8ydtXcYVyuVzCJjYuIBWIrQ9ppBab5JFLO7IN
	9XrlKgQo0bq9rU5+hk8hOAQScDUUFLqofOyRpecWThfpNWD1DXBPgW+iojoR5BsxI3E=
X-Gm-Gg: AZFdTZePibbSEydejpXQOWuS+Fjr04cU+0qBbShqg5Kphfo6aLryTXydoSGjwbskYwW
	whRnN0Kj3ObFH80aBgV5QuJBy1IYbWpbrP+jitJsGg0SeZTLQ2WC3Wktxao39JuaT8tEH6KDdk9
	iOTI147pj6sHZ6XifI1HiVDmAYjhHVBwBUZ0h7OeCU/4NN2p1RVL0qFzKqM9i0s24zzRLmi1Nt8
	5WhizthC+MbNsFzLUsk5A+/XPqc+Vpf8vOHyNWkI4K1gXEnmAdUmzgHB/Oo4t8VVgNnYpj5SrLm
	CYrU3Olo/rCetHBfiab+OZsvMHbH3GaHbXuNc+WvrgWaPASA8FFhtn11eyUkWs9DQbZZdIXuBem
	zSWoWiH+aI8H9bzif40jnb7s7BbBn3mikef52F12dP7EmYWs5CeVHHztNBlDPyARz4XZQdAcUpo
	FBwThjHbTv3VGHRtSHaeFBaPU5hUDEPIJFVw70TWaeF2jYe+1MNicTx5QYWk1MCxvdgwCjYVisP
	geEtOYdjX2ujLRia4mwBMOEzq+CXloX7XCu6K19jdwcWstvN/Oaw0ugHKk5jI9HmcHGQDUCtgZF
	pLYVONh1mYr9cEfjGaUt9xvREbHaId4O56qCREMk4UiYG1W89gRXWHkm94bAtvlZpMbXJYQykzl
	nTGjDPlxc/eASh8h3bA9VMuzbMCunmienAfYZuJx7Xs54tORXo7k=
X-Received: by 2002:a17:903:41c2:b0:2dd:b795:9cb6 with SMTP id d9443c01a7336-2f03f1cfad8mr200173395ad.21.1795634093613;
        Wed, 25 Nov 2026 11:14:53 -0800 (PST)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b66sm92413855ad.51.2026.11.25.11.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:14:52 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 01/12] amt: create an AF_INET6 encapsulation socket for an IPv6 outer address
Date: Wed, 25 Nov 2026 19:14:39 +0000
Message-ID: <20261125191450.2497936-2-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125191450.2497936-1-omar@blockcast.net>
References: <20261125191450.2497936-1-omar@blockcast.net>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The amt device binds one AF_INET UDP socket on the relay port, so a
relay and its gateways can only talk AMT over IPv4. RFC 7450 defines
the protocol over either IP version: the Relay Advertisement carries
an IPv4 or an IPv6 relay address, and s5.2 selects the form from the
IP version of the outer header, so an IPv6-only access network needs
an IPv6 outer transport to reach the relay at all.

Add the outer IPv6 local address to struct amt_dev, and amt_v6(),
which reports the device's outer family from it. amt_create_sock()
binds an AF_INET6 socket for an IPv6 device. The socket sends and
verifies the UDP checksum, which RFC 8200 s8.1 makes mandatory over
IPv6, and it is V6ONLY, so that it does not also claim the IPv4
wildcard port, which an IPv4 amt device in the same netns may hold.

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
amt_parse_type()" in net makes it do, since on the error path skb->data
points at the quoted IPv6 header.

Nothing sets local_ipv6 yet. The netlink attribute that does is added
at the end of this series, once every path can use it, so there is no
functional change here.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 36 ++++++++++++++++++++++++++++++------
 include/net/amt.h |  2 ++
 2 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index b145ed3ca..3f3205d2d 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -90,6 +90,14 @@ static struct in6_addr mld2_all_node = MLD2_ALL_NODE_INIT;
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
@@ -3310,19 +3318,35 @@ static int amt_err_lookup(struct sock *sk, struct sk_buff *skb)
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
+		/* Bound to :: by the memset, and to the underlying link: a
+		 * bound socket makes every IPv6 route lookup strict about
+		 * the output interface, as the IPv4 lookup is, and receives
+		 * from that link only, where a link-local peer is unique.
+		 * V6ONLY keeps the socket off the IPv4 wildcard, so an IPv4
+		 * amt device can use the same port in the netns. The UDP
+		 * checksum is mandatory over IPv6.
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
 
@@ -3334,7 +3358,7 @@ static int amt_socket_create(struct amt_dev *amt)
 	struct udp_tunnel_sock_cfg tunnel_cfg;
 	struct sock *sk;
 
-	sk = amt_create_sock(amt->net, amt->relay_port);
+	sk = amt_create_sock(amt);
 	if (IS_ERR(sk))
 		return PTR_ERR(sk);
 
diff --git a/include/net/amt.h b/include/net/amt.h
index 9ba097127..ca35782f8 100644
--- a/include/net/amt.h
+++ b/include/net/amt.h
@@ -361,6 +361,8 @@ struct amt_dev {
 	__be16			gw_port;
 	/* Outer local ip */
 	__be32			local_ip;
+	/* Outer local IPv6 address, :: unless the outer transport is IPv6 */
+	struct in6_addr		local_ipv6;
 	/* Outer remote ip */
 	__be32			remote_ip;
 	/* Outer discovery ip */
-- 
2.47.3


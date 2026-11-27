Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772828;
	b=RfmrtIuDRU+ocJJxWauKFjUfwuGZb5mi5NtfN8LONTUvBIu8TcgYjaLvo8qvolZaLKrj
	 rhI8shuGDG+goAS3m6ejVpQe8oKnUa+sYuteA4PlCKS/k6KmDXpEqfsW/3IS98VbCOseu
	 mWscnXlGAB0qQjz8Z3rNrxPvc/5U0Y0L/t5SgZQ0uzZ1zHMPNVe8IGXwbdnNf5DyTIVn2
	 dTTyWMPUzdryptAr6lF7BODrASCofRJuRrU5UlWh8WaPA7zcLa6vyznuwRVAIqMmtVyUz
	 3A5y/r40jcorGY/+D7IbyueP1iXnR7K6X1yDaYCgf1X4pWA3afemVcsFSgO9mWDqjLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772828;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DChxuWi1QfV4n8QP1UzjQQITjBXMyISv+4oZQzrmx/Y=;
	b=Ua0xw+govBoS5L9TvHhGHNN3UY1CzknEne5HoPZqHvX2dBzt/bjs5eBhT7vbbXdv2ifi
	 LHP+Z72ilO6DYoM9Trd+1SzoVyx+JGHPwEz+DLr2+36La3c9s+6Ut8JnpFnCdJXri/Cte
	 84wjnb30rJ4uVMujCsooA+NvD/SEpt3abQ+gZjEM14RMmOOdZb0YoNWM3YIQp/GXQ9WTZ
	 fF9SDIX8aRyDN6GyYf9m0CRAveWwi1M4UCwSK1N58DYc3jO0vmId0BCJnCZ0KA8WI3bj3
	 Z4qIhlJD5ijjzaFl5bgf0+WJSN8c/B7tfc8agYQ1zNkNfJnjevAIQyucDQcDV4CuboQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=PZ5OkWsO;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8FE606A332
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 09:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F8FE606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=PZ5OkWsO
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-15dd124bbe7so11670727c88.1
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 01:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795772828; x=1796377628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DChxuWi1QfV4n8QP1UzjQQITjBXMyISv+4oZQzrmx/Y=;
        b=PZ5OkWsOvPVynZ/OsIDD0PmWjYzAOCoHvZEjUg1DHj20NbP1zlASUObN/m5cTCZgkX
         e4vNlNRfgpp7nbPKW0IH7kHU5P7nXR60LiM0qtg72qjLkirT8eC31gphLAr3trxMR0jV
         BxWn3DszDw+LDSqyKIyFOiqwK2HKCmIb8IJaE6woc5UDUic7MXpJ4vykoBscSKdEV3xQ
         kTE8Dddnkw6CShPalyU/0nUypzC+B3h1uJJNtzjXA65kRTeVebuAAUhu0CtOyYF9apYa
         k0iTq30PxH+8ytpxY3J0+0yfN1pheQWMi7bJNT/fzfm9d+YMDzXS51sZF5whTOMcy2U9
         mLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772828; x=1796377628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DChxuWi1QfV4n8QP1UzjQQITjBXMyISv+4oZQzrmx/Y=;
        b=E+Z7BFO8HXmVFwdk85sTsLVBWtWmmbvnSKNUymbtK1ehbgNVQs3SU+3oPHKmGD5G+K
         agdg7Gk4618lx5JJ5gorvgVAtM2MZVHTjKb19KL6gdfvCd3J+L2Gce941bm+pA0QQEgN
         pOYvX00ldpb2ph6jrGWCvIRK3ql2BMUOr9eOi7Prcb5EkixQImO3tuU2b1a+ubVSRtyz
         bQ86Shvh4439shnHAXDwmVWjdq0YJU0HQkoJT5PcxBsTzPksKvYDMiWy984COQmWzTHh
         1FM0mECKU2jjM3flr8Mqu0jsgIg6kq/Zk5ueLzzdtBdR2Z0KLkh9gEGc/e1P5pJWx/13
         jdZg==
X-Forwarded-Encrypted: i=1; AL+hErGN5O0cErFGMZwlEn4RTJ4NPUGww/UsnDFsDOBGzItLxzuoUWKsEyeAUpucUlLeIVtnmA8rO2LLJr+f4cnUh54=@vger.kernel.org
X-Gm-Message-State: APuU4Z81ZizLEAEubZlBpJAjEEaRcnCi5M92QDOaNn6nZBd4cHGjK+/D
	hVKj1sb6FLmrjaJp3Knyz7VbgLCv7TOih3xmswbUlbK/YpMHnsqmoHI4D9uptW1Si6U=
X-Gm-Gg: AZFdTZeDfBEGT1fIjMUIH1ILXPcZBwmyd94jH7JBWo/1OCRvdi7S0fqNiZjAM2DY4O0
	rvmNDBXSqtLkeeINi+MW4p5OzQ/vT7eEpum7SC+RwVfrzTliLtexvtYb5Ph6GXYheeLRUVeeRbM
	jv3/RIjvK9KMrIDcfNHPLfcPgYf9nHFwu2F17G0eAj/6R7wZzQrOl9BVmS07s8+MbHiV2hVpTpR
	ftC5o2cRD/1LftlFJwW/Yp1DUZopFDuq1k0hIlKa8qsJ/wL7bj8ULjV/zsVfwj02jQ/UuKPeInY
	LC/+rQ/uo4DUcKk6UKE+wzSosX47kmQhRWeQS2Uplqb80luueSeLp4w4JV0dit4aimLbgCoJdpU
	5Kinib6j3enkXZyIEpVDCSGwAZbFA1qG0ns8xRSBo56uEmNQ0UrTFi4Hfh4XECjzzIF7gtC/Nos
	F/cR7NS6pylvQxSK2qLcFfDMMO12Ih3I/9msGWxfQnWfUzrVPOIz2mX8dy68Zn1Gj9ieh4vXf6I
	Z6u6paF5LFbYjLODmCHT3dDLycsCR7jEI+bRxmkBRqMhnudlkVP0kJyfnRmZ3qoxqu5bTa5KBv2
	MQZJazzmFy5LaSIMUlUUWRI9UfkfXntIqOARcmXctpGSF3RnixEi46FrkDLmWjUc0lSKcOdLyKU
	9DZd/y9FADtn9UJZ54Kse4/n8VOI=
X-Received: by 2002:a05:7022:e80e:b0:1b5:3b6e:e1ed with SMTP id a92af1059eb24-1b55690bcf3mr27887998c88.32.1795772827534;
        Fri, 27 Nov 2026 01:47:07 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm55115194c88.1.2026.11.27.01.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:47:06 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH net-next v3 01/12] amt: create an AF_INET6 encapsulation socket for an IPv6 outer address
Date: Fri, 27 Nov 2026 09:46:52 +0000
Message-ID: <20261127094703.3025517-2-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127094703.3025517-1-omar@blockcast.net>
References: <20261127094703.3025517-1-omar@blockcast.net>
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
@@ -3310,19 +3318,35 @@ drop:
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

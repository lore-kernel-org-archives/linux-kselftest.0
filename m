Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9054D598E
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 12:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791548708; cv=none; b=ufOdEuUZfZHsXpazLryZZHFFUmZ6QfL/Mef1VOkxuWXOhSvKAMSyCcCbRKC6zFdqzziAASf/mD1dMS+5CZZgmnCbqIthD57NM0j/VDib7o8dSYLBNmvKrF9eTJP7T2cHpoN5udiC9VakFZgtmus/Pzct0UG7hWH/rN3jJuYgmLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791548708; c=relaxed/simple;
	bh=fY5Grftq988zETCKTD+AxH4y9OWlWICKpXj3Ea0plQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EhV9A9GgkfvT7cTiXEzjvro7J4Ji0h1qSOHkAOhtETtTsOPo6RGoaFoliAKavkVQv1GC8qZzqZ3oThQWLGcCgJqPTVTl7SXD/sL7R8RsLo9N68bbv4AquiLJ5Iy9pOIob3kgSXTkZsm/pPU14gl5jnYr1iTZG+5Y5EdHayCppUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=CDlodfux; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="CDlodfux"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso3099399a12.3
        for <linux-kselftest@vger.kernel.org>; Fri, 09 Oct 2026 05:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1791548691; x=1792153491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2LWIHYfSfL38FbGhJOfROiN2A9tR5CGBM+1n/EC/kos=;
        b=CDlodfuxkk/MQrrSkQLWjmcP3DH4ff/GDNxw1X3ZArXWlXyeo+xAi8qnlzvCeWHKbO
         /PBC5NXqJsvejJ0D7ZliNKsicirTyaS1PxOEQ8cb/io3A1ns/cEquSODSxOzYGXBSVwI
         GwM8ee82mI3uc2OcVfxsExe8QnQyaSP5wRt9fgBbVOQVrYvfJhxcH7w8fGSmggf24mBU
         XR4MbJaN+oZmBn5R2YYjbfdZ/y8EunOkW2eWOO1nNySAPCFw7qYD87htVdcZXGobAkZe
         YsQmap8G+05MjI6W8AXp+C2pwIFITbop/IfxXL+j69zgWp00ht9KjvLG2CT7gWRE2Kal
         2I0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791548691; x=1792153491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2LWIHYfSfL38FbGhJOfROiN2A9tR5CGBM+1n/EC/kos=;
        b=up5QjlwaUAvvYSQwBo67ehEIPkFBsXKs5hIGKXMWvwe5IM37x5FRBOxTQCY80joGDu
         6V9yJtJpfmueExe+7sAXDons4g9Uoq3c3mSSuGJHKWC3srKBxnIf4y93h1jvxJ60w+CD
         qz3WpnhN9p85IBfn0YtTk8NrDR5M5wrw1ZKzZwZ7hTaKuDpz5RvmUJKmT7PstwsmBwnP
         r0LYBcvjE8li0LvTZFiN/W4+Q9D8bej4EKEr3e3Ru/fnuFJjDybf7Tzp50auml5nkbES
         etOB5Nq7n+t5Y2b+v5PVTqAxI1rKI5zJaJU+HrD8/iZqHbYMWCFcC5H28iOD27gbG6W+
         Z2WA==
X-Forwarded-Encrypted: i=1; AKwUvBxXzB74RDythSTJr7qL1aHSHAFLq2TzlQ1hg7q3R78WjNr1KS44qVKJt0JpSLIdvtMC2+LrAQ2xn2lGNaMUd8U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWq+BaztfnMrCU11hw+/UkyyVYjqFpw2EdZC4UhZmDiL8xeYzW
	ETW+Y+T0Qe864agQy9Ge4wrw1kTqmlryeKyykFwI/a2DUEi8hEe5GmIClPtWAJMJFTg=
X-Gm-Gg: AYBFou2bzXgl0V4bc5be7tEX6Vqsl2F2I3ymxouYauQxix0u+1u7m5+TiOSEkN0/8BW
	sJQPCVBAY1D+ys2XNtHux/hcNPmD2mjurX/lMDOARilCLdnbcym5ciN686mNEclLp0mm9HTyT7Y
	AepSqKJFtDXxDCkrk7NH11jly4+R6SJzKb00iQWPRh/3USDvYlGxlWA2QmIYaCgKWM1reopTSFC
	+e4AdU1KxXM+9OHa2GFxBfGEDTRFXw3Wtil8nNtsbNu4BFdz1WMhzA0aASFrq4FlYTkVEsTBaen
	CKEZfbLBCJjYjR1NBpjPpVfpPrd143M06NaCps5hYOyFwXYIiwXFGmGaZtGIP6oD23uGPdCMzjY
	fBpuSdhupePQVfytHwJtnXp4XNPydCW0CeHjZaj029SAwm/1arj8nztNi+z1GrYFfZA7/aXjuhk
	NCisDFm81DrHsPzcjbtpJM/SyKO5UE6SSYsCUUY2x6vNg/D8CyGhIjZO1I0WumPLq6IORtneXXv
	EtecHaLi/WvM/Dk7KtfEaxgrQ35V+K03lviBXrW
X-Received: by 2002:a17:90b:4b:b0:3ab:2c2b:1030 with SMTP id 98e67ed59e1d1-3ab3a747cfcmr1496754a91.22.1791548690909;
        Fri, 09 Oct 2026 05:24:50 -0700 (PDT)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab55e41eefsm1660502a91.10.2026.10.09.05.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 05:24:50 -0700 (PDT)
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
Subject: [PATCH net-next 10/13] amt: add netlink attributes for an IPv6 outer transport
Date: Fri,  9 Oct 2026 12:24:23 +0000
Message-ID: <20261009122426.551178-11-omar@blockcast.net>
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

Every path of the relay and the gateway can now run over an IPv6 outer
transport, but nothing can create such a device. Add the attributes
that do:

 - IFLA_AMT_LOCAL_IP6, the local IPv6 address. It selects IPv6 as the
   outer transport and is mutually exclusive with IFLA_AMT_LOCAL_IP.
 - IFLA_AMT_DISCOVERY_IP6, the IPv6 address a gateway sends its Relay
   Discovery to. A gateway's discovery address has to be in the family
   of its local address, as both ends of the tunnel use one outer
   transport.
 - IFLA_AMT_REMOTE_IP6, the relay address the gateway learned from the
   IPv6 Relay Advertisement. Like IFLA_AMT_REMOTE_IP it is only
   reported; unlike that one, the policy rejects it on input.

amt_fill_info() reports the addresses in the device's outer family.
IFLA_AMT_LOCAL_IP6 is refused with -EAFNOSUPPORT on a kernel built
without IPv6, rather than creating an IPv4 device with no local
address. An IPv6 local or discovery address is refused when it is
unspecified, loopback or multicast, as the IPv4 ones are, and also when
it is IPv4-mapped: the V6ONLY socket could never send from or to such
an address, so the device would be created but silently fail every
send.

The existing IFLA_AMT_LOCAL_IP and IFLA_AMT_DISCOVERY_IP cannot simply
carry 16 bytes. Their policy only sets a minimum length of 4, so a
kernel without this series would accept a 16-byte value and use its
first four bytes as an IPv4 address. A kernel that does not know the
new attributes ignores them and fails the request for lack of a local
address, so userspace can tell whether IPv6 is supported. vxlan
(IFLA_VXLAN_LOCAL6, IFLA_VXLAN_GROUP6) and geneve (IFLA_GENEVE_REMOTE6)
add their IPv6 addresses the same way. The attributes are appended to
the enum, so the existing values do not change, and strict_start_type
makes the policy validate them, and any attribute added after them,
strictly.

Because of that minimum length, amt_validate() now refuses a 16-byte
IFLA_AMT_LOCAL_IP, and a 16-byte IFLA_AMT_DISCOVERY_IP on a gateway.
Every iproute2 released before the companion iproute2 patch puts an
IPv6 literal in the IPv4 attribute, and the kernel then creates an IPv4
device from the first four bytes of the address, 32.1.13.184 for
2001:db8::. Such a request now fails with an extack message that names
the problem instead of creating the wrong device. A relay never reads
IFLA_AMT_DISCOVERY_IP, so an IPv4 relay given a 16-byte one still
works as before.

A relay has always ignored IFLA_AMT_DISCOVERY_IP, and existing users may
pass it, so an IPv4 relay still accepts it. An IPv6 relay has no
existing users, so it rejects a discovery address of either family, and
an IPv4 relay rejects IFLA_AMT_DISCOVERY_IP6.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c        | 176 +++++++++++++++++++++++++++++++--------
 include/uapi/linux/amt.h |  13 +++
 2 files changed, 155 insertions(+), 34 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 86f168c..fb199d9 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -3516,6 +3516,7 @@ static void amt_link_setup(struct net_device *dev)
 }
 
 static const struct nla_policy amt_policy[IFLA_AMT_MAX + 1] = {
+	[IFLA_AMT_UNSPEC]	= { .strict_start_type = IFLA_AMT_LOCAL_IP6 },
 	[IFLA_AMT_MODE]		= { .type = NLA_U32 },
 	[IFLA_AMT_RELAY_PORT]	= { .type = NLA_U16 },
 	[IFLA_AMT_GATEWAY_PORT]	= { .type = NLA_U16 },
@@ -3524,8 +3525,25 @@ static const struct nla_policy amt_policy[IFLA_AMT_MAX + 1] = {
 	[IFLA_AMT_REMOTE_IP]	= { .len = sizeof_field(struct iphdr, daddr) },
 	[IFLA_AMT_DISCOVERY_IP]	= { .len = sizeof_field(struct iphdr, daddr) },
 	[IFLA_AMT_MAX_TUNNELS]	= { .type = NLA_U32 },
+	[IFLA_AMT_LOCAL_IP6]	= NLA_POLICY_EXACT_LEN(sizeof(struct in6_addr)),
+	[IFLA_AMT_DISCOVERY_IP6] =
+		NLA_POLICY_EXACT_LEN(sizeof(struct in6_addr)),
+	[IFLA_AMT_REMOTE_IP6]	= { .type = NLA_REJECT },
 };
 
+/* The policy of the IPv4 address attributes only sets a minimum length,
+ * and an iproute2 without IPv6 AMT support puts an IPv6 literal in them,
+ * so the device would take the first four bytes of it as its address.
+ */
+static bool amt_ip6_in_ip4_attr(const struct nlattr *attr,
+				struct netlink_ext_ack *extack)
+{
+	if (!attr || nla_len(attr) != sizeof(struct in6_addr))
+		return false;
+	NL_SET_ERR_MSG_ATTR(extack, attr, "IPv6 address in an IPv4 attribute");
+	return true;
+}
+
 static int amt_validate(struct nlattr *tb[], struct nlattr *data[],
 			struct netlink_ext_ack *extack)
 {
@@ -3550,16 +3568,63 @@ static int amt_validate(struct nlattr *tb[], struct nlattr *data[],
 		return -EINVAL;
 	}
 
-	if (!data[IFLA_AMT_LOCAL_IP]) {
+	if (amt_ip6_in_ip4_attr(data[IFLA_AMT_LOCAL_IP], extack))
+		return -EINVAL;
+
+	if (!data[IFLA_AMT_LOCAL_IP] && !data[IFLA_AMT_LOCAL_IP6]) {
 		NL_SET_ERR_MSG_ATTR(extack, data[IFLA_AMT_DISCOVERY_IP],
 				    "Local attribute is required");
 		return -EINVAL;
 	}
 
-	if (!data[IFLA_AMT_DISCOVERY_IP] &&
-	    nla_get_u32(data[IFLA_AMT_MODE]) == AMT_MODE_GATEWAY) {
-		NL_SET_ERR_MSG_ATTR(extack, data[IFLA_AMT_LOCAL_IP],
-				    "Discovery attribute is required");
+	if (data[IFLA_AMT_LOCAL_IP] && data[IFLA_AMT_LOCAL_IP6]) {
+		NL_SET_ERR_MSG_ATTR(extack, data[IFLA_AMT_LOCAL_IP6],
+				    "Local IPv4 and IPv6 are mutually exclusive");
+		return -EINVAL;
+	}
+
+	if (data[IFLA_AMT_LOCAL_IP6] && !IS_ENABLED(CONFIG_IPV6)) {
+		NL_SET_ERR_MSG_ATTR(extack, data[IFLA_AMT_LOCAL_IP6],
+				    "IPv6 support is disabled");
+		return -EAFNOSUPPORT;
+	}
+
+	if (nla_get_u32(data[IFLA_AMT_MODE]) != AMT_MODE_GATEWAY) {
+		struct nlattr *disc = data[IFLA_AMT_DISCOVERY_IP6];
+
+		/* An IPv4 relay has always ignored IFLA_AMT_DISCOVERY_IP,
+		 * and existing users may pass it. An IPv6 relay has no such
+		 * users, so it rejects a discovery address of either family.
+		 */
+		if (!disc && data[IFLA_AMT_LOCAL_IP6])
+			disc = data[IFLA_AMT_DISCOVERY_IP];
+		if (disc) {
+			NL_SET_ERR_MSG_ATTR(extack, disc,
+					    "Discovery is only valid in gateway mode");
+			return -EINVAL;
+		}
+		return 0;
+	}
+
+	/* A relay never reads IFLA_AMT_DISCOVERY_IP, but a gateway would
+	 * take the first four bytes of an IPv6 literal as its relay.
+	 */
+	if (amt_ip6_in_ip4_attr(data[IFLA_AMT_DISCOVERY_IP], extack))
+		return -EINVAL;
+
+	/* A gateway's discovery address is in the family of its local
+	 * address, since both ends of the tunnel use one outer transport.
+	 */
+	if (data[IFLA_AMT_LOCAL_IP6] ? !data[IFLA_AMT_DISCOVERY_IP6] :
+				       !data[IFLA_AMT_DISCOVERY_IP]) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Discovery attribute of the local family is required");
+		return -EINVAL;
+	}
+
+	if (data[IFLA_AMT_DISCOVERY_IP] && data[IFLA_AMT_DISCOVERY_IP6]) {
+		NL_SET_ERR_MSG_ATTR(extack, data[IFLA_AMT_DISCOVERY_IP6],
+				    "Discovery IPv4 and IPv6 are mutually exclusive");
 		return -EINVAL;
 	}
 
@@ -3609,13 +3674,22 @@ static int amt_newlink(struct net_device *dev,
 		goto err;
 	}
 
-	amt->local_ip = nla_get_in_addr(data[IFLA_AMT_LOCAL_IP]);
-	if (ipv4_is_loopback(amt->local_ip) ||
-	    ipv4_is_zeronet(amt->local_ip) ||
-	    ipv4_is_multicast(amt->local_ip)) {
-		NL_SET_ERR_MSG_ATTR(extack, tb[IFLA_AMT_LOCAL_IP],
-				    "Invalid Local address");
-		goto err;
+	if (data[IFLA_AMT_LOCAL_IP6]) {
+		amt->local_ipv6 = nla_get_in6_addr(data[IFLA_AMT_LOCAL_IP6]);
+		if (amt_ip6_unusable(&amt->local_ipv6)) {
+			NL_SET_ERR_MSG_ATTR(extack, data[IFLA_AMT_LOCAL_IP6],
+					    "Invalid Local IPv6 address");
+			goto err;
+		}
+	} else {
+		amt->local_ip = nla_get_in_addr(data[IFLA_AMT_LOCAL_IP]);
+		if (ipv4_is_loopback(amt->local_ip) ||
+		    ipv4_is_zeronet(amt->local_ip) ||
+		    ipv4_is_multicast(amt->local_ip)) {
+			NL_SET_ERR_MSG_ATTR(extack, tb[IFLA_AMT_LOCAL_IP],
+					    "Invalid Local address");
+			goto err;
+		}
 	}
 
 	amt->relay_port = nla_get_be16_default(data[IFLA_AMT_RELAY_PORT],
@@ -3633,24 +3707,32 @@ static int amt_newlink(struct net_device *dev,
 		amt->qrv = READ_ONCE(amt->net->ipv4.sysctl_igmp_qrv);
 		amt->qri = 10;
 	} else {
-		if (!data[IFLA_AMT_DISCOVERY_IP]) {
-			NL_SET_ERR_MSG_ATTR(extack, tb[IFLA_AMT_DISCOVERY_IP],
-					    "discovery must be set in gateway mode");
-			goto err;
-		}
 		if (!amt->gw_port) {
 			NL_SET_ERR_MSG_ATTR(extack, tb[IFLA_AMT_DISCOVERY_IP],
 					    "gateway port must not be 0");
 			goto err;
 		}
-		WRITE_ONCE(amt->remote_ip, 0);
-		amt->discovery_ip = nla_get_in_addr(data[IFLA_AMT_DISCOVERY_IP]);
-		if (ipv4_is_loopback(amt->discovery_ip) ||
-		    ipv4_is_zeronet(amt->discovery_ip) ||
-		    ipv4_is_multicast(amt->discovery_ip)) {
-			NL_SET_ERR_MSG_ATTR(extack, tb[IFLA_AMT_DISCOVERY_IP],
-					    "discovery must be unicast");
-			goto err;
+		if (data[IFLA_AMT_DISCOVERY_IP6]) {
+			struct nlattr *attr = data[IFLA_AMT_DISCOVERY_IP6];
+
+			amt->discovery_ipv6 = nla_get_in6_addr(attr);
+			if (amt_ip6_unusable(&amt->discovery_ipv6)) {
+				NL_SET_ERR_MSG_ATTR(extack, attr,
+						    "discovery must be unicast");
+				goto err;
+			}
+		} else {
+			WRITE_ONCE(amt->remote_ip, 0);
+			amt->discovery_ip =
+				nla_get_in_addr(data[IFLA_AMT_DISCOVERY_IP]);
+			if (ipv4_is_loopback(amt->discovery_ip) ||
+			    ipv4_is_zeronet(amt->discovery_ip) ||
+			    ipv4_is_multicast(amt->discovery_ip)) {
+				NL_SET_ERR_MSG_ATTR(extack,
+						    tb[IFLA_AMT_DISCOVERY_IP],
+						    "discovery must be unicast");
+				goto err;
+			}
 		}
 	}
 	dev->needed_headroom = amt->stream_dev->needed_headroom + amt_hlen(amt);
@@ -3702,7 +3784,27 @@ static size_t amt_get_size(const struct net_device *dev)
 	       nla_total_size(sizeof(__u32)) + /* IFLA_MAX_TUNNELS */
 	       nla_total_size(sizeof(__be32)) + /* IFLA_AMT_DISCOVERY_IP */
 	       nla_total_size(sizeof(__be32)) + /* IFLA_AMT_REMOTE_IP */
-	       nla_total_size(sizeof(__be32)); /* IFLA_AMT_LOCAL_IP */
+	       nla_total_size(sizeof(__be32)) + /* IFLA_AMT_LOCAL_IP */
+	       /* IFLA_AMT_{LOCAL,DISCOVERY,REMOTE}_IP6. Only one address of
+		* each IPv4/IPv6 pair is emitted, but this sizes for both.
+		*/
+	       3 * nla_total_size(sizeof(struct in6_addr));
+}
+
+/* The IPv6 addresses of an IPv6 device, one of each IPv4/IPv6 pair. */
+static int amt_fill_addr6(struct sk_buff *skb, const struct amt_dev *amt)
+{
+	const struct in6_addr remote = amt_get_remote_ipv6(amt);
+
+	if (nla_put_in6_addr(skb, IFLA_AMT_LOCAL_IP6, &amt->local_ipv6))
+		return -EMSGSIZE;
+	if (amt->mode == AMT_MODE_GATEWAY &&
+	    nla_put_in6_addr(skb, IFLA_AMT_DISCOVERY_IP6, &amt->discovery_ipv6))
+		return -EMSGSIZE;
+	if (!ipv6_addr_any(&remote) &&
+	    nla_put_in6_addr(skb, IFLA_AMT_REMOTE_IP6, &remote))
+		return -EMSGSIZE;
+	return 0;
 }
 
 static int amt_fill_info(struct sk_buff *skb, const struct net_device *dev)
@@ -3719,15 +3821,21 @@ static int amt_fill_info(struct sk_buff *skb, const struct net_device *dev)
 		goto nla_put_failure;
 	if (nla_put_u32(skb, IFLA_AMT_LINK, amt->stream_dev->ifindex))
 		goto nla_put_failure;
-	if (nla_put_in_addr(skb, IFLA_AMT_LOCAL_IP, amt->local_ip))
-		goto nla_put_failure;
-	if (nla_put_in_addr(skb, IFLA_AMT_DISCOVERY_IP, amt->discovery_ip))
-		goto nla_put_failure;
-
-	remote_ip = READ_ONCE(amt->remote_ip);
-	if (remote_ip)
-		if (nla_put_in_addr(skb, IFLA_AMT_REMOTE_IP, remote_ip))
+	if (amt_v6(amt)) {
+		if (amt_fill_addr6(skb, amt))
+			goto nla_put_failure;
+	} else {
+		if (nla_put_in_addr(skb, IFLA_AMT_LOCAL_IP, amt->local_ip))
 			goto nla_put_failure;
+		if (nla_put_in_addr(skb, IFLA_AMT_DISCOVERY_IP,
+				    amt->discovery_ip))
+			goto nla_put_failure;
+
+		remote_ip = READ_ONCE(amt->remote_ip);
+		if (remote_ip)
+			if (nla_put_in_addr(skb, IFLA_AMT_REMOTE_IP, remote_ip))
+				goto nla_put_failure;
+	}
 	if (nla_put_u32(skb, IFLA_AMT_MAX_TUNNELS, amt->max_tunnels))
 		goto nla_put_failure;
 
diff --git a/include/uapi/linux/amt.h b/include/uapi/linux/amt.h
index 2dccff4..5290ece 100644
--- a/include/uapi/linux/amt.h
+++ b/include/uapi/linux/amt.h
@@ -54,6 +54,19 @@ enum {
 	IFLA_AMT_DISCOVERY_IP,
 	/* This attribute specify number of maximum tunnel. */
 	IFLA_AMT_MAX_TUNNELS,
+	/* This attribute specifies the local IPv6 address. It selects IPv6
+	 * as the outer transport and excludes IFLA_AMT_LOCAL_IP.
+	 */
+	IFLA_AMT_LOCAL_IP6,
+	/* This attribute specifies the IPv6 address of the relay a gateway
+	 * sends its Discovery to. It is the IPv6 form of
+	 * IFLA_AMT_DISCOVERY_IP and needs IFLA_AMT_LOCAL_IP6.
+	 */
+	IFLA_AMT_DISCOVERY_IP6,
+	/* This attribute reports the IPv6 relay address a gateway learned
+	 * from the Relay Advertisement. It is read-only.
+	 */
+	IFLA_AMT_REMOTE_IP6,
 	__IFLA_AMT_MAX,
 };
 
-- 
2.43.0


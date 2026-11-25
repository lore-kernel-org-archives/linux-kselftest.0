Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634107;
	b=LNV6yqAX5aIxjKmuNAfk8P+SDjaMJN2/fgzIdegAaenmXiQva6jYxwxYzf6bkQs4GYve
	 QSvJMhrqoHzT2skSNaLkxy5mI/9tSLZf+DGhBG96PmPpZObWqf+6JXRET2U41PcocDboq
	 zOSCAz9toJAL2BbO0S5JMd+9+8Rivjrj4jR3BVQTithrS533QAaToER7qMfOMn67rWM1X
	 OdiU96/7UPb72k3VyngkBIRf83Pn4Mt6pn0qE3MpFTbI7SPfJznl3mwIcIiaU+318E8gk
	 vT75845CaUPsJrUnV3fDRl/3MdB3V0mv2gPKzNZ70hvA28wtpudBmdeCQsv1w93zN1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AMGxHFsQJVvX/NMNk+MLnJW0NVmoy2FA4HBSJ+pJ628=;
	b=5pcHm55S7u0YawPcqxq6JcA9m5gafw2hAa2ojl1O4bc/BReiopoXnHr7UPsrS+3tnnQC
	 b42fh032Ujn1JvT9VegOxRfcxjJE6VORFG4gEqrpME2HKYUHTzE0lhl2oc/vZuDRkjEDA
	 HUpdAgpPpro1muK++oRpYGWVpA4EQhI9mzbnmoZbvsbWoqrBHXjLOCRCgerxDWo2/b8CG
	 Ul5ZzbtBkPu2AJp+GfraqRfJp9RMYOH/IoqbufQmX2EIoeVKu83Af4L9vwlX6AsSphZw3
	 t+jWkKYQtE1ED0NcHFGadSwAtjXhEr6QSTnWrbAAfrP51jiexaEuUZaOVKEvC/LrLUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=HAQXRuu+;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A9B606A6BF
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 19:15:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69A9B606A6BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=HAQXRuu+
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f04b676219so34771375ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 11:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795634106; x=1796238906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AMGxHFsQJVvX/NMNk+MLnJW0NVmoy2FA4HBSJ+pJ628=;
        b=HAQXRuu++mD42Tic2DoQtEUj1XpzN/RMly7UOwdbenCqs0hx/kKQvQFV9y8NsKUWXM
         njGmJzFwpbg5AtIr7YdmpwsP51f/0OVVfiWmvZm4PBo4A8rZzbHnb411AFVQZMTS9W4H
         ea42XrjFDrbjE5ydCw4uX4oRnv9traXTOEtux6o73MlD+bFxdeCi2mzXquikTR9Ij0Hc
         FqHh8ps1xM5P9TMmC473J4ia/J3+/qNMJMvRgqrBJePlwUAKetcfn4CpiWt8gr2YlDJb
         /0BrEvHr/SGTjyxlv/HsNhh8q6feJu1oVVkIgdgELJBQuT2ct3xoJZBVqAqu9u+GMc75
         Pzgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634106; x=1796238906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AMGxHFsQJVvX/NMNk+MLnJW0NVmoy2FA4HBSJ+pJ628=;
        b=GQYdYVugSlBocuk4ym6qDv95NQzMgW8xY+jUTSOXAuiBng4lULXNE3fI1cRJk5nYXD
         10prlZhedoe+Pnj5U1oZsxk9g8IEZckQeyqwSpg5hOxzK9bM4Kkk/TKHL+ku0KQ6qInP
         JDLl2fr9t6olEKwz8OjScbhtJczPN0tG6YrBDG+KwNZSpLosejNGa2Gcy40VvTL9a4II
         kU7QkaeCaJIXPz2fzWWP0Com24HPNz/sAPQlFLp7NqPjCmiSC0c1QnOe0yOK7RzzIuh1
         z32VSWHTtkagbmUxXHrPJ2H/p3tsn09R898dcRARwRVnuG4U8VbS6eBqjbMWKLUTd2+j
         DFmA==
X-Forwarded-Encrypted: i=1; AL+hErEkpWKb2mbffN4X72eoRMscmVZOe7lhD9mQwPHpQjso00EXagspzayLHl7hn9iWLgeW3ZJKCTsbWzr65m2uHj0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ymavn/IqylBz+7uvYxUYggNHw/zHM7+RF8s2+EgZPVskeswHS
	2+mF9hxtJ7893fb/Wc85G40omVdKLMAUEv5yteK13SXf7D1U7aGplsIbnMze5dZz5ys=
X-Gm-Gg: AZFdTZeA0wFtkTWbanJMc36hrq+9gxybjM/razsJp/19VwqJhMBhaGMDCFpJEDdbpPI
	OtGXVkuHyEr/zikMURQl9zve4Le0wwOhUn3aIeYxk7+2HN248LC6d9vj2+pTsK3d/osgeeCDUaW
	1/AP1uNNZl+Z7M3EZ/WfrFhUS5Nl5aacQ8DTJtCIS9r01BJOkOHNj74uNDH6Wc5nIxzMloDQgrS
	9Zikp8KXIwqBTzqpquF3aRLytjJZ7FvJ82psklmW/bT2ISpDOtZxtc3QD0gFee2xKaQOrRLw0w9
	eKrwXsUehCZ0MFxBx4JTRYsmOVQIWgnZ/V8B1Uj1HbfUTfy/xlS7mFUU2WsKzTN4jzSNN5IDFdR
	JEiqcqsLZPY58ky8UJcKgGmnJMqthBnVNXXw/NE8kT+S1bP6j+Jr9iPveeQCpxZdRgFDt/GTX65
	IiF4IviPu+MSeQPZRuSc7x/UXmX/53yv2kZlUiBZrfSLXVBh9dwuzt/cuNkZgKsK+mrCH8H6pR2
	SSA0azcclppC/bBSHO+NSbkeyErWMPmi/psjYoC/Hn9y8TcJA1UK6U96sHsP4beov2OnQgVohYq
	Z1+GXtmH0gIWKaduczDD4qrg7AJ9KphNNnpdoxyOZj8CI8ldJGKfnLqL8eYuk+O0btGjR6NpIay
	YEfkwwePg+yvog3LbRFUXvFLww4CzaSb4pTnv9ZTQN7dVn+fE73s=
X-Received: by 2002:a17:902:ce0d:b0:2e9:3dd2:a8fe with SMTP id d9443c01a7336-2f03f1537bamr175249385ad.21.1795634105527;
        Wed, 25 Nov 2026 11:15:05 -0800 (PST)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b66sm92413855ad.51.2026.11.25.11.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:15:04 -0800 (PST)
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
Subject: [PATCH net-next v2 09/12] amt: add netlink attributes for an IPv6 outer transport
Date: Wed, 25 Nov 2026 19:14:47 +0000
Message-ID: <20261125191450.2497936-10-omar@blockcast.net>
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
   reported, and the policy rejects it on input.

amt_fill_info() reports the addresses in the device's outer family.
IFLA_AMT_LOCAL_IP6 is refused with -EAFNOSUPPORT on a kernel built
without IPv6, rather than creating an IPv4 device with no local
address. An IPv6 local or discovery address is refused when it is
unspecified, loopback or multicast, as the IPv4 ones are, and also when
it is IPv4-mapped: the V6ONLY socket could never send from or to such
an address, so the device would be created but silently fail every
send.

The existing IFLA_AMT_LOCAL_IP and IFLA_AMT_DISCOVERY_IP cannot simply
carry 16 bytes. Net requires exactly four bytes for them ("amt: require
an exact IPv4-sized IFLA_AMT_{LOCAL,DISCOVERY}_IP"), so the IPv6
addresses need attributes of their own. A kernel that does not know the
new attributes ignores them and fails the request for lack of a local
address, so userspace can tell whether IPv6 is supported. vxlan
(IFLA_VXLAN_LOCAL6, IFLA_VXLAN_GROUP6) and geneve (IFLA_GENEVE_REMOTE6)
add their IPv6 addresses the same way. The attributes are appended to
the enum, so the existing values do not change, and strict_start_type
makes the policy validate them, and any attribute added after them,
strictly. Their policy is an exact 16-byte length.

A relay has always ignored IFLA_AMT_DISCOVERY_IP, and existing users may
pass it, so an IPv4 relay still accepts it. An IPv6 relay has no
existing users, so it rejects a discovery address of either family, and
an IPv4 relay rejects IFLA_AMT_DISCOVERY_IP6.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c        | 164 ++++++++++++++++++++++++++++++---------
 include/uapi/linux/amt.h |  13 ++++
 2 files changed, 141 insertions(+), 36 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 7dd1d544f..bd833a05a 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -3916,6 +3916,7 @@ static void amt_link_setup(struct net_device *dev)
 }
 
 static const struct nla_policy amt_policy[IFLA_AMT_MAX + 1] = {
+	[IFLA_AMT_UNSPEC]	= { .strict_start_type = IFLA_AMT_LOCAL_IP6 },
 	[IFLA_AMT_MODE]		= { .type = NLA_U32 },
 	[IFLA_AMT_RELAY_PORT]	= { .type = NLA_U16 },
 	[IFLA_AMT_GATEWAY_PORT]	= { .type = NLA_U16 },
@@ -3924,6 +3925,10 @@ static const struct nla_policy amt_policy[IFLA_AMT_MAX + 1] = {
 	[IFLA_AMT_REMOTE_IP]	= { .len = sizeof_field(struct iphdr, daddr) },
 	[IFLA_AMT_DISCOVERY_IP]	= NLA_POLICY_EXACT_LEN(sizeof(__be32)),
 	[IFLA_AMT_MAX_TUNNELS]	= { .type = NLA_U32 },
+	[IFLA_AMT_LOCAL_IP6]	= NLA_POLICY_EXACT_LEN(sizeof(struct in6_addr)),
+	[IFLA_AMT_DISCOVERY_IP6] =
+		NLA_POLICY_EXACT_LEN(sizeof(struct in6_addr)),
+	[IFLA_AMT_REMOTE_IP6]	= { .type = NLA_REJECT },
 };
 
 static int amt_validate(struct nlattr *tb[], struct nlattr *data[],
@@ -3950,16 +3955,53 @@ static int amt_validate(struct nlattr *tb[], struct nlattr *data[],
 		return -EINVAL;
 	}
 
-	if (!data[IFLA_AMT_LOCAL_IP]) {
-		NL_SET_ERR_MSG_ATTR(extack, data[IFLA_AMT_DISCOVERY_IP],
-				    "Local attribute is required");
+	if (!data[IFLA_AMT_LOCAL_IP] && !data[IFLA_AMT_LOCAL_IP6]) {
+		NL_SET_ERR_MSG_MOD(extack, "Local attribute is required");
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
 
@@ -4010,13 +4052,25 @@ static int amt_newlink(struct net_device *dev,
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
+		if (ipv6_addr_loopback(&amt->local_ipv6) ||
+		    ipv6_addr_any(&amt->local_ipv6) ||
+		    ipv6_addr_is_multicast(&amt->local_ipv6) ||
+		    ipv6_addr_v4mapped(&amt->local_ipv6)) {
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
@@ -4039,24 +4093,35 @@ static int amt_newlink(struct net_device *dev,
 		dev->max_mtu = dev->mtu;
 		dev->min_mtu = ETH_MIN_MTU + amt_hlen(amt);
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
+			if (ipv6_addr_loopback(&amt->discovery_ipv6) ||
+			    ipv6_addr_any(&amt->discovery_ipv6) ||
+			    ipv6_addr_is_multicast(&amt->discovery_ipv6) ||
+			    ipv6_addr_v4mapped(&amt->discovery_ipv6)) {
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
 
 		dev->needed_headroom = amt->stream_dev->needed_headroom +
@@ -4110,7 +4175,28 @@ static size_t amt_get_size(const struct net_device *dev)
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
+	struct in6_addr remote6;
+
+	if (nla_put_in6_addr(skb, IFLA_AMT_LOCAL_IP6, &amt->local_ipv6))
+		return -EMSGSIZE;
+	if (amt->mode == AMT_MODE_GATEWAY &&
+	    nla_put_in6_addr(skb, IFLA_AMT_DISCOVERY_IP6, &amt->discovery_ipv6))
+		return -EMSGSIZE;
+	amt_get_remote_ipv6(amt, &remote6);
+	if (!ipv6_addr_any(&remote6) &&
+	    nla_put_in6_addr(skb, IFLA_AMT_REMOTE_IP6, &remote6))
+		return -EMSGSIZE;
+	return 0;
 }
 
 static int amt_fill_info(struct sk_buff *skb, const struct net_device *dev)
@@ -4127,15 +4213,21 @@ static int amt_fill_info(struct sk_buff *skb, const struct net_device *dev)
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
 			goto nla_put_failure;
+	} else {
+		if (nla_put_in_addr(skb, IFLA_AMT_LOCAL_IP, amt->local_ip))
+			goto nla_put_failure;
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
index 2dccff417..5290ece75 100644
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
2.47.3


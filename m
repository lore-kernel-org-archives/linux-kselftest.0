Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634101;
	b=T1K1UQq2pkGVoVxsh9DR56QQCY4mH/e5GQ4WzaqPyWssqJNGk6HEHhVN7kIvUky9ahVG
	 6AtErrL6FErBS9GGQl6wt6EJxrQg9rtjk3XLy2Qxs+bDiSTSekMd28e2l3ckgGa3Yqr7k
	 /6BVZsgvnQlD+IY1LeWcf+C1yzrlCPqGIDXXaNc78f4C81o0RaMrU6qMJr+xc+HaNuaa4
	 J6rEEX+moqFDmaITdXxN9dxZabERKP/j2QxdY1WrU8p9tBO9cQTXzQtXPw2FdVLDT+nIP
	 Tr2BDD4RC35lFHYusHSFUfSNBP3sOLL1Q+UG5crxYgqjp4qxsEsBAyNXVKTLbRracbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RQ0qOYB/39Na/Yq4hwyOeXHfqpAHtgIw+NnAsae8SXo=;
	b=tSg8EbBsjEYxck+m+CT+P2/Bc6d15pO2YjzhHBIK8XTUat0PX+IWnXiWZYFAi2JLzmcB
	 TKQuEU0cKYRiVUjEZJZIsDF13R1XxBnoYK3K+A5Aan60/kdhJ5VGRg1OVgz9clEFihw8z
	 AwT5Ir4SZ90aar94uaZJ37p92eHP11SPMFGom+GaTeDqO5UbVaITu1TdXxm4X1WWQ7Std
	 7qSxPf8bodL4bMoK1QJXoeCp5GanlMoQNwUkPhRdBIcAOaTjGlFxYMZSkMrltVj6GxZ0X
	 862NK7TrT3O5PZWQL5f7JwvWpB2oVVMnClBJMQKyJmL7WsHTbF2vnYIwkWCiZDTp0CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=DfL9MmBx;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731D360A260C
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 19:15:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 731D360A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=DfL9MmBx
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2f0464dd6b6so38309335ad.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 11:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795634101; x=1796238901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RQ0qOYB/39Na/Yq4hwyOeXHfqpAHtgIw+NnAsae8SXo=;
        b=DfL9MmBxHLNIrneAJzkABBCadW5CUPH10Suv9KIUmuiMYUg/Tj0PJ2cJ9lWOFluUa3
         7LHMbLAU4eDtrxzz5vbMCpBZXANW/VsrJjg58laKT+wtfGcAzpfz0zsWXFp7sQpoo9NV
         vgKla2lZCtSeabMIDIILOgQFK/hebgkx2JdL9uPbpLhPeNXdzx4Vph+DxnkR+54jmLZb
         BHBaepE6QH+z1L3qAWpTZLIHQHLLBSoNkf4Q12yi4kcjTadL2T7N3GNgZV6hIoBAcenc
         Vn66n1oaz3HczDeE9ImE8IC8HHOQ82j1TqIjOmO1qW1r5BJHcaX+b0yTiLpF9TnlHtNR
         VB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634101; x=1796238901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RQ0qOYB/39Na/Yq4hwyOeXHfqpAHtgIw+NnAsae8SXo=;
        b=UTOuoo9G/lManbWu7n5+6o6Llh6B1RBtJO8IN/i3BDCxX8inlZdJt4vceVhWjTjdKf
         lv2g6BwjSz9sQ1FArlcVGhJ4ML5J7kYj1xKt1rDdVXMsHHiD2//LZE1s8Gr3gQlchnt2
         5M7MvHhGXTlh00YN5Z9jHgGHDTqt/ZXcO2qT/oQXj/TnWjvHOg/N4XpZKID6oENjlxKQ
         LmvWGT1GcXMxyVxwFK3OmZgwq8Hqv0zIX9Ev2XbDMSZDzuRNwvjHvHkMti0O0HqmrEvz
         R6Fcm91HhtFOLed2dH9p4pBuK3UE7ypL+G2L3e/BoWqE5rYBfrctufCR25tnBfd2NyZw
         D7NA==
X-Forwarded-Encrypted: i=1; AL+hErHemGSLnRXY+351ESOPKy/ivG22GXpMpx/iLsEGyBA7d4aY72Bdl9N09ImNa2j6sz69x5cz0+L13UZ4EZVpBKg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8o6XlqU5oxwXT4oaYsLrXygMGaWnm7D0hdX3sUX7k4/Vs5pHNE
	/7jP4q/7QdnRSGSC89n7jo+KhXznCtYdfNimP96jPyE+A83R5892LUhu5L0QahIV35s=
X-Gm-Gg: AZFdTZfJfF/vnS/bB5xShUuM2Lcbk5DEc2KR/K91mHXRAbMDjnTdYK75gQCRHU3zxyQ
	Kq7NMLix6oU4gW6fx2zFPzVuMJNiRiT9v3ePWLzPZAVa0PzFXdIIYzafejCYhyPyPmcFzKPEFRG
	idGcpTh49Rlf5jffGWZLhe/0Y/A3KSafcy6oNkKVqME+SUEGuR4n8S+CCixa7G6t0WJ72WSdRJa
	zw+3kBnwqwknVAvncr2TN7dbQELI2POpTHw8APwSU58iV8ssMSyUpSW1NF6tZc3uWYQW7oqWukb
	1yIjZp32mvkZVo1EZgRMiYAfrWrbo6I2YnUkTPTWaWIwy/kY0PzV/ijrPWQubs+kOt4v6h5jBIw
	9G9JE7lqVPbFCyeSGlFattamZPExBNoB4H9oVTLfmfLZesDoYw1vQuWYupgNba9Cn7eR7zlCeKM
	+qT1KSpumOwam+f3HAi3/cUIaRRSkE0GoRX4OnvpzX93P2FK+sQ1J9Bqiv4kHsg82QLbWSZvRwg
	Dm9unvqX8F98xbHZQOr2B21pr3be4rEXkI7AXXTaHzVgpAzLvS/56J6VqNiPMKhXMzbq0S3rUYC
	s2LbL3aaTSeZuM/lqnyWhmwE3QdFp3JnxyCiXKoN+w3H91Ppf1Cfl5ZP69iFmLhWhiVl0FS1bXn
	tA7yWXLZizElYIrIHhrgtfusvEI14kNbrg21DLPtAva1iV7NH4As=
X-Received: by 2002:a17:902:ec8b:b0:2e8:6ae2:75db with SMTP id d9443c01a7336-2f03f18a9c9mr172756885ad.41.1795634100805;
        Wed, 25 Nov 2026 11:15:00 -0800 (PST)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b66sm92413855ad.51.2026.11.25.11.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:15:00 -0800 (PST)
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
Subject: [PATCH net-next v2 06/12] amt: size the encapsulation headroom by the outer IP version
Date: Wed, 25 Nov 2026 19:14:44 +0000
Message-ID: <20261125191450.2497936-7-omar@blockcast.net>
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

The amt device reserves AMT_RELAY_HLEN or AMT_GW_HLEN of headroom and
subtracts the same amount from the stream device's MTU. Both assume a
20-byte IPv4 outer header. An IPv6 outer header is 40 bytes, so on an
IPv6 device an inner packet in the last 20 bytes below the MTU would
not fit the stream device once encapsulated, and ip6_fragment() drops
it: nothing sets ignore_df on the tunnel skb.

Add AMT_RELAY_HLEN6 and AMT_GW_HLEN6, pick between the IPv4 and IPv6
sizes in amt_hlen(), and use amt_hlen() wherever the device sizes its
headroom and MTU: at newlink and on NETDEV_CHANGEMTU of the stream
device.

amt_v6() is still false for every device, so there is no functional
change.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 26 +++++++++++++++-----------
 include/net/amt.h |  7 +++++++
 2 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 823367e82..cb2ce552b 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -104,6 +104,14 @@ static unsigned int amt_ip_hlen(const struct amt_dev *amt)
 	return amt_v6(amt) ? sizeof(struct ipv6hdr) : sizeof(struct iphdr);
 }
 
+/* Headroom the device reserves for its outer encapsulation. */
+static unsigned int amt_hlen(const struct amt_dev *amt)
+{
+	if (amt->mode == AMT_MODE_RELAY)
+		return amt_v6(amt) ? AMT_RELAY_HLEN6 : AMT_RELAY_HLEN;
+	return amt_v6(amt) ? AMT_GW_HLEN6 : AMT_GW_HLEN;
+}
+
 /* Snapshot the outer source address of a received AMT message. */
 static void amt_outer_saddr(const struct amt_dev *amt,
 			    const struct sk_buff *skb, union amt_addr *addr)
@@ -3903,10 +3911,10 @@ static int amt_newlink(struct net_device *dev,
 		amt->qrv = READ_ONCE(amt->net->ipv4.sysctl_igmp_qrv);
 		amt->qri = 10;
 		dev->needed_headroom = amt->stream_dev->needed_headroom +
-				       AMT_RELAY_HLEN;
-		dev->mtu = amt->stream_dev->mtu - AMT_RELAY_HLEN;
+				       amt_hlen(amt);
+		dev->mtu = amt->stream_dev->mtu - amt_hlen(amt);
 		dev->max_mtu = dev->mtu;
-		dev->min_mtu = ETH_MIN_MTU + AMT_RELAY_HLEN;
+		dev->min_mtu = ETH_MIN_MTU + amt_hlen(amt);
 	} else {
 		if (!data[IFLA_AMT_DISCOVERY_IP]) {
 			NL_SET_ERR_MSG_ATTR(extack, tb[IFLA_AMT_DISCOVERY_IP],
@@ -3929,10 +3937,10 @@ static int amt_newlink(struct net_device *dev,
 		}
 
 		dev->needed_headroom = amt->stream_dev->needed_headroom +
-				       AMT_GW_HLEN;
-		dev->mtu = amt->stream_dev->mtu - AMT_GW_HLEN;
+				       amt_hlen(amt);
+		dev->mtu = amt->stream_dev->mtu - amt_hlen(amt);
 		dev->max_mtu = dev->mtu;
-		dev->min_mtu = ETH_MIN_MTU + AMT_GW_HLEN;
+		dev->min_mtu = ETH_MIN_MTU + amt_hlen(amt);
 	}
 	amt->qi = AMT_INIT_QUERY_INTERVAL;
 
@@ -4053,11 +4061,7 @@ static int amt_device_event(struct notifier_block *unused,
 			amt_dellink(amt->dev, &list);
 			break;
 		case NETDEV_CHANGEMTU:
-			if (amt->mode == AMT_MODE_RELAY)
-				new_mtu = dev->mtu - AMT_RELAY_HLEN;
-			else
-				new_mtu = dev->mtu - AMT_GW_HLEN;
-
+			new_mtu = dev->mtu - amt_hlen(amt);
 			dev_set_mtu(amt->dev, new_mtu);
 			break;
 		}
diff --git a/include/net/amt.h b/include/net/amt.h
index 245947113..eabe6fa7a 100644
--- a/include/net/amt.h
+++ b/include/net/amt.h
@@ -434,9 +434,16 @@ struct amt_dev {
 #define AMT_GW_HLEN (sizeof(struct iphdr) + \
 		     sizeof(struct udphdr) + \
 		     sizeof(struct amt_gw_headers))
+/* IPv6-outer gateway headroom: the outer header is a struct ipv6hdr. */
+#define AMT_GW_HLEN6 (sizeof(struct ipv6hdr) + \
+		      sizeof(struct udphdr) + \
+		      sizeof(struct amt_gw_headers))
 #define AMT_RELAY_HLEN (sizeof(struct iphdr) + \
 		     sizeof(struct udphdr) + \
 		     sizeof(struct amt_relay_headers))
+#define AMT_RELAY_HLEN6 (sizeof(struct ipv6hdr) + \
+			 sizeof(struct udphdr) + \
+			 sizeof(struct amt_relay_headers))
 
 static inline bool netif_is_amt(const struct net_device *dev)
 {
-- 
2.47.3


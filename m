Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792708253;
	b=g4XWuKiYfD9TqBGY2T7oonGDof79Cn6ws2alEMGCKXPv2fZUiHqtZaKvd3xqms16hYDR
	 zkU96RuxqHX3hnF+w4HOUTI+HmaNhQx0061ipks2CeFojx2mPVyDSMuQZJnTRkS1g6js3
	 ZN1fp/m0Q1UC+Em9nKbApETQ8FGFYyVJs49coTp+NKH17F11eA51fvd2fXALVSpUvxOGr
	 8UfH5lcIFq2qCPWm325kBxgkxkQQz1G7zgJtHL+uTlPLBV/f2kC4Xn6gMdPYW8sG1n5UT
	 tc2fEAVU+vctzBUHE1/aZE+4XZjUkCuOU2Q76FE/4aIV9yZRljAdbHVEptaL75oSksw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792708253;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version;
	bh=D+ewVKYcqDAnjJEl4Vgm0+/bjP0vS5Npg2tFFrEWIaU=;
	b=N4be1whkhCulUVmRFZKS+dOSDYPwWSyg+lHNF00H7ycNPHnlIHi4t/bCPfnbR34dWh2n
	 mndiCZqUKyS3u7G2KStQOvLhtOqQYX49v5YJEk1B7OU7GSGsyy4NA3U5zMJxQsoxTDzvt
	 +RzrjsrljQz4KX4zWj7DykhH3wkuPyYhZiTDeSeW8vdf4SUHCv1j+mUNiINUWpnpzEAqJ
	 drXJPp1eu3cHapbdCV6a19p17XAAFYiZAgWxwY1/GINNX3V3oiLIOrgxWG9Wcf+aRjEYN
	 MT+FMokTgYE6LznbH5ZHzSKAjvg+f9Jysu26aznnT3Cjw5g/CIYuK233OqEVdjG71Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=GNr1t1qF;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA33606A31A;
	Thu, 22 Oct 2026 22:30:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FA33606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=GNr1t1qF
Received: from pps.filterd (m0528008.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MMUg5q1715836;
	Thu, 22 Oct 2026 15:30:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=D+ewVKYcqDAnjJEl4Vgm0+/bjP0vS5Npg2tFF
	rEWIaU=; b=GNr1t1qFtaQRDKNl61LM7xZCIUKHznLUo/xLlBUXbiFMySeKlhnDU
	9fCkEk0wWAlMgI8wPDh+CcbCLQLgZU8B0an9s/b2iLU2OU9r9vJ9cWOoJEZ/eT09
	RcEPb1dR4NOYBmI31UU4m3MA5p6bmorcRC+2csvLhk5R4PgUBiuhdE99xUyAy2Xm
	laBfCjy+T0iYA6SB6/dGQRy+UCUQjYcGWCbTXDZusLgJqgl/ZMMfdzsa/5+A04Ff
	ebIQEfjI8qfQ2iNg4NhC3w0gLlPDJYtdJYCnAXuYcclt/xyD9ayhUcDh1T9rPfkX
	cwLcHE+LzPOltINExybZ4+tZ9fr9S4uAg==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hfjf6m6bs-10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 22 Oct 2026 15:30:44 -0700 (PDT)
Received: from localhost (2620:10d:c0a8:1b::30) by mail.thefacebook.com
 (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Thu, 22 Oct
 2026 22:30:38 +0000
From: Todd Freed <toddfreed@meta.com>
To: <netdev@vger.kernel.org>, <toddfreed@meta.com>
CC: Daniel Zahka <daniel.zahka@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>, Andrew Lunn
	<andrew+netdev@lunn.ch>,
        Shuah Khan <shuah@kernel.org>, Raed Salem
	<raeds@nvidia.com>,
        Rahul Rameshbabu <rrameshbabu@nvidia.com>,
        Cosmin Ratiu
	<cratiu@nvidia.com>, <linux-kernel@vger.kernel.org>,
        <linux-kselftest@vger.kernel.org>,
        =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?=
	<bjorn@kernel.org>
Subject: [PATCH net v2 1/2] psp: fix transport mode encap with ipv6 extension headers
Date: Thu, 22 Oct 2026 15:30:13 -0700
Message-ID: <20261022223014.556388-2-toddfreed@meta.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261022223014.556388-1-toddfreed@meta.com>
References: <20261022223014.556388-1-toddfreed@meta.com>
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
Content-Type: text/plain
X-Proofpoint-GUID: 9HTuWbfirsd6CTvC4P_j7Rklf87wg4EU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA4OSBTYWx0ZWRfX2FdqNRCltEbw
 khnSsuOjnyGidTvCGHHlUAsVgWOrigzaVqLhFV1SuQPdSMyJV+n/vAozguC9DVbFW/RoJ4yqCzU
 ArZPq9o1Ewo8vubYQyjvZT6BERqruFk=
X-Proofpoint-ORIG-GUID: 9HTuWbfirsd6CTvC4P_j7Rklf87wg4EU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA4OSBTYWx0ZWRfX0A9QzwFYF/mN
 bykMcChXbW3EWnaDXuwHHxnZE/z3ikHptsm3S1RUwxnJqCYgu6pUVOQRDoKimDTjCITku9UMrO8
 Is3JuFjW7fpiAiMX0nkjuMzIdkfLgIxMGf9oTL35r+NK/Kmq4mw1L+zXIb51PBcpLexPm2ED7vE
 2Pg1435bCpko/mR7FRygaa/JnUKYPT4vU8NZXbYVd8V86507C3s4Qz53LO83QnmuG1DUQnON/Jk
 ZXsBAlYb0/RihOTvYITblVe3mVHeoH5tCdwAE4am7hQoIH/557jsHPUkYTRpsnmujIAjKrkfxXy
 JbpVTAT89TE8XRA2AdLIhHB2gb73cKFmiQLaVLBKIiFT+LpZjAnvdarvj4MPTqkbiPRrnMTnfwA
 BaU0l27kTEfJIi8RH8IsNY1dMm3NXvC0mP13qndacqaITB1EIJHvctlbSYGyN/Uhf+mbCCtJ3WG
 AMjH27psurukAFGDIUQ==
X-Authority-Analysis: v=2.4 cv=HOVWhYtv c=1 sm=1 tr=0 ts=6ada8e94 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=_1IyUuN4QrATX339ibzo:22 a=pGLkceISAAAA:8 a=VabnemYjAAAA:8
 a=VzoU7SqrFeryVSFTUeIA:9 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_07,2026-10-21_02,2025-10-01_01

psp_dev_encapsulate() inserts the udp and psp headers and rewrites the
l3 next header to udp.

if the packet is an ipv6 packet with extension headers, the transport
header comes after them, so rewriting the next header of the ipv6 fixed
header produces a malformed packet.

a psp tcp socket emits such packets if certain socket options are set on
it (e.g. IPV6_DSTOPTS). with mlx5, these packets also go out
unencrypted.

fix by walking the extension header chain to rewrite the nexthdr on the
last one in the chain instead. the walk looks at the extension header
types only to find their lengths, and to reject these,

- NEXTHDR_FRAGMENT. this could work, but udp+psp would need to come
  before it, which is different than how the other option types are
  handled. for now, keep fragments unsupported for transport mode.

- NEXTHDR_ROUTING. the tcp checksum covers the final destination, but
  drivers seed tso checksums from the daddr in the fixed hdr
  (mlx5e_psp_handle_tx_skb()), so this would produce bad checksums.
  could be supported with more work.

- NEXTHDR_NONE, and types which ipv6_ext_hdr() doesn't know.

on rx, the inverse process is performed in psp_dev_rcv(). transport mode
psp fragments are rejected on this path as before.

note that the stack doesn't fragment ipv6 tcp packets, so a psp socket
won't be able to exercise the tx fragment path.

Suggested-by: Daniel Zahka <daniel.zahka@gmail.com>
Fixes: fc724515741a ("psp: provide encapsulation helper for drivers")
Fixes: 0eddb8023cee ("psp: provide decapsulation and receive helper for drivers")
Signed-off-by: Todd Freed <toddfreed@meta.com>
---
 net/psp/psp_main.c | 78 +++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 70 insertions(+), 8 deletions(-)

diff --git a/net/psp/psp_main.c b/net/psp/psp_main.c
index c9c1a8826b7f..0c009d7b08c0 100644
--- a/net/psp/psp_main.c
+++ b/net/psp/psp_main.c
@@ -4,6 +4,7 @@
 #include <linux/list.h>
 #include <linux/netdevice.h>
 #include <linux/xarray.h>
+#include <net/ipv6.h>
 #include <net/net_namespace.h>
 #include <net/psp.h>
 #include <net/udp.h>
@@ -185,6 +186,42 @@ unsigned int psp_key_size(u32 version)
 }
 EXPORT_SYMBOL(psp_key_size);
 
+/**
+ * psp_ipv6_nexthdr_off() - find the offset to the l4 proto nexthdr
+ * @hdr:  ipv6 fixed header
+ * @len:  l3 header total length
+ *
+ * Return: offset from @hdr, or -1 to drop the packet
+ */
+static int psp_ipv6_nexthdr_off(const u8 *hdr, unsigned int len)
+{
+	unsigned int nh = offsetof(struct ipv6hdr, nexthdr);
+	unsigned int off = sizeof(struct ipv6hdr);
+	const struct ipv6_opt_hdr *eh;
+	unsigned int rem;
+	u8 type;
+
+	while (off < len) {
+		eh = (const void *)(hdr + off);
+		type = hdr[nh];
+
+		if (!ipv6_ext_hdr(type) || type == NEXTHDR_NONE ||
+		    type == NEXTHDR_FRAGMENT || type == NEXTHDR_ROUTING)
+			return -1;
+		rem = len - off;
+		if (rem < sizeof(*eh))
+			return -1;
+
+		nh = off + offsetof(struct ipv6_opt_hdr, nexthdr);
+		if (type == NEXTHDR_AUTH)
+			off += ipv6_authlen(eh);
+		else
+			off += ipv6_optlen(eh);
+	}
+
+	return off == len ? nh : -1;
+}
+
 static void psp_write_headers(struct net *net, struct sk_buff *skb, __be32 spi,
 			      u8 ver, unsigned int udp_len, __be16 sport)
 {
@@ -243,7 +280,7 @@ static void psp_write_headers(struct net *net, struct sk_buff *skb, __be32 spi,
 }
 
 /* Encapsulate a TCP packet with PSP by adding the UDP+PSP headers and filling
- * them in.
+ * them in. With IPv6, they go after any extension headers.
  */
 bool psp_dev_encapsulate(struct net *net, struct sk_buff *skb, __be32 spi,
 			 u8 ver, __be16 sport)
@@ -251,10 +288,17 @@ bool psp_dev_encapsulate(struct net *net, struct sk_buff *skb, __be32 spi,
 	u32 network_len = skb_network_header_len(skb);
 	u32 ethr_len = skb_mac_header_len(skb);
 	u32 bufflen = ethr_len + network_len;
-
-	if (skb->protocol != htons(ETH_P_IP) &&
-	    skb->protocol != htons(ETH_P_IPV6))
+	int nh_off = 0;
+
+	if (skb->protocol == htons(ETH_P_IPV6)) {
+		/* UDP + PSP after the extension headers, if any */
+		nh_off = psp_ipv6_nexthdr_off(skb_network_header(skb),
+					      network_len);
+		if (nh_off < 0)
+			return false;
+	} else if (skb->protocol != htons(ETH_P_IP)) {
 		return false;
+	}
 
 	if (skb_cow_head(skb, PSP_ENCAP_HLEN))
 		return false;
@@ -272,7 +316,7 @@ bool psp_dev_encapsulate(struct net *net, struct sk_buff *skb, __be32 spi,
 		ip_hdr(skb)->check =
 			ip_fast_csum((u8 *)ip_hdr(skb), ip_hdr(skb)->ihl);
 	} else {
-		ipv6_hdr(skb)->nexthdr = IPPROTO_UDP;
+		skb_network_header(skb)[nh_off] = IPPROTO_UDP;
 		be16_add_cpu(&ipv6_hdr(skb)->payload_len, PSP_ENCAP_HLEN);
 	}
 
@@ -331,8 +375,23 @@ int psp_dev_rcv(struct sk_buff *skb, u16 dev_id, u8 generation, bool strip_icv)
 			return -EINVAL;
 	} else {
 		struct ipv6hdr *ipv6h = (struct ipv6hdr *)(skb->data + l2_hlen);
+		u8 nexthdr = ipv6h->nexthdr;
+		__be16 frag_off;
+		int off;
 
-		is_udp = ipv6h->nexthdr == IPPROTO_UDP;
+		/* UDP + PSP come after any extension headers. Fragment and
+		 * routing headers are not supported in transport mode.
+		 */
+		off = ipv6_skip_exthdr(skb, l2_hlen + sizeof(*ipv6h), &nexthdr,
+				       &frag_off);
+		if (unlikely(off < 0 || frag_off))
+			return -EINVAL;
+
+		is_udp = nexthdr == IPPROTO_UDP;
+		l3_hlen = off - l2_hlen;
+		if (l3_hlen != sizeof(struct ipv6hdr) &&
+		    !pskb_may_pull(skb, l2_hlen + l3_hlen + PSP_ENCAP_HLEN))
+			return -EINVAL;
 	}
 
 	if (unlikely(!is_udp))
@@ -386,11 +445,14 @@ int psp_dev_rcv(struct sk_buff *skb, u16 dev_id, u8 generation, bool strip_icv)
 		iph->check = ip_fast_csum((u8 *)iph, iph->ihl);
 	} else {
 		struct ipv6hdr *ipv6h = (struct ipv6hdr *)(skb->data + l2_hlen);
+		int nh_off = psp_ipv6_nexthdr_off((u8 *)ipv6h, l3_hlen);
 
-		if (unlikely(ntohs(ipv6h->payload_len) < encap))
+		if (unlikely(nh_off < 0 ||
+			     ntohs(ipv6h->payload_len) <
+			     l3_hlen - sizeof(*ipv6h) + encap))
 			return -EINVAL;
 
-		ipv6h->nexthdr = psph->nexthdr;
+		((u8 *)ipv6h)[nh_off] = psph->nexthdr;
 		ipv6h->payload_len = htons(ntohs(ipv6h->payload_len) - encap);
 	}
 
-- 
2.53.0-Meta


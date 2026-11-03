Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664749;
	b=oEEP6sYuhIFy3pa0xaQeRvk9CAxSN+/UBrPVxyuCWb06Zw5rdAkgWNH8mDmQ5VAC0lkw
	 127mj0bsYUKKqs07PQGFLLQ4f0ky3PcdrMrzi1zazWxe/uMK95zJUNH5mTc8ThMbHrZzC
	 1jOGTtHWcQOmIN/+t7AkeqXM8wNP/CbG3YCPc/BPx4y0RCs5LvfEMsf2bInaWy4qYuO3U
	 2oerI+GLhImqm2+IbwhKUJw/KPeFN1gzWoIWD9KJQNAwp1KCLlBFhvz5pCX/C/ryzrQZa
	 KsxQupmdPbMA1jaY8T2je8u5y3tcw9oBj05G2ISmdacZukQ/RNFuaIw4D+f5MgRw3YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664749;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=Ajr8MtZr/s7zY2op24HaaZTlKrJAnkeMPao/wkbA4kE=;
	b=0RBtamRDT0GKk8/uVOpuSSQzRl1i8GrsZ06AbCOwfLod7br6t4YTplG1dEsBAWuA1XA+
	 BisgGszoQo0vOMoFwUeXWevGEcb7jrYwFb1kjApyl0dLcDa2QbFZ5bCnAt5EP5XRDK/w6
	 PQ7ONXrQKjTq1gZrzXJwtMS9fFIBdW3DcUfn3Ko73ELcdm2DhWmujguQabSdnHxs8BE97
	 1X2v4mcCMUVMC9K1Ac5QpoLR/LkgQyRIXNaicgjqrPo0s/Mk9k7slVWPGzKObflCy9/wD
	 sxz5YSuYGHHp8/Xz1LerbJdM5MvUwm00gzhu2pPzagxgimzdjF/0FVlmDKpz/lZx4PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=Sc8DE8Di;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0512606A327;
	Tue,  3 Nov 2026 00:12:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0512606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=Sc8DE8Di
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K6JS72959384;
	Mon, 2 Nov 2026 16:12:26 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=Ajr8MtZr/s7zY2op24HaaZTlKrJAnkeMPao/w
	kbA4kE=; b=Sc8DE8DiHt+tUHcu2nLJ8rAIF+6nXTC3c8cZwPVUew26O7P9PMAGf
	WLOL3kQFkdnap6wzRB7SSN7K32UfmsVO+2lV8A4fJGMb9LUMSyzYBP+4ycYzZAt5
	5rxE6nsAPMiC7aXyvOBTISAbWvUuwggsHZHiWFiz/cO4QdgRGmgiV2YHUaxN75qz
	QCKpX6rXZSwq3B9QsoenMgiUYW2G8obzSw+G04D4/EzmTTabTZzBseta8XX8+w3L
	Z0qwC8n0b/kG6977vfUSRr+KG4KSlUjMiPxRoP/5RlO2halySUNfZVyct0joY4Ai
	AxcO7QAXa4b9JxpJ+Cp5Jg+u2lBNPoIpg==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hnbn1ydkj-18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 02 Nov 2026 16:12:26 -0800 (PST)
Received: from localhost (2620:10d:c085:108::4) by mail.thefacebook.com
 (2620:10d:c08b:78::c78f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Tue, 3 Nov
 2026 00:12:13 +0000
From: Todd Freed <toddfreed@meta.com>
To: <netdev@vger.kernel.org>, <toddfreed@meta.com>
CC: <linux-kselftest@vger.kernel.org>, Sashiko <sashiko-bot@kernel.org>,
        "Jakub Kicinski" <kuba@kernel.org>,
        =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?=
	<bjorn@kernel.org>
Subject: [PATCH net v4 4/7] ipv6: icmpv6: don't quote decrypted payload in icmpv6 errors
Date: Mon, 2 Nov 2026 16:11:40 -0800
Message-ID: <20261103001143.246081-5-toddfreed@meta.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103001143.246081-1-toddfreed@meta.com>
References: <20261103001143.246081-1-toddfreed@meta.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: nEfRLXr77fFYE9vJUCblQr3SmWl6yYZR
X-Proofpoint-ORIG-GUID: nEfRLXr77fFYE9vJUCblQr3SmWl6yYZR
X-Authority-Analysis: v=2.4 cv=TplzFzXh c=1 sm=1 tr=0 ts=6ae926ea cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7x6HtfJdh03M6CCDgxCd:22 a=8elwO82fXORLTBIkMd32:22 a=9R54UkLUAAAA:8
 a=VabnemYjAAAA:8 a=VwQbUJbxAAAA:8 a=-z2kMTAr2hpZfj2momEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=YTcpBFlVQWkNscrzJ_Dz:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAwMCBTYWx0ZWRfX1c0DK2O+1NM6
 uBF0aeTrgocxNJbSPCGdYkBAbK/J2ZDZx4/E/FzKpQfzq4xItwvSFiAb9Sp9t1phKwbuBXyEptK
 0/a1dmeKwzDra2EnZPigB/oQCrJYsMU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAwMCBTYWx0ZWRfXyDlBjJFoFF4A
 iosjfQLq1ci9vaQwMcRF6zilQxZc+J0HhOgx9DbrrLhXcSVUqjxA9zLX7X3d7utfxf9uFMRpvLj
 5xVwWs7TsTuhrHAsOSlHMkF+ffI6VAY0Ht3JHIs8t0O2ggDQXfkYnYu1EpVGVhq8aFre+JP6iUP
 xFoc4H625jcZeN0+fbpFkP+t4XphgY/BHXOqrVIvjk79auAmM9BCUtXOHtIefDRIhf+zWisTwq3
 4m9JM51oufHzlKZ9i4A2wqZb7do5E9vZs7oZj2jFTYQlxng/nHREZ7f9u5qHogm7HTBczQ5T5dj
 Zm9cR/8vh1hfOjPKVbDuhfjx8wPhJoNVximuB6NmABGVEYYVIXtMPK2v82ChzFyWnIkWh9yQQ6A
 VHX4+YKrmHd1SHyAxFp0nLZP3V+CqdkEwiJiMrYheRLUAB1N+cwNeAq3Uaft5TdYwj2q6bF8cTJ
 0G1cfQPIdnGCBPIXw9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01

an icmpv6 error quotes as much of the invoking packet as fits in the
minimum ipv6 mtu. if the device had decrypted the packet
(as indicated by skb->decrypted), then the icmpv6 error is sending part
of it back out onto the network in cleartext.

the two offloads encrypt different parts of the packet:

- ktls rx device offload decrypts the tls records in the tcp payload.
  the ipv6 header, the extension headers and the tcp header were in the
  clear on the wire, so quote those, tcp options included, and leave out
  the rfc 4884 extension, which would carry the payload too. also clear
  the rfc 4884 length, which a caller relaying an error with extensions
  (e.g. a tunnel) may have set.

- psp encryption also covers the L4 header. the quote could include just
  the ipv6 header and extension headers, but that's not really useful.
  linux receivers want to look at the l4 layer on the quoted packet, so
  such a truncated icmpv6 error packet is just dropped (icmpv6_notify()).
  don't send the error at all for psp.

a decrypted psp skb has SKB_EXT_PSP, which is used to distinguish the
two cases. note though that if an inner tunnel is decapsulated,
skb_scrub_packet() drops the extension but keeps skb->decrypted, so an
error about the inner packet takes the ktls path in this case (quote
includes the l4 header), which is less than before.

on tx, skb->decrypted is also set. an error about a locally originated
skb (skb_iif is 0) is sent in full as before, if it would go to a local
address, as determined by the packet's source address.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261023234640.1459291-1-toddfreed%40meta.com
Suggested-by: Jakub Kicinski <kuba@kernel.org>
Suggested-by: Björn Töpel <bjorn@kernel.org>
Fixes: 784abe24c903 ("net: Add decrypted field to skb")
Signed-off-by: Todd Freed <toddfreed@meta.com>
---
 net/ipv6/icmp.c | 61 +++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 57 insertions(+), 4 deletions(-)

diff --git a/net/ipv6/icmp.c b/net/ipv6/icmp.c
index a95b0351824f..4a064e3089cd 100644
--- a/net/ipv6/icmp.c
+++ b/net/ipv6/icmp.c
@@ -55,6 +55,7 @@
 #include <net/ip6_checksum.h>
 #include <net/ping.h>
 #include <net/protocol.h>
+#include <net/psp/functions.h>
 #include <net/raw.h>
 #include <net/rawv6.h>
 #include <net/seg6.h>
@@ -644,7 +645,8 @@ void icmp6_send(struct sk_buff *skb, u8 type, u8 code, __u32 info,
 	struct ipv6_pinfo *np;
 	const struct in6_addr *saddr = NULL;
 	bool apply_ratelimit = false;
-	struct sk_buff *ext_skb;
+	struct sk_buff *ext_skb = NULL;
+	bool decrypted = false;
 	struct dst_entry *dst;
 	unsigned int room;
 	struct icmp6hdr tmp_hdr;
@@ -773,6 +775,23 @@ void icmp6_send(struct sk_buff *skb, u8 type, u8 code, __u32 info,
 
 	np = inet6_sk(sk);
 
+	/* Don't send the decrypted part of a received skb onto the network */
+	if (unlikely(skb_is_decrypted(skb)) && skb->skb_iif) {
+		/* PSP encrypts the transport header too, so it should not be
+		 * quoted. But an error whose quote is truncated to fewer than
+		 * 8 bytes of the transport header won't be processed on the
+		 * receive side, so just skip it.
+		 */
+		if (psp_skb_is_decrypted(skb))
+			goto out_unlock;
+		/* TLS offload leaves the tcp header in the clear and so can be
+		 * quoted up to its end. A psp skb whose inner tunnel was
+		 * decapsulated also ends up here, since skb_scrub_packet()
+		 * drops SKB_EXT_PSP.
+		 */
+		decrypted = true;
+	}
+
 	if (!icmpv6_xrlim_allow(sk, type, &fl6, apply_ratelimit))
 		goto out_unlock;
 
@@ -794,6 +813,15 @@ void icmp6_send(struct sk_buff *skb, u8 type, u8 code, __u32 info,
 	if (IS_ERR(dst))
 		goto out_unlock;
 
+	/* A locally originated skb to be encrypted. Permit the packet to be
+	 * quoted if the packets source address is local.
+	 */
+	if (unlikely(skb_is_decrypted(skb)) && !skb->skb_iif &&
+	    !(dst_rt6_info(dst)->rt6i_flags & RTF_LOCAL)) {
+		dst_release(dst);
+		goto out_unlock;
+	}
+
 	ipc6.hlimit = ip6_sk_dst_hoplimit(np, &fl6, dst);
 
 	msg.skb = skb;
@@ -801,9 +829,34 @@ void icmp6_send(struct sk_buff *skb, u8 type, u8 code, __u32 info,
 	msg.type = type;
 
 	room = IPV6_MIN_MTU - sizeof(struct ipv6hdr) - sizeof(struct icmp6hdr);
-	ext_skb = icmp6_ext_append(net, skb, &tmp_hdr, room, parm->iif);
-	if (ext_skb)
-		msg.skb = ext_skb;
+	if (unlikely(decrypted)) {
+		u8 nexthdr = hdr->nexthdr;
+		const struct tcphdr *th;
+		struct tcphdr _th;
+		__be16 frag_off;
+		int hlen, tlen = 8;
+
+		/* Quote the IPv6 header, its extension headers, and the L4
+		 * header. The RFC 4884 extension would carry the payload too.
+		 */
+		hlen = ipv6_skip_exthdr(skb, msg.offset + sizeof(*hdr),
+					&nexthdr, &frag_off);
+		if (hlen < 0) {
+			hlen = msg.offset + sizeof(*hdr);
+		} else if (nexthdr == IPPROTO_TCP) {
+			th = skb_header_pointer(skb, hlen, sizeof(_th), &_th);
+			if (th)
+				tlen = max_t(int, th->doff * 4, 8);
+		}
+		room = min_t(unsigned int, room, hlen - msg.offset + tlen);
+		if (type == ICMPV6_DEST_UNREACH || type == ICMPV6_TIME_EXCEED)
+			tmp_hdr.icmp6_datagram_len = 0;
+	} else {
+		ext_skb = icmp6_ext_append(net, skb, &tmp_hdr, room,
+					   parm->iif);
+		if (ext_skb)
+			msg.skb = ext_skb;
+	}
 
 	len = msg.skb->len - msg.offset;
 	len = min_t(unsigned int, len, room);
-- 
2.53.0-Meta


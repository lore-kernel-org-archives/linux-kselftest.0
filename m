Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.153.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664733;
	b=oP/Hqhtl5lBMeZZcnqtPMWl9aIXTpLHpFvHEoLYyw8pSv45jvBf05GoOomrjhfqRqZIR
	 19jAXVt73CVPXyqImynbFA9zMonZeoGvyv9OX8SzSFtHZ+BASLrzQpLdgn89h/tLALcim
	 TZsf+s0C3Rg3SCZwq4i/hgFhbdPWuCCK9OzsSJyD5VHbZVz5vjAV2Hhkkco9Ey2dm2/jU
	 HAa4TXCL166I9G4BrxGZMAGfwmfogCA3XoGd8/ZADNmdg9+jKlzZU1eWh6mw3vA59VxgE
	 GW41LmIElbtrm0ZUJPQEq/urdaq7JKevrNZkyFOmRympxn0e7PHJdr2w8OnotJR2C5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664733;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version;
	bh=PQKPlxJF/F8lJXwtq1+kcOM/VMpu859BrVkvVZALXRY=;
	b=sxhVUcm434kFG7M9WzwbRtXJJ5+pJCDjKGYRQz90riihv50Tf8gMNUXvgCQt/DE3rHcz
	 SsHRTYpByeOwlxamP+Gtcb3qQ4a2eD2JyFROUK0vXqT8tIhcAzNAtMbb++GgJvUe1+Xa3
	 RTJfFmPwpOgaKfpgdEsqy4IfISPm1TSkzE42+uT9Y6LT2VA526EhuQkDkibscP5IzDmm5
	 dYaog1Hd6MYMl8fpdQAPF6o0BXcYS9AZGmQq7zKbhb4FYYAxish+XeSbj03ZAoTBQ1puK
	 dr6HiflGshDKMP/5E4BerZ9D6pylb7bDHwWiy1KmluiFNx2y45L/ZqekbPxVUdK8NPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=KaeN2MHl;
	arc=none smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2A7606A329;
	Tue,  3 Nov 2026 00:12:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A2A7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=KaeN2MHl
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K6PsM4127813;
	Mon, 2 Nov 2026 16:12:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=PQKPlxJF/F8lJXwtq1+kcOM/VMpu859BrVkvV
	ZALXRY=; b=KaeN2MHlAvOWUeEcTvCUConQ9C6WotkZ60RwiS5KFSuVTU75xgIf5
	4KTQ15q5ncEz4rTyCRmwtCiPMVr34jDqb0biL3xyB5t1+JIdV9noSY0/7A1sl8+r
	XhES6wQ2yos6F0cpsyDHEOSarfnu5Jo6WQ3ju4arHeMARWo6wOw/78hG6tfbtC+d
	BbwMokNlNmLCLEnoVPGXGiaNs9rahMnnNg2Azw0fkEog5lRr86FD1ruq0U3G2C9J
	Dr5lEQ4IouZBLRjU4KS+9TyYBOaaDVE9OfbvX7O3L/zRvk41QdbcZlRB8d+nQX3V
	1N0ECjMoNqfnpT85h++HltkyoPYsUK6rw==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hne2d65xp-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 02 Nov 2026 16:12:09 -0800 (PST)
Received: from localhost (2620:10d:c0a8:1b::30) by mail.thefacebook.com
 (2620:10d:c0a9:6f::8fd4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Tue, 3 Nov
 2026 00:12:08 +0000
From: Todd Freed <toddfreed@meta.com>
To: <netdev@vger.kernel.org>, <toddfreed@meta.com>
CC: <linux-kselftest@vger.kernel.org>, Sashiko <sashiko-bot@kernel.org>,
        "Jakub Kicinski" <kuba@kernel.org>,
        =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?=
	<bjorn@kernel.org>
Subject: [PATCH net v4 3/7] ipv4: icmp: don't quote decrypted payload in icmp errors
Date: Mon, 2 Nov 2026 16:11:39 -0800
Message-ID: <20261103001143.246081-4-toddfreed@meta.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAwMCBTYWx0ZWRfX3q5BK5rvZrR7
 bI4xfQlbuX6wuOA8uN7BrYSWY4Ofu2xbliywmoXWGCzHBw+2peEGzJ7o4fc+kQ2e2mpF8UgoinT
 VvzvfJEE4o4F/HXQCQ09yFqlnW/LbGVG9rwSWAEB4EosVWGY9zFY5Pc85OynzsF3wa4xszexlh5
 mqrOcZlFgwOzqW2rcJrljfeoShE2zxxQgy0u0aKbAXtdwEKc8LW4TFg8vPc7dDKhXtJBEFxKE0w
 Omk+byu93jSqqiLlCSJM6O/YatIi1XnQ872h+Isi+rc/5qVZmK1i3BTRXQv3L3IgY6t7X9MYbEa
 SPmmeJ4u4fKAm2YYzR26cVvDozVsQCtEwxuVXFD+FX+aIx6z+6oEkv9182pVWdZx6LFzwE+kiif
 7Xd74sdpzUhTdklAI4OAmoKGbOZFrglReBvtH60vsx7ju/mPdCMttsuJy/CN6vUFq+I1NypLWGq
 KD0NzfX/7sKiP3aEaSw==
X-Proofpoint-GUID: bl5aJfSKkOCe45CfXYUFrFM6TBXAXa5m
X-Authority-Analysis: v=2.4 cv=QJ791QLL c=1 sm=1 tr=0 ts=6ae926d9 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7x6HtfJdh03M6CCDgxCd:22 a=xtH7KyWI9dI7BmFOsl-x:22 a=9R54UkLUAAAA:8
 a=VabnemYjAAAA:8 a=VwQbUJbxAAAA:8 a=-z2kMTAr2hpZfj2momEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=YTcpBFlVQWkNscrzJ_Dz:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-ORIG-GUID: bl5aJfSKkOCe45CfXYUFrFM6TBXAXa5m
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAwMCBTYWx0ZWRfXx+7i+YR1OXuB
 34QPr9OKDp+8eMFqCsIF1IINCjHaLe0ltvA3twTNu0o6+iHYmC27k5uXTsaEQ0TRXAjkiThXruJ
 8+gJpnd3zNNv4KPtcO51oZrBfPXr0kc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01

an icmp error quotes as much of the invoking packet as fits in 576
bytes. if the device had decrypted the packet (as indicated by
skb->decrypted) then the icmp error is sending part of it back out onto
the network in cleartext.

the two offloads encrypt different parts of the packet:

- ktls rx device offload decrypts the tls records in the tcp payload.
  the tcp header was in the clear on the wire, so quote the ip header
  and the tcp header, options included, and leave out the rfc 4884
  extension, which would carry the payload too.

- psp encryption also covers the tcp header. the quote could include just
  the ip header, but that's not really useful. linux receivers want to
  look at the l4 layer on the quoted packet, so such a truncated icmp
  error packet is just dropped (icmp_socket_deliver()). don't send the
  error at all for psp.

a decrypted psp skb has SKB_EXT_PSP, which is used to distinguish the
two cases. note though that if an inner tunnel is decapsulated,
skb_scrub_packet() drops the extension but keeps skb->decrypted, so an
error about the inner packet takes the ktls path in this case (quote
includes the l4 header), which is less than before.

on tx, skb->decrypted is also set. an error about a locally originated
skb (skb_iif is 0) is sent in full as before, if it goes to a local
address, as determined by the packet's source address.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261023234640.1459291-1-toddfreed%40meta.com
Suggested-by: Jakub Kicinski <kuba@kernel.org>
Suggested-by: Björn Töpel <bjorn@kernel.org>
Fixes: 784abe24c903 ("net: Add decrypted field to skb")
Signed-off-by: Todd Freed <toddfreed@meta.com>
---
 include/net/psp/functions.h | 11 ++++++++
 net/ipv4/icmp.c             | 54 +++++++++++++++++++++++++++++++++----
 2 files changed, 60 insertions(+), 5 deletions(-)

diff --git a/include/net/psp/functions.h b/include/net/psp/functions.h
index c5c23a54774e..b263b573ae4c 100644
--- a/include/net/psp/functions.h
+++ b/include/net/psp/functions.h
@@ -51,6 +51,12 @@ psp_enqueue_set_decrypted(struct sock *sk, struct sk_buff *skb)
 		skb->decrypted = 1;
 }
 
+/* The device decrypted @skb with psp, on receive */
+static inline bool psp_skb_is_decrypted(const struct sk_buff *skb)
+{
+	return skb_ext_find(skb, SKB_EXT_PSP);
+}
+
 static inline unsigned long
 __psp_skb_coalesce_diff(const struct sk_buff *one, const struct sk_buff *two,
 			unsigned long diffs)
@@ -170,6 +176,11 @@ static inline struct psp_assoc *psp_sk_assoc(const struct sock *sk)
 static inline void
 psp_enqueue_set_decrypted(struct sock *sk, struct sk_buff *skb) { }
 
+static inline bool psp_skb_is_decrypted(const struct sk_buff *skb)
+{
+	return false;
+}
+
 static inline unsigned long
 __psp_skb_coalesce_diff(const struct sk_buff *one, const struct sk_buff *two,
 			unsigned long diffs)
diff --git a/net/ipv4/icmp.c b/net/ipv4/icmp.c
index 90c0e22c29be..d522488475b6 100644
--- a/net/ipv4/icmp.c
+++ b/net/ipv4/icmp.c
@@ -78,6 +78,7 @@
 #include <net/ip.h>
 #include <net/route.h>
 #include <net/protocol.h>
+#include <net/psp/functions.h>
 #include <net/icmp.h>
 #include <net/tcp.h>
 #include <net/udp.h>
@@ -823,7 +824,8 @@ void __icmp_send(struct sk_buff *skb_in, int type, int code, __be32 info,
 	int room;
 	struct rtable *rt = skb_rtable(skb_in);
 	bool apply_ratelimit = false;
-	struct sk_buff *ext_skb;
+	struct sk_buff *ext_skb = NULL;
+	bool decrypted = false;
 	struct ipcm_cookie ipc;
 	struct flowi4 fl4;
 	__be32 saddr;
@@ -979,6 +981,32 @@ void __icmp_send(struct sk_buff *skb_in, int type, int code, __be32 info,
 	if (rt->rt_flags & (RTCF_BROADCAST | RTCF_MULTICAST))
 		goto ende;
 
+	/* Don't send the decrypted part of an skb onto the network */
+	if (unlikely(skb_is_decrypted(skb_in))) {
+		if (!skb_in->skb_iif) {
+			/* A locally originated skb to be encrypted. Permit
+			 * the packet to be quoted, if its source address is
+			 * local. otherwise skip.
+			 */
+			if (!(rt->rt_flags & RTCF_LOCAL))
+				goto ende;
+		} else if (psp_skb_is_decrypted(skb_in)) {
+			/* PSP encrypts the transport header too, so it should
+			 * not be quoted. But an error whose quote is truncated
+			 * to fewer than 8 bytes of the transport header won't
+			 * be processed, so just skip it.
+			 */
+			goto ende;
+		} else {
+			/* TLS offload leaves the tcp header in the clear and
+			 * so can be quoted up to its end. A psp skb whose inner
+			 * tunnel was decapsulated also ends up here, since
+			 * skb_scrub_packet() drops SKB_EXT_PSP.
+			 */
+			decrypted = true;
+		}
+	}
+
 	/* peer icmp_ratelimit */
 	if (!icmpv4_xrlim_allow(net, rt, &fl4, type, code, apply_ratelimit))
 		goto ende;
@@ -996,10 +1024,26 @@ void __icmp_send(struct sk_buff *skb_in, int type, int code, __be32 info,
 	if (room <= (int)sizeof(struct iphdr))
 		goto ende;
 
-	ext_skb = icmp_ext_append(net, skb_in, &icmp_param->data.icmph, room,
-				  parm->iif);
-	if (ext_skb)
-		icmp_param->skb = ext_skb;
+	if (unlikely(decrypted)) {
+		/* Quote up to the end of the tcp header. The RFC 4884
+		 * extension would carry the payload too.
+		 */
+		int len = iph->ihl * 4 + 8;
+		const struct tcphdr *th;
+		struct tcphdr _th;
+
+		th = skb_header_pointer(skb_in, skb_network_offset(skb_in) +
+					iph->ihl * 4, sizeof(_th), &_th);
+		if (th && iph->protocol == IPPROTO_TCP)
+			len = iph->ihl * 4 + max_t(int, th->doff * 4, 8);
+		room = min_t(int, room, len);
+	} else {
+		ext_skb = icmp_ext_append(net, skb_in,
+					  &icmp_param->data.icmph, room,
+					  parm->iif);
+		if (ext_skb)
+			icmp_param->skb = ext_skb;
+	}
 
 	icmp_param->data_len = icmp_param->skb->len - icmp_param->offset;
 	if (icmp_param->data_len > room)
-- 
2.53.0-Meta


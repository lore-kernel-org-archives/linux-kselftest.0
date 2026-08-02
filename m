Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C870927280A
	for <linux-kselftest@vger.kernel.org>; Sun,  2 Aug 2026 20:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785702313; cv=none; b=lBN46rbMV2t2FmmFnTxz6siLuk73PXMItVPP6S6gXXkAuu9GZyC4lzuUpl6cO9tXsrWpJUVPaetVejmZyHinC2jNTo7+D7KtVtMk78YY9bhwuXa9R2f3Uyi5a3LIBlw08a9kdyFK+fin0B9vEqfJgwNe0EhoxtHGbhMetUjrn94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785702313; c=relaxed/simple;
	bh=8D/LnP6iwLqOWvltAMKdDDJiZBKI5yS6vx9tWazWWQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g9PzrYZa/95lPxnB1GQY2iyjpJW8mdGWA9Cw+uDgwT/pN8QcxTChBtsCw1cjYi9S83R2Qe07c7CVwy4X/GDckJQ7AVl/7CSazdm2PKyIpZUgzp6hlB+XfwS8AmlaNGmqm31EO8e1RDFBGvaOSLs+EupKkFD3mMm0RVVv8+6N/No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bjUSS3IG; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bjUSS3IG"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4954b3c5cbeso2127635e9.1
        for <linux-kselftest@vger.kernel.org>; Sun, 02 Aug 2026 13:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785702310; x=1786307110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uFZdABfXyxNiQyQgXmRGyPiZSHUapp++D7AxsRp/yCg=;
        b=bjUSS3IGZTlOoRcqrwnhYoA/gvLKMK5c8bDjTWDNCfYDZNgBaZSSO90C5iHqvS3PuD
         R3Gcq9KQNV7r8+nkvVbdmt3tgGFZUZidrpQBuA+4r2FbCtscA0/rSxB49iFBwCUThRr1
         qJxne4RoV60yMxOI8H43NM1EPXMpfRXm+M79iikgRazrYp9Y9c6zLAlSbbnFbP3sUU2o
         NfjvIPWgxH1tjVhXfbM/hA5zRLTHtCEjWZT0PYFV3nxZPOgMevS7zLJee8XalSFTb493
         PtQjrV2e+pbg9jvs1a7f1AZnP4987vfC3u8BBazNR8CbEKG8bEWqRnFT+R7hiX8Jz1fO
         1Xuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785702310; x=1786307110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uFZdABfXyxNiQyQgXmRGyPiZSHUapp++D7AxsRp/yCg=;
        b=hKSDKSHyL3Xe/PoTJpfSYos8R3QETtqrY0rPGEqwOKZQSgNUMxK9zI++hnQj8tlB/9
         Z8054IgwYKfr9gG7kEqrc51YBjYcPECknMP0c24tKNjDkhLuphz+zhjFil9ch+kwx+1C
         wleEp8bgqrQGp7ttr/s01fJcldOhQKkQy9PZBdKAt9p6cIpftjxjDO6yAvl/zB0gA05G
         p8NjYEFdBUyYRdBIsqn08Wfindq443a1I89jXmnbDvfHVND/uUItUra7dhwvroH0zFRB
         v+4kw6Fszdgkw0Ux37CYCANHrdTm7c1AkpfvSk/aFQPjuhBBvteiG0xNXA1TsI4t2hoO
         2uRg==
X-Forwarded-Encrypted: i=1; AHgh+RqizuqZYqos/+tx7cfDC989OXylaBIdEeOVddIxy+Z/Q3oRy4AJLuyZ06MF+G8B7FW8WhtwfZjJks89UPNB+QA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyAccrvstSFrZbYpAsQQuAKxHDw/hOwon62KP1tvWYQ7cja1YS
	qyS7+RqOBEca2LoTx+Rp1DI84bT1uNm0FIdlClhL72aO5Fdn52FGkxTX
X-Gm-Gg: AR+sD11WK84wFwO1IZxcNFUkddlKrVdYfUP9Y1eHw89lCZa1bDjjWQ4ebijQlmd9auk
	mEZTL6u1HKmv5Pn5n26hiPWCxjZ2MkExQyAm/GwSDgNxISlmpOsTg0Qgpcn9SNZzO5yHhX2064R
	WjIpP3t+wCChCTlP7fG6cZ9JUlgJ7DlNaVvvwNVF6SS398yXXanGXfGi523a1/7tfUEVEsq5IJi
	EtGM3UZ3YMtYw8aFqevP36002Ka5TdUzz//6Agui6M5DM74zPoemvu21LHvg37jO7YXei5Ds3fv
	objML+xpXa1s4lO3s+QV3gmPS1J2XcJukePKAK1qGeeb4cqb+DkSm86ngGk5CxV0w/on38OPJ61
	GybyBOQuRkoY5EmHV4YFqJVOrJ/TkEnWi68K1h7upo9LOvrbtT7E6QNa4/66p4Z2wsu1iW1U/CD
	wfUuZyLnYK/SyBJ9L/xwlUK9A/GN4Eb+8mviTM9HARtzDtkefimOG99FoBRFOcfMAC4dFWMh+/+
	3h5lfjP/vzeerZv6HNl/hHLGupznJ83wLsbT+EqF6tyoku2fD8zwMMEIPZSuiNkVuoF73DrvgwS
	5rip0N3HLOrZK546urIw
X-Received: by 2002:a05:600c:3b20:b0:495:3eb4:3c6d with SMTP id 5b1f17b1804b1-4980c69d93cmr75435045e9.2.1785702309906;
        Sun, 02 Aug 2026 13:25:09 -0700 (PDT)
Received: from L-022584.energy.envision.com (dynamic-078-051-143-142.78.51.pool.telefonica.de. [78.51.143.142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b23f6fsm132234365e9.0.2026.08.02.13.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 13:25:09 -0700 (PDT)
From: Xin Xie <xiexinet@gmail.com>
To: davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: edumazet@google.com,
	horms@kernel.org,
	shuah@kernel.org,
	lukma@denx.de,
	m-karicheri2@ti.com,
	fmaurer@redhat.com,
	luka.gejak@linux.dev,
	bigeasy@linutronix.de,
	ali@iusegentoo.com,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Xin Xie <xiexinet@gmail.com>
Subject: [PATCH net v2 2/3] net: hsr: clone before updating path and LAN IDs in tagged frames
Date: Sun,  2 Aug 2026 22:25:03 +0200
Message-ID: <20260802202504.2962-3-xiexinet@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260802202504.2962-1-xiexinet@gmail.com>
References: <20260802202504.2962-1-xiexinet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hsr_create_tagged_frame() and prp_create_tagged_frame() update the
path/LAN ID in the received skb data buffer and then skb_clone() it
for the egress port. When the same frame is forwarded to both slave
ports, the second port ID update lands in the same shared buffer the
first port clone still points at; if that clone is still queued
(qdisc backlog, NETEM, BQL), it is transmitted with the second port
ID - a silent on-wire corruption.

One always-available trigger is the master transmit path: a
pre-tagged frame transmitted on the master (for example injected
locally via AF_PACKET with a valid RCT) passes prp_fill_frame_info()
with frame->skb_prp set, the master-origin gate lets it through to
both slaves, and both slaves run prp_set_lan_id() + skb_clone() on
the same buffer. Tagged frames arriving on an HSR RedBox interlink
take the analogous path through hsr_create_tagged_frame(). Normal
traffic tests do not expose the race: the window between the first
dev_queue_xmit() and the second ID write is only a few instructions
and opens only under egress backpressure. With a 200 ms netem delay
on one slave, all 200 injected frames left that slave carrying the
other slave LAN ID in testing.

Reorder both helpers: clone first, privatize the clone with
skb_cow(), reacquire the header/trailer pointer, then update the ID.
skb_cow() is used rather than skb_cow_head() because privacy is
needed for the whole linear area, not only the header: the HSR tag
sits in the head, but the PRP RCT sits at the linear tail.
skb_get_PRP_rct() computes the trailer from skb_tail_pointer(), so
the returned pointer is always inside the linear area that
pskb_expand_head() copies; frames with a nonlinear tail are
mis-parsed by the existing helper regardless and are out of scope
here. (Both wrappers currently reach pskb_expand_head(); they differ
in the cloned-data predicate, and correctness here needs full data
privacy, not only header privacy.) This adds one linear-head copy
per tagged egress; untagged master traffic keeps the existing
__pskb_copy() path and pays nothing from this patch.

Fixes: 451d8123f897 ("net: prp: add packet handling support")
Reviewed-by: Ali Ahmet Memis <ali@iusegentoo.com>
Tested-by: Ali Ahmet Memis <ali@iusegentoo.com>
Signed-off-by: Xin Xie <xiexinet@gmail.com>
---
 net/hsr/hsr_forward.c | 35 ++++++++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/net/hsr/hsr_forward.c b/net/hsr/hsr_forward.c
index 67aaf5a8622b..974b55f24882 100644
--- a/net/hsr/hsr_forward.c
+++ b/net/hsr/hsr_forward.c
@@ -336,12 +336,24 @@ struct sk_buff *hsr_create_tagged_frame(struct hsr_frame_info *frame,
 	int movelen;
 
 	if (frame->skb_hsr) {
-		struct hsr_ethhdr *hsr_ethhdr =
-			(struct hsr_ethhdr *)skb_mac_header(frame->skb_hsr);
+		struct hsr_ethhdr *hsr_ethhdr;
+
+		/* The original skb data may be shared with another egress
+		 * clone. Make the clone data private before updating the
+		 * path id so the update cannot corrupt the other copy.
+		 */
+		skb = skb_clone(frame->skb_hsr, GFP_ATOMIC);
+		if (!skb)
+			return NULL;
+		if (skb_cow(skb, 0)) {
+			kfree_skb(skb);
+			return NULL;
+		}
 
 		/* set the lane id properly */
+		hsr_ethhdr = (struct hsr_ethhdr *)skb_mac_header(skb);
 		hsr_set_path_id(frame, hsr_ethhdr, port);
-		return skb_clone(frame->skb_hsr, GFP_ATOMIC);
+		return skb;
 	} else if (port->dev->features & NETIF_F_HW_HSR_TAG_INS) {
 		return skb_clone(frame->skb_std, GFP_ATOMIC);
 	}
@@ -377,15 +389,28 @@ struct sk_buff *prp_create_tagged_frame(struct hsr_frame_info *frame,
 	struct sk_buff *skb;
 
 	if (frame->skb_prp) {
-		struct prp_rct *trailer = skb_get_PRP_rct(frame->skb_prp);
+		struct prp_rct *trailer;
 
+		/* Same sharing hazard as above: privatize the clone data
+		 * before updating the LAN id.
+		 */
+		skb = skb_clone(frame->skb_prp, GFP_ATOMIC);
+		if (!skb)
+			return NULL;
+		if (skb_cow(skb, 0)) {
+			kfree_skb(skb);
+			return NULL;
+		}
+
+		trailer = skb_get_PRP_rct(skb);
 		if (trailer) {
 			prp_set_lan_id(trailer, port);
 		} else {
 			WARN_ONCE(!trailer, "errored PRP skb");
+			kfree_skb(skb);
 			return NULL;
 		}
-		return skb_clone(frame->skb_prp, GFP_ATOMIC);
+		return skb;
 	} else if (port->dev->features & NETIF_F_HW_HSR_TAG_INS) {
 		return skb_clone(frame->skb_std, GFP_ATOMIC);
 	}
-- 
2.43.0


Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C740544CAD3
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 14:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785249375; cv=none; b=jnZXfrZyVUgfKFNY4GDZL61VGBVeKxOrB4GGFzXtsouvM83PFAPDX6P8Ia4UX1nSBDt0ns1N0Ap0tP1grs9iVGxTIfgeb9rfAiWonnsiTQIwFcT3ykI/DfsI1dJAVJ+QvgNWEMeP66PbBrpH9bIHfKRQHsL7doSq2qSAopst0So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785249375; c=relaxed/simple;
	bh=/zgZQOPZCtTW3qW7iAPjRY9cXoUBdIpT/63KCVTOCVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XKCp0r5oOcJ8lxypZj3adqyYfroAZMkC4IRN70YBCq1x3kquTN05Oak2zEeeEIWa3EKSQUAlKO6VlBUF0GNb2s64jppj2NWqDM+lyWndcaavA4Ab7MNILvb4Vsy3/9EyvbfEV99ho7qY33vF0NWi4iyGQC8lI+/1OSRM1pMvDug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o8PP+b/1; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o8PP+b/1"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-495773ee3edso4052365e9.3
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 07:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785249369; x=1785854169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wwIhEfi9+6USJOv/w81ZBdN5gBR90fsvVRhVWHIYqds=;
        b=o8PP+b/16WJOZWpsUbUtEVkzZewoW7gQJaxEX+sXOG9XP2grdnEANTKdTwyoVFLrH/
         K50xpS3NGo+2o4kvogvb3m3EmfULi0Yke3VXqWbyF4B4JodoXSz2m3X7ov00up7m1Jb/
         XncQ91XCanE3F9ksjcCEDW/gWWbzen45v40Vg9BsBYzovD58Q0tuy3HqbZBCTIGORyJF
         QEi9kUqmsPlIZ59GtEPvEkG6ALHF339oHD4oQcdDNkdVw11wWfdd2lJdlWpbPa17krQG
         o/1CdxO1SE0rIxpaLDEeipDWcdk/fWASOlkNa4tosCIMykVpvs8OGTy/WCLAg1a62ppR
         ebRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785249369; x=1785854169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wwIhEfi9+6USJOv/w81ZBdN5gBR90fsvVRhVWHIYqds=;
        b=GpuuK2h94wqgvaNNv4JZI9dYUI+siHPqkV7kAVfDBYln6oz3oEdbS1uFGhwukz6WqG
         j9u93RFYaYv+IMit7Q9hd0HCk7Zf5jWgGttOLCnviFo0X0iA24RdkDcAfWW4PClTVWI7
         UCUx0kQQa/aix+8LrlqMlz1CdgAvS1RM3LR/BqOtIBoyWeJG8izhRkMxMSkzgFug+91B
         DwidtsFKPQyQnmdE+keZCUsi5/5c7kS4DNBD5kEIwnYQ/PplbllcJct46eC/qsvF5zyh
         9vP063654fdRr7sZ0w1tWoD9sECspmK1j1TsTQv2wDs+dyqn1uAbxaMoNOweJFQImoQf
         l5Rw==
X-Forwarded-Encrypted: i=1; AHgh+RoNHXhHRixCQq6MYOhTmr3xC/XF+avFJtiFzZVIcVnfpdYQptt7aLjw9t51bctGJUm0/KaFpvmL7pzRt43MSes=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4st5b+05oYD/MwtJIlzmqUrpMQYRQxDnYZSOxolhJpq7gkwtK
	cR5q1kjc+oqYHbkL5KXcUzNAj10rm3ENSMPTy//EKf0mOVL2xIoxKRYh
X-Gm-Gg: AR+sD11eltKtTc5ZiM12yAr+7NaRzPQi8uNxr7PRZrIFIslSf5JBUKGb7/AELU9U59z
	2Xa7Lreh4UGFZwRkFwz5awtq0XL0RksOzcHutnbEI4Yvez82/+EZMnWjvTEpgkXDU4ans+30LpT
	QFRD6pZFsQSP514AO0G4Uq3c19KjiaT4NJPQ8NA+jV9EMO8eAuSGx6c3vBhGBBs62msneU/BJrk
	QRYVB01Or4iiikTw5kHkcRO+akokIhbjKo1JAQe70bLAJwQiSoSu1F2xBr1yhRKYXUNq6y4uzkn
	sNXBNOpkFBtXlVqZpx1WcgOy0rSaQDqLxskkSlCU/MOM/2NmRNiwv6/qkOARxVikpNd+1DhC4q9
	Q0/net3N+/RztL7SreYQtbLiFTaT0xstC3scpLUbjOV/vgtCuC1pbw1f+u2MHCcdmhgsA2v3wfA
	gaFszAkiuQr52TUVleZd9QDyKUY+UOTy26OQslBZkiPh+exxdIdSJwnYPiDlkpRvpCkWJaapf0R
	XiFv5JAS1BJ8CJ6SKNlIcbb20N0zYozxwv4rLU=
X-Received: by 2002:a05:600c:4f8a:b0:495:7287:2937 with SMTP id 5b1f17b1804b1-496c65dc24fmr16790635e9.8.1785249368784;
        Tue, 28 Jul 2026 07:36:08 -0700 (PDT)
Received: from L-022584.energy.envision.com (dynamic-077-179-168-074.77.179.pool.telefonica.de. [77.179.168.74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bfe07e1sm303390105e9.3.2026.07.28.07.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 07:36:08 -0700 (PDT)
From: Xin Xie <xiexinet@gmail.com>
To: davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: edumazet@google.com,
	horms@kernel.org,
	shuah@kernel.org,
	lukma@denx.de,
	m-karicheri2@ti.com,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Xin Xie <xiexinet@gmail.com>
Subject: [PATCH net 2/3] net: hsr: clone before updating path and LAN IDs in tagged frames
Date: Tue, 28 Jul 2026 16:36:03 +0200
Message-ID: <20260728143604.26-3-xiexinet@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260728143604.26-1-xiexinet@gmail.com>
References: <20260728143604.26-1-xiexinet@gmail.com>
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
Signed-off-by: Xin Xie <xiexinet@gmail.com>
---
 net/hsr/hsr_forward.c | 35 ++++++++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/net/hsr/hsr_forward.c b/net/hsr/hsr_forward.c
index 67aaf5a862..974b55f248 100644
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


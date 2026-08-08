Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10082E2665
	for <linux-kselftest@vger.kernel.org>; Sat,  8 Aug 2026 00:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786149936; cv=none; b=qpqGd4pcQ3mWw3PZozp6T9ibYYicEzO3MoccVGo31Iee+n2xZKyGYwR7WS8FqB9K0WjAR12uQ876Dd80gYO3kAz7xUNHGKng8fRTHfjEeY5NswkNnKsXzQM4E/zLs52z4SLDmjDjT7nuxEufR3XbEmHBvnbd4AV+ykBpPT4bH2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786149936; c=relaxed/simple;
	bh=Uwm+K+Lk8nz3zL/SAii0uwJVPMJgn91bGOgd1YQbF+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dmmnuj6wm/DMEmzuvOVBQ+k7BCsbrIGN8WXyMmt441PqOkXbZHvmAf9+Es7cu85KuXtNYz5MHYqtAli+8ZmGA/ye43UN4uYuA3nm+24alBq5lpHG4v9XspNDBp5tPsen4kdq7qJwBNqUGfbVK4wP38Y5jrS0EPraQxgKLEW+g8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nx/b9GcF; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nx/b9GcF"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4957952e0f8so134665e9.2
        for <linux-kselftest@vger.kernel.org>; Fri, 07 Aug 2026 17:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786149933; x=1786754733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RVghACQXUkT2qkU6qm43KF+VExlIt2SQUQBo9jts5Ww=;
        b=Nx/b9GcF/QaUO5lHne3rjM9vHhwj3P3p8ZW4UYQu16J1ByxGjv+7EY76biBQN41ocO
         Ub8F6JtIWW1ZoZPvN7dGqDjFLCXR1a1jVzhIET3PuDICbp8KCTx+JDJSo0q7Sft2RVGN
         0RCcF+w2q/x0BJnluwu9lLPWQ4RharsxKDLXkt5LWdxfX02IHs0HWCmZs9mwKyYIj3X/
         8HluW95kzZOqV4yNabjZFWdqlVilgsDzcjKMBdhhUiQ2wx3dF5XnKqAilIASXYVSV+WG
         EVCeYqXPktnGGleMl7heUXrLvm6CJNryKgWcWMgvVAlAyBBpuFJbm+gTaoTEjXeN8UDO
         Oqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786149933; x=1786754733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RVghACQXUkT2qkU6qm43KF+VExlIt2SQUQBo9jts5Ww=;
        b=CLCsHJmHKPfltlzva5uLxrjuexhW204pkLS0Lyu+cSFopJXxkrgoyq9NWYYrZQNT0Z
         M/azf9PEuLuUtLSnHXPuCRx6d1O4Tei3YqMDzs29MAEm7gDg3nUUPAu8Obu4vZpmbpWC
         JjsH2z7CegUwktVCsxZCfXXxDI3UO4QaLIKvQWD6gR93zgei0cGw9jkC5LMdegB/Iuea
         u0oP9bGo7Ds1As+A19onyy6ken1lH+zk6mEvNSMvP2HiYzOsKWK5k0gkPKV6isKqNuqS
         MseaCVZDa4oaG9k5Ne3GSmHR7Wi6NCxpkExUApXlFvS0ak2F1jlHoLUlblX3hCGe4izK
         i6kQ==
X-Forwarded-Encrypted: i=1; AHgh+RqkBrL0z5UiExLjjUnPAQ9580q3PVa4YHXGfbsFDa8ILctp3YNTh7D1IHQyWaACZWRBJ0O2UXJDmkJlZNm1m5c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yztl5W94q9O3Se1+/YK2McbT1kz9OncH9cvGWehwipkKxp7eIyh
	hf0PL/vUGNVV0cI6OZxMG1vd2FpoFqmQO144EBWeowEycO5vvxq425qD
X-Gm-Gg: AR+sD10Agsrlevd2Fi0apJDSZvgd4bryjZheIy2tc5oqH5+4Tdu0UcJXl8pizD2WAxr
	Q8kZB550glednhUNTmbJ0jAc0yKWsWNptJJi8GwSEHySSv1uS/hvb3atVpU4KeWztJnxf5ooFrh
	o3yMvCzZ8Htl7vcJorywh845R89zqSC0ByfutA4SCDnOYEqsN7pdSnD8Cp4gYtO/lbzg6wq0ZzP
	phIa6/XSTf0M3koqeMiHyGGUPiMq4+F6HHgsEFDUl5uAbID83LCVMxaCQfvJBDyuRUBJ7/ejxMo
	il6gdjMhk+jgeq1qnAXRQ7tEwgKhrEnrCIxaTjaccHuzXbCP1sGKt6+hNWQ4JyfrugwZmVTGh7P
	VpsXFC7ekN2ZEjkTK9qOr1mtAQg3bIY0OKKLiTjUAvg4xPqdvm/CybNfCeXTkWcBNN15iLt4mFP
	tuSrulx9oklG3SBwBBZ/6tSHuuc19ifndQjCr+XbZqeZgL6AgFcy0HijgHgDKlK6/i6U9jbObDI
	jOyAWE2re9sDctOZIlHQUJeQkEnrmAaMVwDmbNOdTF8aip4pJf0mpPVfpLFH9XIKrlYr8R69Jzf
	gnGb7p8HkNjzoO0BgOtYyLM=
X-Received: by 2002:a05:600c:1550:b0:493:ad11:6d5c with SMTP id 5b1f17b1804b1-4994e7cf0dcmr177290555e9.4.1786149932744;
        Fri, 07 Aug 2026 17:45:32 -0700 (PDT)
Received: from L-022584.energy.envision.com (dynamic-077-179-201-133.77.179.pool.telefonica.de. [77.179.201.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4800220aa83sm8848170f8f.36.2026.08.07.17.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 17:45:31 -0700 (PDT)
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
	qingfang.deng@linux.dev,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Xin Xie <xiexinet@gmail.com>
Subject: [PATCH net v3 2/3] net: hsr: return private clones from the tagged-frame helpers
Date: Sat,  8 Aug 2026 02:45:23 +0200
Message-ID: <20260808004525.1551-3-xiexinet@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260808004525.1551-1-xiexinet@gmail.com>
References: <20260808004525.1551-1-xiexinet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tagged-frame helpers can return skbs whose data is still shared.
Later path, LAN ID, or source-address updates may then modify another
queued clone or the original TX skb.

Add hsr_clone_private() and use it for HSR, PRP, and both hardware
tag-insertion branches. Reacquire tag and trailer pointers after COW;
the PRP RCT is in the copied linear area.

This adds one linear-data copy per affected egress. Untagged software
forwarding is unchanged.

Fixes: 451d8123f897 ("net: prp: add packet handling support")
Fixes: dcf0cd1cc58b ("net: hsr: add offloading support")
Signed-off-by: Xin Xie <xiexinet@gmail.com>
---
 net/hsr/hsr_forward.c | 49 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 40 insertions(+), 9 deletions(-)

diff --git a/net/hsr/hsr_forward.c b/net/hsr/hsr_forward.c
index 67aaf5a8622b..efcbf3cf26f9 100644
--- a/net/hsr/hsr_forward.c
+++ b/net/hsr/hsr_forward.c
@@ -325,8 +325,29 @@ static struct sk_buff *hsr_fill_tag(struct sk_buff *skb,
 	return skb;
 }
 
-/* If the original frame was an HSR tagged frame, just clone it to be sent
- * unchanged. Otherwise, create a private frame especially tagged for 'port'.
+/* Clone an skb and make the clone's data private, so that per-egress
+ * writes cannot corrupt the original skb or other clones of it.
+ * Returns NULL on allocation failure.
+ */
+static struct sk_buff *hsr_clone_private(struct sk_buff *skb)
+{
+	struct sk_buff *clone;
+
+	clone = skb_clone(skb, GFP_ATOMIC);
+	if (!clone)
+		return NULL;
+	if (skb_cow(clone, 0)) {
+		kfree_skb(clone);
+		return NULL;
+	}
+
+	return clone;
+}
+
+/* If the original frame was an HSR tagged frame, return a private clone
+ * of it with the path id updated for 'port'. Otherwise, return a private
+ * clone for hardware tag insertion, or create a private frame especially
+ * tagged for 'port'.
  */
 struct sk_buff *hsr_create_tagged_frame(struct hsr_frame_info *frame,
 					struct hsr_port *port)
@@ -336,14 +357,18 @@ struct sk_buff *hsr_create_tagged_frame(struct hsr_frame_info *frame,
 	int movelen;
 
 	if (frame->skb_hsr) {
-		struct hsr_ethhdr *hsr_ethhdr =
-			(struct hsr_ethhdr *)skb_mac_header(frame->skb_hsr);
+		struct hsr_ethhdr *hsr_ethhdr;
+
+		skb = hsr_clone_private(frame->skb_hsr);
+		if (!skb)
+			return NULL;
 
 		/* set the lane id properly */
+		hsr_ethhdr = (struct hsr_ethhdr *)skb_mac_header(skb);
 		hsr_set_path_id(frame, hsr_ethhdr, port);
-		return skb_clone(frame->skb_hsr, GFP_ATOMIC);
+		return skb;
 	} else if (port->dev->features & NETIF_F_HW_HSR_TAG_INS) {
-		return skb_clone(frame->skb_std, GFP_ATOMIC);
+		return hsr_clone_private(frame->skb_std);
 	}
 
 	/* Create the new skb with enough headroom to fit the HSR tag */
@@ -377,17 +402,23 @@ struct sk_buff *prp_create_tagged_frame(struct hsr_frame_info *frame,
 	struct sk_buff *skb;
 
 	if (frame->skb_prp) {
-		struct prp_rct *trailer = skb_get_PRP_rct(frame->skb_prp);
+		struct prp_rct *trailer;
 
+		skb = hsr_clone_private(frame->skb_prp);
+		if (!skb)
+			return NULL;
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
-		return skb_clone(frame->skb_std, GFP_ATOMIC);
+		return hsr_clone_private(frame->skb_std);
 	}
 
 	skb = skb_copy_expand(frame->skb_std, skb_headroom(frame->skb_std),
-- 
2.43.0


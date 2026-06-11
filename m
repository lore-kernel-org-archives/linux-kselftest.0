Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0142E349AF5
	for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 04:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781152422; cv=none; b=QWcJiWq43Wusk83Y1lcxCxM9/ljk/2pJyDCvgyzxyXacdTJHLrzszSPT+MF5/aHEmMqPSFPzMHI5p9rHOpJXFOaQBw0CTVObf8fTcVytEkBojC/DVkqpx48SY+2HgL8SOiV5baL9tCBBs2f9FJVUAdcwuNpwkwKnVGGpHQfxPLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781152422; c=relaxed/simple;
	bh=1I8QxdKrCRUCW4iwYx12QJu9o2BPfXrulVxJ4CLW3gM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lq7eHMfwvAQ+FMcx9lIVf+FKau8evqUng1hK4JJrfsb6igKQIAQou2MaWCYb1KloldISG+Lij/riAq6g9FrYoTxn6kyX0lwl8tWIE4EB8xhIdCgdx9lB1pdqusn6sDIzBsaEA5du6ieaiRIq/mhfFLXcSJCaM62VVMrkLBn95J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qGxa1D9/; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qGxa1D9/"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2bf22d29dabso50021245ad.2
        for <linux-kselftest@vger.kernel.org>; Wed, 10 Jun 2026 21:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781152420; x=1781757220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+34DITpYKqJD3bohFtBBR1rYgBIHRY/jTC+acVQfU8=;
        b=qGxa1D9/o9W+1vyYtP6Rz1zoAGZu2iNEm5IfGClffsHx8IWnv+H8u3ArIrmlvUAqCL
         O1/Brg/HVryCTss9ORYcxRysjQAolZqVyjHl2VrN3NlW9lGvYFlkjdEBisajGyHAZR3x
         4w1enDnKKP+5ytC1/rJR+73dF5gr/2fBMIcofwICbSHVyDVl1p6LBBtG9s/tMOm+KaPf
         0VMT9AD0auTJyaaQIeW+syfeQvAuHx/3dr3Ta3Pm1b2ez4KR1PTtWe3a5lpBNS9RWfum
         e8veOVen4zQa+J6xhDStL5n4HDvpfVoYe7PQqKBnuLYfAFxdM0tJwqFBJhZbAOclxBxn
         100Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781152420; x=1781757220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0+34DITpYKqJD3bohFtBBR1rYgBIHRY/jTC+acVQfU8=;
        b=bCH8HBK7zfTjD8b4GStqNx8bud4QIfVg0QlRxDQirODt4CFDj+IqYWhQ+jb2gr5kA7
         ynjehTdFanVKvAcljB85SGqKqD81qMUY0vrJ5aqCv127BGmKQOAXZT50BIt0SQ+VrIJM
         a+e9VjFg7K1JjkWC8XC9O25mY9gQiX+DR1feQNMDml61p2pBDScOHkUJzLlcCTQ7ul0s
         soUWQIAjuxT+t5L7tOFrMvvwm2fRacZuz2yIg18Fz91/QjTW/pi5xwUu/LslSNdR6yV5
         yiwh4HYb/7K4wtM/9/QWDWIOSthfYS4R8uVF4VpzRjCG5ofcZWXN/MAOAN/9sbE7owmW
         k7bw==
X-Forwarded-Encrypted: i=1; AFNElJ9L1wz/E4v/IO7XoXHfJfCFtY7MkSI/ZkCf5KN6bJzsjsVa3f0anFgHpIJFtBma3MBYGYHP5T/wFmgGlVM7qt0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQreLms/1nVrHdsWiYAKrT2eKb6bdo5AWJhhkZmJtqD35dQQaB
	aHQqe2s9SAleU2zt0IY9pYzgMlOQ7z1QWaRP3f4Q+ncUMgp2HN3ACURD
X-Gm-Gg: Acq92OHZnpwdNfry031p58JLLgw+215cjLagyntmo3GGUhHp5aGATXsJOEZEQs0L/zc
	KgDxQg8ytos7p/9JIH37XJhF0/e/Jfbof/NYaUf68fWVrco34XvYMXXjD25PgCPjo0eCFWIDnjh
	ZazK593V7CSw1xG3ePZ/NEKE02sdNvOnk1af6ldqg6E6O8BaDknmu7bL3kEQE58IreYJVWYAYxy
	P90HdISAr0J20AQaLvpk6X0qDDvT04ATzkgAefxUs2uetlICMf6S7sIEnWVvPizUWopp9CQPEDD
	VJYzc/ihu16YXG8BgdYtYIHGPV6NGFMzt/LSDwUZB3V+xr0893G/ipovXYwwyxRHWsfG8taMaPg
	zhN6AAgYDlqgAY0S2N5ugAyCksqsEFFKCBZ+lf7ATsA0M5ne8xltD7MvCOb34H6ri4nAN28CDIS
	HQmVdeYtP6ufRVwJyblXtEIK3RCXnYSA83mrBcVbtIOinjoIU2SeNUu/luNCilOZ+1O+LLn6Sl0
	IEtSkp/yCluz/rR5Dke3olzVi821zkSVYVtCPM=
X-Received: by 2002:a17:903:3846:b0:2bd:8395:fedd with SMTP id d9443c01a7336-2c2f32549c9mr12465535ad.37.1781152420328;
        Wed, 10 Jun 2026 21:33:40 -0700 (PDT)
Received: from u2404-VMware-Virtual-Platform.localdomain ([2a12:a304:100::109f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e05fsm270794455ad.54.2026.06.10.21.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 21:33:39 -0700 (PDT)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: bpf@vger.kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	davem@davemloft.net,
	kuba@kernel.org,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	shuah@kernel.org,
	jiayuan.chen@linux.dev,
	toke@redhat.com,
	menglong.dong@linux.dev,
	emil@etsalapatis.com,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH bpf v3 1/2] bpf: Run generic devmap egress prog on private skb
Date: Thu, 11 Jun 2026 12:33:16 +0800
Message-ID: <20260611043317.512843-2-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611043317.512843-1-sun.jian.kdev@gmail.com>
References: <20260611043317.512843-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Generic XDP devmap multi redirect uses skb_clone() for intermediate
destinations and sends the last destination with the original skb. This
can leave multiple destinations sharing the same packet data.

This becomes visible after generic devmap egress-program support was
added: a devmap egress program may mutate packet data, and another
destination sharing the same data can observe that mutation.

Native XDP broadcast redirect does not have this issue because
xdpf_clone() copies the frame data for each destination. Generic XDP
should provide the same per-destination isolation before running a
devmap egress program.

Fix this by making cloned skbs private before running the generic devmap
egress program. Use skb_copy() instead of skb_unshare() so allocation
failure does not consume the skb and the existing caller error paths keep
their ownership semantics.

Fixes: 2ea5eabaf04a ("bpf: devmap: Implement devmap prog execution for generic XDP")
Suggested-by: Jiayuan Chen <jiayuan.chen@linux.dev>
Suggested-by: Jakub Kicinski <kuba@kernel.org>
Reviewed-by: Toke Høiland-Jørgensen <toke@redhat.com>
Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 kernel/bpf/devmap.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/kernel/bpf/devmap.c b/kernel/bpf/devmap.c
index cc0a43ebab6b..14506834345a 100644
--- a/kernel/bpf/devmap.c
+++ b/kernel/bpf/devmap.c
@@ -512,8 +512,10 @@ static inline int __xdp_enqueue(struct net_device *dev, struct xdp_frame *xdpf,
 	return 0;
 }
 
-static u32 dev_map_bpf_prog_run_skb(struct sk_buff *skb, struct bpf_dtab_netdev *dst)
+static int dev_map_bpf_prog_run_skb(struct sk_buff **pskb,
+				    struct bpf_dtab_netdev *dst)
 {
+	struct sk_buff *skb = *pskb;
 	struct xdp_txq_info txq = { .dev = dst->dev };
 	struct xdp_buff xdp;
 	u32 act;
@@ -521,6 +523,18 @@ static u32 dev_map_bpf_prog_run_skb(struct sk_buff *skb, struct bpf_dtab_netdev
 	if (!dst->xdp_prog)
 		return XDP_PASS;
 
+	if (skb_cloned(skb)) {
+		struct sk_buff *nskb;
+
+		nskb = skb_copy(skb, GFP_ATOMIC);
+		if (!nskb)
+			return -ENOMEM;
+
+		consume_skb(skb);
+		skb = nskb;
+		*pskb = nskb;
+	}
+
 	__skb_pull(skb, skb->mac_len);
 	xdp.txq = &txq;
 
@@ -710,7 +724,10 @@ int dev_map_generic_redirect(struct bpf_dtab_netdev *dst, struct sk_buff *skb,
 	 * return 0 even if packet is dropped. Helper below takes care of
 	 * freeing skb.
 	 */
-	if (dev_map_bpf_prog_run_skb(skb, dst) != XDP_PASS)
+	err = dev_map_bpf_prog_run_skb(&skb, dst);
+	if (err < 0)
+		return err;
+	if (err != XDP_PASS)
 		return 0;
 
 	skb->dev = dst->dev;
-- 
2.43.0


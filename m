Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF78F3644BC
	for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 08:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781165356; cv=none; b=gtmZQVV/LX+TR+kVYUYxHJJlIkQBZf+keTt1Vi+cSCaRUH5j1PUeqk27qibXYQoGn7RCCeWReQo/00pQnkaEoVRFmrR/OsWweX7OLRpahRcIfkjtwJWo5u8343KSmttfA3CgBxjoGi59R7pXkkpxBdW7tXoejl/wix79gRJoPlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781165356; c=relaxed/simple;
	bh=sR75Kxpp9ciWrEqzIhWSy15CiwlustcGI+ACVNAzzmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hFo3TKUoeWOa64p9e577jRNbBq+MTG+CI/PWs7WXCoifTA93boqU2Cx6zzyrbCNP6l0u/1HhDF5r9hZX/8r+pIUAnKdTXsFqjabRiuxGlUfI8Fruts8QrHBU3U25YX9BkpAPTqIrdSrGQ3rZ9Le9XxkLYihIKoIsO/FzyQ1yNrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rOR6XUw0; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rOR6XUw0"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c0c3543590so51893205ad.2
        for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 01:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781165354; x=1781770154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mEmkuWYgkwtDboU8MaRt1GYSESJN149ZsYa5eKF7+QE=;
        b=rOR6XUw01oMY3DEKqmiZLIDFKJz41ylz9ZwC24Dmvd31Ku5TVFwM8paItgRDhaoT7f
         OJiXW0t0cL/t/bVaeEK6GoaHrkxuRsX6RJibl0BJX9Y0+LuhQ4C1z6sq6JRAV0VnL8Uz
         GlbR4snkE9vXj2MgkfcU7UKaBzppYsFub+5eFKpnlKBFHX5TOqp3BHaHGZTmLpdK2uyD
         f8okEJVW0MHnEA3KbDOOSnNNnsRG8QgMlzmIRVdG99PQQc6teSSVrL+XtchQXGCbw5XT
         BkzRlOQuns2ZX+8jrYlxA/h2tCPAcM4tA0wrPaHvc753gmk9WT1XIne+o8QTjD3yqOo+
         P1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781165354; x=1781770154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mEmkuWYgkwtDboU8MaRt1GYSESJN149ZsYa5eKF7+QE=;
        b=reV9OJbqCyhopILGPOF8F9fvBaK4TgYCmrPofRtfkqAO7Rm444GS4CMzpHu+G8JyTS
         xxX3s3H1vakBFc2jcdPdI393H5rgjZFIl13fv/8yRAWpfvix74E1DwJpgP5r+77l+ZFG
         0W3lcZJOC4FrBOm5chPHYtdJ8A6JycvpKq7VBLt3wZMoocGzf3N1utF4NEHf/bBD7mBw
         6nX/WJ83Ksw5MuzWdccHTP3HlNd9DZXntMC2gDvuUL7m+xbeYZjBN+Peqyq50SG45H91
         nzLpebBoqukrsBn8w/dpnn8N737rUdCjPSOyIoP/op2nfnfPdQGBhfIqqW7jJHtcu9gh
         NEJg==
X-Forwarded-Encrypted: i=1; AFNElJ8KEYiCgcptZ9nehucHiObZrv/RVTQIhUX4aKdm/h9CVccd82HGYsPiJ8FIpf4GhmbG450jzYByA4xTD0c5UIM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHjyKFOVKBpOEkwr9Y/iBom93/62moqL85wiOhzGA5uS5iV/Fy
	/mjGfGHhnJHIEZLOe5jBUrAkfpXPOEIAuESoyxMpiAgBs3cl3Y7xusWD
X-Gm-Gg: Acq92OECdywjH7JVQ8KtkchaDi6B0oz1LFBzIkIbS/BNXL5JZrdH3RF9jp+HVcF2TUc
	5vJg0FFyaWHn7SX/oBuLywSX3gW2qnf4bU6PZeS35ig3c07a2gX4GYXMTMzAwUe7rxs+GCpGxM6
	ercViYLZWofH48IpFtSzlY/vZnqNLqKn04fjzcBUjsB2O+d9rJbf1QqO5pjQUJW0HBYv0SC9fzb
	pJNs07W21avwNCJnwyxaUK7QcNR968zVZYCXs5/Zxk7VrCCVujHxlayz3DYvFmQ2pPR4m8hsiBR
	5xpjRUStR5iYb6FnlZ4j8LP435phB3TH3mspQq8eNv3Hqep4E2vSiVcytTXgWIsN+hliOdnDFLH
	6KIrQzdIfQhVpQan62D0k4cPZke7dnM3k7+odOTEUyeh1kYyzWgQ/B+oZRQsuBz3ztDtdRy3CBD
	bsPahUwRPecB4hband5ag+y2qkqIoscHfhYbCDtaGAnR9VHPnvTRy5ZFxaqXficVjlE5Rc3nvPf
	lGje9uNGAbwmVBaQ5h2mCOsLZb6
X-Received: by 2002:a17:903:1205:b0:2bf:2114:ecc2 with SMTP id d9443c01a7336-2c2f305ddebmr19239665ad.35.1781165353999;
        Thu, 11 Jun 2026 01:09:13 -0700 (PDT)
Received: from u2404-VMware-Virtual-Platform.localdomain ([2a12:a304:100::109f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664ad138sm277591035ad.82.2026.06.11.01.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 01:09:13 -0700 (PDT)
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
Subject: [PATCH bpf v4 1/2] bpf: Run generic devmap egress prog on private skb
Date: Thu, 11 Jun 2026 16:08:48 +0800
Message-ID: <20260611080850.536996-2-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611080850.536996-1-sun.jian.kdev@gmail.com>
References: <20260611080850.536996-1-sun.jian.kdev@gmail.com>
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
 kernel/bpf/devmap.c | 41 +++++++++++++++++++++++++++++++----------
 1 file changed, 31 insertions(+), 10 deletions(-)

diff --git a/kernel/bpf/devmap.c b/kernel/bpf/devmap.c
index cc0a43ebab6b..a3d6c60dbddb 100644
--- a/kernel/bpf/devmap.c
+++ b/kernel/bpf/devmap.c
@@ -512,35 +512,52 @@ static inline int __xdp_enqueue(struct net_device *dev, struct xdp_frame *xdpf,
 	return 0;
 }
 
-static u32 dev_map_bpf_prog_run_skb(struct sk_buff *skb, struct bpf_dtab_netdev *dst)
+static int dev_map_bpf_prog_run_skb(struct sk_buff **pskb,
+				    struct bpf_dtab_netdev *dst,
+				    u32 *act)
 {
+	struct sk_buff *skb = *pskb;
 	struct xdp_txq_info txq = { .dev = dst->dev };
 	struct xdp_buff xdp;
-	u32 act;
 
-	if (!dst->xdp_prog)
-		return XDP_PASS;
+	if (!dst->xdp_prog) {
+		*act = XDP_PASS;
+		return 0;
+	}
+
+	if (skb_cloned(skb)) {
+		struct sk_buff *nskb;
+
+		nskb = skb_copy(skb, GFP_ATOMIC);
+		if (!nskb)
+			return -ENOMEM;
+
+		nskb->mac_len = skb->mac_len;
+		consume_skb(skb);
+		skb = nskb;
+		*pskb = nskb;
+	}
 
 	__skb_pull(skb, skb->mac_len);
 	xdp.txq = &txq;
 
-	act = bpf_prog_run_generic_xdp(skb, &xdp, dst->xdp_prog);
-	switch (act) {
+	*act = bpf_prog_run_generic_xdp(skb, &xdp, dst->xdp_prog);
+	switch (*act) {
 	case XDP_PASS:
 		__skb_push(skb, skb->mac_len);
 		break;
 	default:
-		bpf_warn_invalid_xdp_action(NULL, dst->xdp_prog, act);
+		bpf_warn_invalid_xdp_action(NULL, dst->xdp_prog, *act);
 		fallthrough;
 	case XDP_ABORTED:
-		trace_xdp_exception(dst->dev, dst->xdp_prog, act);
+		trace_xdp_exception(dst->dev, dst->xdp_prog, *act);
 		fallthrough;
 	case XDP_DROP:
 		kfree_skb(skb);
 		break;
 	}
 
-	return act;
+	return 0;
 }
 
 int dev_xdp_enqueue(struct net_device *dev, struct xdp_frame *xdpf,
@@ -700,6 +717,7 @@ int dev_map_enqueue_multi(struct xdp_frame *xdpf, struct net_device *dev_rx,
 int dev_map_generic_redirect(struct bpf_dtab_netdev *dst, struct sk_buff *skb,
 			     const struct bpf_prog *xdp_prog)
 {
+	u32 act;
 	int err;
 
 	err = xdp_ok_fwd_dev(dst->dev, skb->len);
@@ -710,7 +728,10 @@ int dev_map_generic_redirect(struct bpf_dtab_netdev *dst, struct sk_buff *skb,
 	 * return 0 even if packet is dropped. Helper below takes care of
 	 * freeing skb.
 	 */
-	if (dev_map_bpf_prog_run_skb(skb, dst) != XDP_PASS)
+	err = dev_map_bpf_prog_run_skb(&skb, dst, &act);
+	if (err)
+		return err;
+	if (act != XDP_PASS)
 		return 0;
 
 	skb->dev = dst->dev;
-- 
2.43.0


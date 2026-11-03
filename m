Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749923;
	b=u4iCUH4fuSNk6gilw1pql+rOZ5Wg6i/hn1tCRW8DHWVmf1bmRJ1Vj6MOhfrMKLo9GetJ
	 ltu0m/ZEzYxV8+6p6XAJjXc+KGkKwx+Xw1c2+d8yh1f1f3zLpC/PO48M8m7ror4qtD83z
	 nEB6ya0v2zl2yANLcmQocE4v+yKNkdUb9dZqcBZWehFr8c/jjWE0maUxWqAntriYJiEOV
	 fN5vqTPTpSZwX7YD7PFp2imfkFIQaYN6MggSjTIppqwU+mjTJl/w+tOlYxXSGENZKaEYd
	 7QloHza9O87PKPE07dnARg+/DLurNIdYqcLekIYfzqBXbnzvokW/pkh2QoIQadIoc3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=YK0Xr740yMaz303kQAw5xU/hri305+ZpCPlJBa3zu5I=;
	b=FOhQQBytSgzf/U9/47rBCWhzSH3nMwSq+93owKy7Whx3taKFvbdNvrUzmk5sSxjJ26HK
	 2ry1w2C3wc0QuOOHLoOHMRZr5MN/iLG0XbVyW3LWP4JE6arop5AWXkcggP0h/UnwKOOmu
	 sxAkHdrcjLYmbd4dXhHeSLtSNe3aPMaljdj2o/RWn2O6N7Qco+/PKAU/iYtpvmdtsCH/O
	 Wa9tEtobLxWtuHJr4o2mwLBRr3uBbZvWprRUtvLn8x0e0Vm6QkfYBADBTHBRiefRg0pMA
	 FZFGagPL/hFukxXbUnRvmj0uUdiFfBVieX7OaVTnofRVbvl2ccUJ6ZOO9zEWn4LT8kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ibeH9DzR;
	arc=none smtp.remote-ip=74.125.229.137
Received: from mail-dl2-f9.google.com (mail-dl2-f9.google.com [74.125.229.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C21606EE97
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 23:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58C21606EE97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ibeH9DzR
Received: by mail-dl2-f9.google.com with SMTP id a92af1059eb24-19305bcb6d5so52599c88.0
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 15:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793749922; x=1794354722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YK0Xr740yMaz303kQAw5xU/hri305+ZpCPlJBa3zu5I=;
        b=ibeH9DzRIx4RfJPxFHevHlDLr/xdu4QlU9YCsTEV7vBw0l4zutu1+wX3cGgEFI0Up+
         CVu0HBGKpCLnauFhvNuKxdWvE/qXcbaTNrYSZKDwDqF/iH2b7xd0T5PgFqQwR7BDn0pa
         Rq1D90uB+attIqkpLE2zIEaD5/5JfR0laKPNMuYywldn2ktuZtRARf+yB6gMO6LqXH3a
         hEFFwo2eCeXcLrFsUYt0aR79LL7Zm/IG9nk+H074IXsetu1oYEevVpEpoge21ZwSDkZe
         UC9DLBOB+CdzmX6Wz71LszCuBKJN1fdZfHa9hb4u8IeSILYNKVjY8c97A8kW9FbNWbPl
         fWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749922; x=1794354722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YK0Xr740yMaz303kQAw5xU/hri305+ZpCPlJBa3zu5I=;
        b=aK39WZsf7G1mGpRHv/6wdn3DTh0lK9BVEGQoPCuGJHPIer2kO7mv+NtHn3yvRGZd4Q
         mShT+x8EL5X+V77qKmbYX8enLT9RGdB8+pLhfTOeK2ZhUo/c6KKpyEHdBVlD9h7qGEj9
         kxnBtwlHMcl8kW3O7lOo/w9+oTDaBenIDKHTIPxRfyUjL0JN2VTU5G7l9GlG7zR4L7BA
         rdd555GJpA4t9GuBOb8x8cTNtngUtHlr1y8an+oUzM6lSQCDj2Dd2PnRbv0WDIY8ucBl
         k3Ko8PFzuG5DR3QVLLEIXvjFG7W7fPSY0QDzjdk3ZalHVI5w3S5ZmMz1lwHo7fY/sFpE
         RFhg==
X-Forwarded-Encrypted: i=1; AKwUvBwXbxNyxVqIXwml3JnwTqY+SHvUtV3NXFC6HMIbGqxcgbV4/1VgiryjZjp9z3JThNeZbvF6qjUkdG95t+eoe6s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9acLKSnFdz7unNqOb9Uo1ZWSxLNdfrdX4QXiNpJaWmgTspbp+r
	U0tpPFYUKzirNeg2dq25RPc2rbI1HxarTHlhDqByHq6oA7AJNDTjgvvu
X-Gm-Gg: AYBFou1eRx9qeF2DpgJqqlc8UnmtNAT0sPd6eLRhDefdX0HwOHnAySwu2Z509QbIcBB
	F1NaD27kaPFIbv4hnYpWm0sBrY8TGMeLioAD/63uBNwOsDsG0UYmCdsNHxCiHfUFEubY6uIK66M
	ue52Ta0U8y5YRYk1DIuA1QtW2FuO62CxH4KBF6kITzBi1vUwD5oqs3CZfXrXyMVPcTO++bda3hN
	isUuowzhLwC9npRQqznm+b0MFOGStuoXnjpgShDmBYXMFlY9kVZ/BHSxmvMLC9OTrDPNgoch5DZ
	O0r9/7ktW6m2/1+Ip2KFru2Kia8P8fZUXCHpk9n/LzeTOnwTTiTIQzADJUyYWnx/Aximu+Sey/3
	5FTDYVvOK6mRKEwwDPK8g2Wk+3zSEd8/rt0Pi6vXb4yvi9BvNhrLO5r2hv/cXnjnx/C5DNB/zUS
	TojJbSFU963vydYn8kiR00oPYC/jrUOHpQt0Z3fMZG89hv60gE/+/tEplCd59zQT7edKTy8utZD
	KvDy+O5zeifPHBJfxgMCR3OxrIgZmHOVbi+ykDUHDOKYu1BxqOOm/AHeVp/urKAR+lQq8IpxeAG
	1easfNb2losruol9dvjIRcT1OSRdj2uSqckb9yjWkSb2
X-Received: by 2002:a05:7301:6405:b0:366:83dd:4704 with SMTP id 5a478bee46e88-36a423dc7f8mr22151511eec.17.1793749922079;
        Tue, 03 Nov 2026 15:52:02 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:6d::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39b3b7esm1439560eec.28.2026.11.03.15.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:52:01 -0800 (PST)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	edumazet@kernel.org,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	sdf@fomichev.me,
	almasrymina@google.com,
	bobbyeshleman@meta.com,
	asml.silence@gmail.com,
	razor@blackwall.org,
	daniel@iogearbox.net,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v2 6/7] net: devmem: size TX net_iovs from the dmabuf sg table
Date: Tue,  3 Nov 2026 15:51:51 -0800
Message-ID: <20261103235152.1904727-7-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103235152.1904727-1-sdf@fomichev.me>
References: <20261103235152.1904727-1-sdf@fomichev.me>
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

PAGE_SIZE TX net_iovs cap devmem skbs at MAX_SKB_FRAGS pages (~68KB),
which makes BIG TCP ineffective.

TX net_iovs only need to be DMA contiguous. Use the largest power of 2,
from PAGE_SIZE up to 2MB, which aligns every DMA segment of the dmabuf:
- 2MB hugepage-backed udmabufs get 2MB net_iovs
- no UAPI change, TX addresses are dmabuf offsets
- skbs are still bounded by TCP's size_goal, only frags get larger

The net_iov size doesn't depend on the device: frags are capped to the
device limit when they are built, and many frags share a net_iov.
Capping the net_iov instead would only split frags at net_iov
boundaries and allocate more net_iovs.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
Reviewed-by: Mina Almasry <almasrymina@google.com>
---
 net/core/devmem.c      | 28 ++++++++++++++++++++++++++--
 net/core/netdev-genl.c |  2 +-
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/net/core/devmem.c b/net/core/devmem.c
index 19c039ed2cb2..98c9594dbf99 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -181,6 +181,20 @@ int net_devmem_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
 	return err;
 }
 
+static bool net_devmem_sgt_aligned(struct sg_table *sgt, size_t size)
+{
+	struct scatterlist *sg;
+	unsigned int i;
+
+	for_each_sgtable_dma_sg(sgt, sg, i) {
+		if (!IS_ALIGNED(sg_dma_address(sg), size) ||
+		    !IS_ALIGNED(sg_dma_len(sg), size))
+			return false;
+	}
+	return true;
+}
+
+/* niov_shift == 0 picks the net_iov size from the dmabuf, TX only */
 struct net_devmem_dmabuf_binding *
 net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 		       struct device *dma_dev,
@@ -191,11 +205,11 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 		       struct netlink_ext_ack *extack)
 {
 	struct net_devmem_dmabuf_binding *binding;
-	size_t niov_size = 1UL << niov_shift;
 	static u32 id_alloc_next;
 	struct scatterlist *sg;
 	struct dma_buf *dmabuf;
 	unsigned int sg_idx;
+	size_t niov_size;
 	size_t niov_idx;
 	size_t i;
 	long err;
@@ -221,7 +235,6 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 	binding->tx_max_frag_size = dev->netmem_tx_max_frag_size;
 	write_pnet(&binding->net, sock_net(nl_sk));
 	binding->uid = sk_uid(nl_sk);
-	binding->niov_shift = niov_shift;
 	xa_init_flags(&binding->bound_rxqs, XA_FLAGS_ALLOC);
 
 	err = percpu_ref_init(&binding->ref,
@@ -266,6 +279,17 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 		goto err_unmap;
 	}
 
+	if (!niov_shift) {
+		niov_size = SZ_2M;
+		while (niov_size > PAGE_SIZE &&
+		       (!IS_ALIGNED(dmabuf->size, niov_size) ||
+			!net_devmem_sgt_aligned(binding->sgt, niov_size)))
+			niov_size /= 2;
+		niov_shift = ilog2(niov_size);
+	}
+	binding->niov_shift = niov_shift;
+	niov_size = 1UL << niov_shift;
+
 	if (!IS_ALIGNED(dmabuf->size, niov_size)) {
 		err = -EINVAL;
 		NL_SET_ERR_MSG_FMT(extack,
diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
index 384fdc5ae514..bfd229bd31ca 100644
--- a/net/core/netdev-genl.c
+++ b/net/core/netdev-genl.c
@@ -1261,7 +1261,7 @@ int netdev_nl_bind_tx_doit(struct sk_buff *skb, struct genl_info *info)
 	binding = net_devmem_bind_dmabuf(bind_dev,
 					 bind_dev != netdev ? netdev : NULL,
 					 dma_dev, DMA_TO_DEVICE, dmabuf_fd,
-					 PAGE_SHIFT, priv, NETLINK_CB(skb).sk,
+					 0, priv, NETLINK_CB(skb).sk,
 					 info->extack);
 	if (IS_ERR(binding)) {
 		err = PTR_ERR(binding);
-- 
2.53.0-Meta


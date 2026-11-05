Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793917283;
	b=Bt4ftRsSB42tPSLjnhK3s52Tr469w+sutD2+fnP+yYI5jC3y38dPmNhVN3H3tUAP4onO
	 aYV089GUrGiGql/V65/uDU2JjpkikPK53RhMTBfwp9lxsEcunzfToNdY7OjAgPxJ+438M
	 v9LH6B80/5I9hvvZjIQc1ylyy8X1FPcTPXoAcbutGGT0LXDSLFGjk9drjGRxq/LcQXA1h
	 512lQIkjy3mudmI0MOZn/IF9EmhFNvCmjjxdcA5hS3o+Rj90kfX+zPYM01NLS6E/Jbc70
	 4m8qYc7DAB7RyyFr0/aVI8cKCwX0uiF8w1cjzsygWR3PZlw5wKLF8A11Sk2jRE8w4fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793917283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Acd/QpdNjaZoFfEYKM7452m8zFvnMYypavI01EcAq44=;
	b=qo5+yIjUtJ8uX0UBcl7DuQBB/o8za1QeACAp+cSYdGHD1Ry54TIIb+048XPBDqOzF6q9
	 mm8BqTzUAAXneZBtbsjIHDuG3f+EXJ5n+Z0vWJVFp30uGMKrvtoYYUpXOj5FXThUT3ghW
	 d7kSYshV7ka0NqZGe2RIQPCX8fuiSA49gY6XiCFyKC6HdhCvZ36V3FhtTxEB8Od261AdP
	 iph5WNp9dP5Z6NwPo3UrxIMW9B9q4Y5yIO0mchDUsT2IfwKYOKulMewM9I6tNxwsTJBOA
	 ClQfIahadTFjTaqWPz4S6r3EWBI3YVzET44kFQrGOrYB+FTO9g/gX3F8KFw49sK/GXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gpahHltS;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9DF606EE8B
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 22:21:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B9DF606EE8B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gpahHltS
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35829219da8so1147712eec.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 14:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793917271; x=1794522071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Acd/QpdNjaZoFfEYKM7452m8zFvnMYypavI01EcAq44=;
        b=gpahHltSOyFyzTfMXDIYVv/IO8fAwDTU17+d5bpsCt+yDVFs0wG1xrAMoRJicRmKPa
         gKI8s57ZpODIASUIp5wXVVvn0dIMueFV6tmFExcufTlIvRDJ4FwcnjfpO1YiuNJYskh9
         wLBlCA5zt/TFk4FPt/ikmVcTIxK+DS/GQI6BDUCn7xk5eRTj+QDNPe7/IfzP0+PoqJDO
         f6Klxp95jMLnpk15i8axVytxSGb3KcE2gi3iZOQscKPFpp/t5tmXo2nxodEhCP4PNuci
         E7Zsalf+0684reRO+DpFrYWLcmSLFMcGH2zy2tw6XNi9+YUIR+sge4x6dG1zkuero/lF
         dJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793917271; x=1794522071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Acd/QpdNjaZoFfEYKM7452m8zFvnMYypavI01EcAq44=;
        b=wN5IKa1TAqbs5lLXRxSG/WMV74+ZQprWhglG4TXJ8AS3JojD26mHy8/H8dsu+5qLXb
         lJ/cfw6OSZxjf4xPiBJHU3MlalfLI22u1qOvn2xdQUdHh8DajQD2pdROv51cGjMR0k9C
         eYb/Xl3wNVu2UlQ0+wNlbeRfY7GIT9n6rJJ2W65wMt8XYnMeqohbVlfBaOfS1Isn2k2x
         PX5XIm48cxpmVi64kb0iHgRZny2jQIZZxAUupi61NpNNGo/kYSPtf+D9bb5PARKNN5OV
         V0e/Wzsc/yNVtxw1MLtekBih6yyhIRWYv/T7bIcSHjmdKtxXCPEEd9SighKow4vj2Vrw
         rkFg==
X-Forwarded-Encrypted: i=1; AKwUvBzSB6x0WkZ6/9jOcXr9cSoVlXmItfmE+3GuOiy2h1kWejzbp4Vx8h8m/WfGd0B0PgoL5agfUQWFo80I6Yrji0g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1GkGkZLiSWT1+YtfJ5UXEqpFSZTnUvXfsElr0g0R8wSxeg4hV
	CJGpXV28+oPyF3Mgq225Ct/rX850Wz70T8UOy4pecSULL8LEG8be4apQ
X-Gm-Gg: AYBFou0wDSDhAaTZwy68TWkvFNT4kVq2w6Cx9ARhyq5MCM+j3kiH428waMKbDtV6jOu
	6lvCjvE57WUxZeahPBW+HhrU8JBdh98pz+Is7SxO+wp9P5t01neVBB2KOvYWWKsyLPsru5TJysw
	ULiZiz1DdIA3RhWHtoy+UzHq9qxHOC4X2SCEsKte0Z3ilFZrgUc9vPPH5v3SiPAwOn/lhMwr/Sn
	2n0QR13lXHNVFVohePVEZTDKEz969gO4u43I/QFuIWY5RUYtUUE2aLt4KdVtTL63mluEaAlTaU7
	YhBOTueJNCzxdo2BGQuAPWrDKZMYXTAq0Ctsltm8PZUw5w4vL2fsiXcpyfoao6/DidFyvypmj2N
	txFYnccYh6L9JwEdt5H8dQ1rOPRN3QkZvA37WAvy9KR7dn6OFDitX2YIfUkcC/HZ76BAllZQL0K
	UySGcCsIYoxF1DGnBxE/vsFm2FX/qDpCslRJqA5es5FVYT+E9fKABfkoyl593GwaWmerNSNkR09
	wKjVYmMIlsepLBn7yeshwsxwsKrfkWnaNhHhWFWdkIYwORAH62A62AIU7zOG++0RTCEf+w1IQDl
	UqCuxKWjHjO3e4r0am6w0YA=
X-Received: by 2002:a05:693c:8854:b0:36c:a1bc:6102 with SMTP id 5a478bee46e88-36f6f88bc79mr764065eec.0.1793917270504;
        Thu, 05 Nov 2026 14:21:10 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:72::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8d44500sm51197eec.5.2026.11.05.14.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 14:21:09 -0800 (PST)
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
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	alexanderduyck@fb.com,
	kernel-team@meta.com,
	sdf@fomichev.me,
	dimitri.daskalakis1@gmail.com,
	almasrymina@google.com,
	dtatulea@nvidia.com,
	bobbyeshleman@meta.com,
	asml.silence@gmail.com,
	daniel@iogearbox.net,
	razor@blackwall.org,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	leon@kernel.org
Subject: [PATCH net-next v3 8/9] net: devmem: size TX net_iovs from the dmabuf sg table
Date: Thu,  5 Nov 2026 14:20:57 -0800
Message-ID: <20261105222058.944293-9-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105222058.944293-1-sdf@fomichev.me>
References: <20261105222058.944293-1-sdf@fomichev.me>
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
Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
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


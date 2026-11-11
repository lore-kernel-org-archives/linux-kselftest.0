Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.68
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794437268;
	b=hKQvzBKwrLo1lynXxBOHUMv97y1iMjiyyQroZ/8Fbyf6V0soODa1geZ3dra7F3vSgxRW
	 b1EPd5P3BmtGROeCar8RA9qkcs8ch/rpV+5nlOjfxCq6eXXi8qFVSGS7m+GMIlrhFOBhz
	 0YxCmttiCb2qBGMJ0N6IA+0JyAwuTFfjCfrqmQraOeal2ReCpW1itJgWwhETgUZnfJLWV
	 eobNsiecvx8ANkL+wGX9hZ60xqKkyyyJzWXRWvxaCoacHQUaS8eZPMKbvhEpGuLfr8aq/
	 XOlOEpvw00YDmnIN5+uKtJNAF4oFBmaun0x/rDs5UMd+mt+7WnkG9iVGNLSsl7sTqeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794437268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=4hN7C3+Ii9TScat9ZCbbeY9Q6fb9s0by3LwxPMo02TQ=;
	b=2jvZ7cqKjJunjqKYQ9LiUBEoc+r1yIz1v51A6rx4AyrS3fmzf6yD0Wa8P3HIRQ9Lo4Pu
	 nlK1bTGo3Aom4eraXbZjxTDTHILKiHKUL/gov5edd8fJ9zemB6IXbejAt28rjZW//y+h5
	 XmKwRKusiSAlR2Lj/yUkbdXEJ1k88xfuLIbI0rj4991KSJ0reaWZizXHSUMv4D/i0cPaM
	 +UMZji1nTJ6YgQZ0JFr2V8946ORlplsz7ZswhCfVtVBor42CZ32pv+T1bni3Y75q3wmtR
	 VwzpoZFnFNe/IqOT+1w19GHiT6DuNxrGaz2qMVEn4UwU249bT3W7lZVBrnbAf/o/Iqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nAJkqCHw;
	arc=none smtp.remote-ip=74.125.82.68
Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0D360A261D
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 22:47:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B0D360A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nAJkqCHw
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-18818daa3e7so169614c88.0
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 14:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794437267; x=1795042067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4hN7C3+Ii9TScat9ZCbbeY9Q6fb9s0by3LwxPMo02TQ=;
        b=nAJkqCHwpwdzkCPHLl4r4j1xM5P8yXkPiLbuxvWdfJkCzJFRVh9IqYWdfCmu2LNmtK
         JmnG3ovMF7UV/pO/Di9viQu8YL4X6aERpCTcyLNeNO8RcY2jQYGs4UExELnm4RV2Gujb
         8QUMF/Sgu+hPOo8o+7QmfIKc+BEXG1P3ZhjJZePFMKFB0qlxMMlvnrJMtDP7MxpXnVWi
         oB0YMQzBTHq891Nx0126X71VAeGvz3/eCd1Jl4eI+QlcG1X8Bl+qGSAm0TKWH+khyRZT
         i03NxJUoShTj7voGFTXFI7C614Hg0Ed5VAqb7O0derPNFtfH68AkNSvQ5KDYPQlITmkZ
         pKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794437267; x=1795042067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4hN7C3+Ii9TScat9ZCbbeY9Q6fb9s0by3LwxPMo02TQ=;
        b=0DhMAaRiGRKWgYeMT+nwr+KLbJc9IdrS2S4Q2e9gJXVWAg5iS0oNy3vcvFJRBrCzt6
         g7DoQLtGOyZ52jfpiGRoLr1iOV5ssf3achira0gKztSwxmXLNTnJw9O+TyZNpLtWjzDa
         Asp0bpPT0FP777OGHZEBRPQoixYTVpfKqpVQz+gZ6xMs9x+qm5FTeHrXijfVGiDNPjqF
         93slD/9X9Vps9DLUOdbq7IDolFG04EgRdwG22dYn8qidzfr5wrUI7BYt642hN9zexWy4
         n4eSUSSvRlM8PKb1CLZO8RKdQVZhlpgO2EVJ330ZYwz8+vSFhzcVrwvSgMGWPvd9HDHZ
         Cauw==
X-Forwarded-Encrypted: i=1; AL+hErEXKVfV54udBQOVrJOUkUg2ZYgx7eqObwuNDe1sg/oFdPs6zuYNyT0Z6pAF+O6h0fogONF045ablSO6dg+/Gk8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9387RuimQo429M9xWzFCFEEkvZuxNL2lrK9pfq/jLIys4MG8tw
	LhtQXiVFxsBq+OVckhSE4w0sTxt/sQACWeAHNcvOO2DPg4U4paff2azF
X-Gm-Gg: AYBFou2BIb9YziB2wkBOLDh8R/rEsjCx594ky8ELTlPA/ESZ7Oe/aOucmXm+3A0n5ep
	i99sv92jFmX3ek7PENXqKGImfvCgu/dvD2l/kbGRI0RLsWy3JKVBArx3qGBrT+M1ZAqgoAZscf1
	fSSE9NCH5ALu2MrdQVVimBVRDHlCS6d+DNnaX6h7Kw/zC/YCHpDfeCFCJX3lZbPZzh6Vmz9DCua
	E8F8L3CtZ3/VPqZNK6E+PsRzeq5dy0xZSTgEy/ANf4uuNHWFS2iqoVAmEooYEy66G94jfrx2ERU
	iKS/XH7YhWmz2XW+9Sg2ahwl5MyK0z4Txl7UCG5y8r+lTS9rmbLiP6m3AHG8JbwJl3rgZ+x7G4I
	sTChJxsvbXCuE5N+SB8Hb5MFr04+inIwX97j995ek/8iZCtW1gfViRNt1PMu92cS4Z4j33Cz64+
	fAvcaLXY+XtZr0WNLZVUvGxxznBNK6xLqxh2qKjLCs1C05VXFN4w6qEMjEcU7SN3tDWqm07DfI7
	kUckH/S776RPupyRYL0MgSwA+6ZDxMn/PtpQj24NbBAmen9pg8eap7HH/e/LNHx4GUNGlbi4t8w
	9TpseMqFi8Iqbr1cPAjCRGk=
X-Received: by 2002:a05:701b:4212:10b0:1b2:459d:331f with SMTP id a92af1059eb24-1b4f5f5c6b9mr742611c88.16.1794437267067;
        Wed, 11 Nov 2026 14:47:47 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:71::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4efc2sm16602523c88.15.2026.11.11.14.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:47:46 -0800 (PST)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	andrew+netdev@lunn.ch,
	edumazet@kernel.org,
	horms@kernel.org,
	shuah@kernel.org,
	almasrymina@google.com,
	sdf@fomichev.me,
	leitao@debian.org,
	dtatulea@nvidia.com,
	asml.silence@gmail.com,
	bobbyeshleman@meta.com,
	daniel@iogearbox.net,
	razor@blackwall.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v4 4/5] net: devmem: size TX net_iovs from the dmabuf sg table
Date: Wed, 11 Nov 2026 14:47:39 -0800
Message-ID: <20261111224740.2744522-5-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111224740.2744522-1-sdf@fomichev.me>
References: <20261111224740.2744522-1-sdf@fomichev.me>
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
- skbs keep their size, only the frags get larger

The net_iov size doesn't depend on the device. A frag is never larger
than its skb, and the skb is never larger than the device's
gso_max_size. TCP sizes skbs to fit, and validate_xmit_skb() segments
bigger ones. gso_max_size is 64KB unless BIG TCP is enabled. With BIG
TCP, page frags can already be 64KB or larger, for example with
MSG_ZEROCOPY from huge pages or with 64KB pages. So drivers that
enable BIG TCP already have to handle them. bnxt doesn't handle them
yet. It has a 16-bit BD length and needs a separate fix.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
Reviewed-by: Mina Almasry <almasrymina@google.com>
Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
---
 net/core/devmem.c      | 28 ++++++++++++++++++++++++++--
 net/core/netdev-genl.c |  2 +-
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/net/core/devmem.c b/net/core/devmem.c
index c6868f39261a..713528048897 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -303,6 +303,20 @@ int net_devmem_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
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
@@ -313,11 +327,11 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
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
@@ -342,7 +356,6 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 	binding->vdev = vdev;
 	write_pnet(&binding->net, sock_net(nl_sk));
 	binding->uid = sk_uid(nl_sk);
-	binding->niov_shift = niov_shift;
 	xa_init_flags(&binding->bound_rxqs, XA_FLAGS_ALLOC);
 
 	err = percpu_ref_init(&binding->ref,
@@ -387,6 +400,17 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
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
index 9c5bf17b04e5..d2ccb1090496 100644
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


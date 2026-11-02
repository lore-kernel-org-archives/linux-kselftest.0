Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646887;
	b=CMKsXLT7eq50tdd53WsraFTIamznK8KvGELFVmfV5R8AguN/p5NvZFOUocXEXgIub3Mh
	 MBlYMq83RTZCcAJHyLpotLe4HXSdlTE1sH4XVwSaKxW351WjsSDOqkSqqR4ifL96DMiFW
	 Y2msfSX7jfPf5Tnme9veeWEJszpSyrpzHue+9chz1Jj27b5ZdTaJ84mPeoLjjjYEn2X/n
	 eQk4fQgYGCDPcwWoTm4gnlHL+Lh0ISQWdnUVObyZD7StkeMFVUfNWu616CpyhwMu/JQ5j
	 BcLjrmbmvnQkaj0fIiZxeCTLr3esub47kn1jeagg5A0bmZlXvc1mpjRD2Ac0nxmQgBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=x5vucs4W796ZHC+npd6ZnayJC+IA8nom1dy9O9U2Tu0=;
	b=XopBM//x9t9UrpDoxyEFMM/s8YKnfxvyIkOxwBbnVOh1nDGU7v1+wmhXnY3Q2UKyPyF4
	 P7kFhZwejMTcfeGoG0HuUQj7fsqhxcHby2fDLy7QfiyIbgs5t0qXXQUtWCcp3Y9eX8RHd
	 1DizdUupX7D+9jnC+jLblatDl1FuvihJQ6PkzuTSkuaRunKEOCXP+jlNsoG7H0FEvttqG
	 n0z9oHOye5R3aybjPACUNPc9sza4Aoe0Rs/u+T2BmjSWvv2D95WzTn8yiy3uKubtvPt5q
	 4sVAiGgUKi0SvZDc9bfC0T9v3z4YCH7zIvlOqWAAP5GLCJA938tLwjrzUgN72gq1JMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fvBS6lME;
	arc=none smtp.remote-ip=74.125.229.137
Received: from mail-dl2-f9.google.com (mail-dl2-f9.google.com [74.125.229.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F58F606EE99
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 19:14:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F58F606EE99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fvBS6lME
Received: by mail-dl2-f9.google.com with SMTP id a92af1059eb24-164f08a9e84so784302c88.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 11:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793646886; x=1794251686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x5vucs4W796ZHC+npd6ZnayJC+IA8nom1dy9O9U2Tu0=;
        b=fvBS6lMELxvPUr0t9WppDBxoZ3YyYAaIn0kwnnJ0T1cQMEU6EHFjYMH4dElyrFVU5H
         oeH0YlKYaZ1RO+vZCTK4pMgcXVpvIVpwKzkboXMjdim7hCZGLPfjKvxuBCZNnRgOYNxV
         jfBSfCLum1ZHzk42Peda6hJtD2KVEdtyQK6ftkL8Acpwdleq5KTpfjjpIOSsHYS7r6Or
         hCz5sq9YL8xFycVBZPLC0KZZOhbjzis9byKNUidkJw4GejbZNz2PxdhWMC1bZ4Wygrg4
         e2HXMEEhQS730SOZNq3nHadFxd9P2R+AH0lrgqxidRc5bN2/Wji7L+XR2WOMRxezaakg
         brGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793646886; x=1794251686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x5vucs4W796ZHC+npd6ZnayJC+IA8nom1dy9O9U2Tu0=;
        b=rlSYefoy5VCGlIrLHeu8s/WWfm221wyBAeXHoC1N5QDP2NCP1fypjiUMhEa4WLPUyG
         077rDiGfDbPk7/9oOacuSxtyYX4nI/ZpniQalqAFda+UQPmAzPQbn3HEyaXuu4tX4Cg/
         AKVu9jij0/ZRL/05cQr/u5VbxZMQCqplrwzhgctj5gbCYg4U9zr50BZg6vwgn0Kj/He5
         JxmxQIO6S0h7YSNz4SLHGhtury18vSDmQDBrCqpoEck7RhJdLtgcHuNuLY+JnuZ5cWiz
         c/eE1zYGvwFWUF0MPECeXIpifhcm+Jx7eMz3+oWAxt+873lSaTyAkP3jTL+WarDrJloT
         FNcA==
X-Forwarded-Encrypted: i=1; AKwUvBxUZ4lnjTOmMB9DB0Dvc++yJsDjqeTnamspZB1yfge+9605GjMV4cGTK6pfwxeTPv8urjD22i/DqXuB9x2x+4I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKU0mk8BgTKzBXfuOAuy9Joa7YVrK2KPl93X35z4Ajvd4hJjEP4
	1j/q3EOjXLBhXl3TFYONKkMoMwt1Gtf07Pkltotul1UDU0rU6373IFSD
X-Gm-Gg: AYBFou2xvJB84DGj+6c2RqujEZrIsjcLVGJhmNaq4+6ma5HEpZZdSV25QcFxdJeXMYg
	3Vry9H1MRRwRvP8iPZ6bClHtewroCSkvZ6qECZGAAo8nQt6OzfLyWOqbfhELTofMJmGmvIUa8L5
	/qi5uNT2uOVWhagTFJTt24udWTq39BH/hTSHfaj0Hoxm+AT9H1pETiy2Gm9lop3XPBwEsiTzac8
	ekooD0VTQdrlS+SqQxoBlyAPQ9BVddvLtmg80UnPUM/IYYms2dJ3ARbCQBrih1Fli8fzufM3/5q
	xGTGXmyNIbfM97dkTRvC2gQwYhbhQ3xI8nvVNaAZjVC4pASYRKEXF4REmOM09HXI42ea26PFzPx
	kVKK9CTTfMcUah0+ZF9GPFzqv9KYjVWfChDC7Foeyn+Dks+CG8/YquRJCAdbpJePpsgwG8fuvjn
	X24NseHV8mB6B8lV8nFZrEX70QllgnF3hJAJQmTPcCLGiRr4u5lH5RXCpaADUMHPKupYx2uviXu
	fcyDdtAAOGnG4S5jZnxnNlzggIY/n2C6pqGJVvwjtzvx+70nSzhyNornQkzVv11Bgzlrm09DVwp
	g3bSiAxJr5wGB1iDrJFsfkWDCwjMpPQtqSh04Yk+zfKQ
X-Received: by 2002:a05:7022:7f13:b0:144:eab0:9cbc with SMTP id a92af1059eb24-1ac5e8dea62mr15143041c88.37.1793646885926;
        Mon, 02 Nov 2026 11:14:45 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:43::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854d925sm62826454c88.7.2026.11.02.11.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:14:45 -0800 (PST)
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
	daniel@iogearbox.net,
	razor@blackwall.org,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next 6/7] net: devmem: size TX net_iovs from the dmabuf sg table
Date: Mon,  2 Nov 2026 11:14:37 -0800
Message-ID: <20261102191438.1059771-7-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102191438.1059771-1-sdf@fomichev.me>
References: <20261102191438.1059771-1-sdf@fomichev.me>
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
up to 2MB, which aligns every DMA segment of the dmabuf:
- 2MB hugepage-backed udmabufs get 2MB net_iovs
- no UAPI change, TX addresses are dmabuf offsets
- skbs are still bounded by TCP's size_goal, only frags get larger

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
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


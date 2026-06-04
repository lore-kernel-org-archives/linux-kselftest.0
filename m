Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91D321638D
	for <linux-kselftest@vger.kernel.org>; Thu,  4 Jun 2026 00:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780533790; cv=none; b=VKWO+ZzyzhfIh+DlLrhJmIBWB5ahTalpYSqKCBxY8rDE8InpLgOragw0BlIe+E01rJkJNJb6PuGg09YQtms9s40e/SsSz9SXyKR+mgpdRtCQNVyAAC2AAD9ESJj++Ac+J5V3tpcM8XGGdLvVt1lFa4q+P/7nbH/iBOjK4+k5LnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780533790; c=relaxed/simple;
	bh=FGmZPfBI/+gfTbbn4qo1X8ydVMFTuK5Qubrpu7cBrNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KAwzK+3+s660UWrKX+N4S55/uR8AqT9f68e+SOLbdUuZ+G2fSyk/ERAyI24Uvs6qxAysUb65s3g/7zJMPFrXJ/mUFwtYSLn7Yf8akbzddJUpZqbYfYPLH+/826R5uy7Ok/UjTwAmgAvV5QW/rvO4PYGyKdnbPaW0V7SqLNB4SiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z9jR7y/n; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z9jR7y/n"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-842358aaf36so46294b3a.2
        for <linux-kselftest@vger.kernel.org>; Wed, 03 Jun 2026 17:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780533788; x=1781138588; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vsTKuujCl0cTIDmjasTaeO7+rGb2Yh+GT+02Pw0KJmo=;
        b=Z9jR7y/nf2qUO/HoPZMiABndEyuUZTo74mRia3We3WnYmExDCwvXJY6XWCxnjXcf+5
         mLbDiOw+XDkT75TDo386vhgaI4U22ZNlndS+qBfnIc276EakiVpvsRsanLaLyDaSjWgp
         mCcQQRlAy3vEkEjsH+bzA2C5iNsL1LmwNfQCeZkSDCdycnq+Gywh6Wph3lQcrKc4Qsxh
         0CSdJI5TKGijjwSEvV5zdWFFKcV8a9tNvl9EfDIClKO2veuLHWvhP+QnfurW1ZFHIxAe
         zhxVoVwGDAS9PFgkmHeaE2eQKzUMlolihYBdXpukiYrIFGMy8J+oZXcEZlwI8Mz80JwB
         R/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780533788; x=1781138588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vsTKuujCl0cTIDmjasTaeO7+rGb2Yh+GT+02Pw0KJmo=;
        b=tKnQ7s20nhrlE+5jjdHMX7a14fqj0oq2R4A6hAN5vEnKND9BMHoSd3Ja+nKQxzGn15
         h7l2WYCPdzZEmduff7fZRJEOWuPxmJBew4r738+QHW27l8aZlZQkiqfXB2JShUmPmRQa
         yi38Wbb1n2f/6sFpj1gtJuIBO7VVqI0fpxGdmxXGRjChbjo3VmXYNfkTOti7syL2I0yz
         tObyyG0+22bMOhRh4YhuGmbE3mM2B9FOTygyumq2sD4/GtZykqKyPfKKAORLSJMNA6Q2
         PVSTacJQOf73fGtNvyfoXjJ64dG/KeiPmEP5NQV0Ennf5dX6wV0KIQ9teLRjZLYJW5LI
         fpDA==
X-Forwarded-Encrypted: i=1; AFNElJ+sIW6hXO8Q565QsNarLA1TLz6HYmAEhdBHbPcmEKCSBUz60Iogb8+zF18ExC4dxAhqSVFxdgk39EpOcPwTUQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw75V0SNdigTHyVR1YA6u+wlJ2b6GKachuNV22JVbw2E0n8YdyQ
	xAYGlQd+oU3wDEczcYnJrxXb0wlBUh+P7tHZEHVqvVojczerj+i/YI98
X-Gm-Gg: Acq92OHIJjXGQrJ+sUVequfIOO+cxMgfKNAt9S6pmKSIdIfOJKjMYlnUZqbkT++YT7B
	Aret+QZWJ0WuUc7OoJF+RCd/3wNieEOa0nXWaS6oQvQd2fwOXjXOkseKKwA04VI5sh/gAmHMVOY
	Bc0dkdN0H45RG17LuqKNGxji+8msmqLe5IJ+ba2l5Ye2bhyAin/0Nu/toO3PYIRZH8nriwW9HYW
	IXOEvD7ywYwozNR0u+TyjistpEQwfDnr6fp4Y7ZQrrHbyCP0WfZ1OYw5vKYPUMoV25Ee38100zk
	ncUlR14C2BzPM7yI1EeN0ujVkEJ1iV9wnlhTEysShu9Bt2x9+DTXhHvKnIi5OTEScNUGqsUJQRW
	b83SryjoCmTGgFNqsLl9Am+wGPCeKh3uiwWm8RpHeBZSQ44OLzl6Lhov17cPsrKT1ZP20ha9qdz
	/sdOdx+0wr0ndySHsKlU4jvoqVkJnR9w==
X-Received: by 2002:a05:6a00:139e:b0:842:77ab:35c8 with SMTP id d2e1a72fcca58-84284fe7c61mr5429878b3a.44.1780533788133;
        Wed, 03 Jun 2026 17:43:08 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:52::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282372502sm4584728b3a.16.2026.06.03.17.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 17:43:07 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Wed, 03 Jun 2026 17:42:59 -0700
Subject: [PATCH net-next 2/4] udmabuf: emit one sg entry per pinned folio
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-tcpdm-large-niovs-v1-2-f37a4ac6726c@meta.com>
References: <20260603-tcpdm-large-niovs-v1-0-f37a4ac6726c@meta.com>
In-Reply-To: <20260603-tcpdm-large-niovs-v1-0-f37a4ac6726c@meta.com>
To: Donald Hunter <donald.hunter@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org, 
 sdf@fomichev.me, razor@blackwall.org, daniel@iogearbox.net, 
 almasrymina@google.com, matttbe@kernel.org, skhawaja@google.com, 
 dw@davidwei.uk, Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

get_sg_table() emitted one PAGE_SIZE sg entry per page even when the
underlying folio was larger.

Instead, walk folios[] and emit one sg entry per folio. When folios
represent large pages (as is for MFD_HUGETLB), each sg entry is a large
page. Normal PAGE_SIZE sg tables are unchanged.

Required by net/core/devmem to support rx-buf-size > PAGE_SIZE with
udmabuf.

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 drivers/dma-buf/udmabuf.c | 47 ++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 42 insertions(+), 5 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 94b8ecb892bb..f28dd3788ada 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -141,26 +141,63 @@ static void vunmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
 	vm_unmap_ram(map->vaddr, ubuf->pagecount);
 }
 
+/* Return the number of contiguous pages backed by the folio at @i.
+ * A udmabuf may map only part of a folio, or reference the same folio
+ * in multiple non-contiguous runs, so folio_nr_pages() can't be used.
+ */
+static pgoff_t udmabuf_folio_nr_pages(struct udmabuf *ubuf, pgoff_t i)
+{
+	struct folio *f = ubuf->folios[i];
+	pgoff_t j;
+
+	for (j = 1; i + j < ubuf->pagecount; j++) {
+		if (ubuf->folios[i + j] != f)
+			break;
+		/* Same folio, but not a sequential offset within it. */
+		if (ubuf->offsets[i + j] != ubuf->offsets[i] + j * PAGE_SIZE)
+			break;
+	}
+	return j;
+}
+
+/* Count the contiguous folio runs in @ubuf, one sg entry per run. */
+static unsigned int udmabuf_sg_nents(struct udmabuf *ubuf)
+{
+	unsigned int nents = 0;
+	pgoff_t i;
+
+	for (i = 0; i < ubuf->pagecount; i += udmabuf_folio_nr_pages(ubuf, i))
+		nents++;
+	return nents;
+}
+
 static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
 				     enum dma_data_direction direction)
 {
 	struct udmabuf *ubuf = buf->priv;
-	struct sg_table *sg;
 	struct scatterlist *sgl;
-	unsigned int i = 0;
+	struct sg_table *sg;
+	pgoff_t i, run;
+	unsigned int nents;
 	int ret;
 
+	nents = udmabuf_sg_nents(ubuf);
+
 	sg = kzalloc_obj(*sg);
 	if (!sg)
 		return ERR_PTR(-ENOMEM);
 
-	ret = sg_alloc_table(sg, ubuf->pagecount, GFP_KERNEL);
+	ret = sg_alloc_table(sg, nents, GFP_KERNEL);
 	if (ret < 0)
 		goto err_alloc;
 
-	for_each_sg(sg->sgl, sgl, ubuf->pagecount, i)
-		sg_set_folio(sgl, ubuf->folios[i], PAGE_SIZE,
+	sgl = sg->sgl;
+	for (i = 0; i < ubuf->pagecount; i += run) {
+		run = udmabuf_folio_nr_pages(ubuf, i);
+		sg_set_folio(sgl, ubuf->folios[i], run << PAGE_SHIFT,
 			     ubuf->offsets[i]);
+		sgl = sg_next(sgl);
+	}
 
 	ret = dma_map_sgtable(dev, sg, direction, 0);
 	if (ret < 0)

-- 
2.53.0-Meta

